<?php
require_once 'Zend/Db/Adapter/Mysqli.php';

class Base {

	public function __construct() {
		$this->connection = new Zend_Db_Adapter_Mysqli(array(
			'host'     => '192.168.44.200',
			'username' => 'cFullUserPW', // full user. a bit risky.
			'password' => 'c5ul1Use1QP',
			'dbname'   => 'Consulting'
		));
	}
	
	public function aut($t1, $t2) {					
		if (($t1 == 'Emi') && ($t2 == 'emi'))	{
			return 1;			
		} else {
			return 0;			
		};
	}			
	
	public function getCountryList() {	
		$a = array('a'=>"");
		$sqlSr = "SELECT * FROM `Consulting`.`DC_namesCountries` cntr where cntr.isRegion = 0";
		$result = $this->connection->fetchAll($sqlSr);
		array_push($a, $result);		
	    return $result;
	}
	
	public function getDeviceBase($cntryID) {	
		$a = array('a'=>"");
		$sqlSr = 
			"SELECT sessionID, scenarioID, countryID, cntr.namen as countryName,
				deviceID, devn.namen as deviceName, indicatorID,
				Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2012, Y2012
			FROM `Consulting`.`DC_deviceBase` as dvb
				join `Consulting`.DC_namesCountries as cntr on (cntr.id = dvb.countryID)
				join `Consulting`.DC_namesDevices as devn on (devn.id = dvb.deviceID)
			WHERE dvb.countryID = ".$cntryID." 
			  AND dvb.scenarioID = '10001';";
		$result = $this->connection->fetchAll($sqlSr);
		array_push($a, $result);		
	    return $result;
	}	
	
	public function getDemand($cntryID, $batTypeID, $pwrTypeID) {	
		$a = array('a'=>"");
		$sqlSr = 
			"SELECT dmd.scenarioID, dmd.sessionID, cnt.namen as countryName, dvn.namen as deviceName,
				bs.namen as batPwrName, -- dmd.batTypeID, 
				bt.namen as batTypeName, -- dmd.pwrTypeID, 
				Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2012, Y2012
			FROM `Consulting`.`DC_demand` dmd
			JOIN `Consulting`.`DC_namesCountries` as cnt 	ON cnt.id = dmd.countryID				
			JOIN `Consulting`.`DC_namesDevices` as dvn       ON dvn.id = dmd.deviceID			
			JOIN `Consulting`.`DC_namesBatSorts` as bs       ON  bs.id = dmd.pwrTypeID
			JOIN `Consulting`.`DC_namesBatTypes` as bt       ON  bt.id = dmd.batTypeID
			WHERE dmd.countryID = ".$cntryID."
				and dmd.batTypeID = ".$batTypeID."
				and dmd.pwrTypeID = ".$pwrTypeID."
			    and dmd.scenarioID = '10001' ";
		$result = $this->connection->fetchAll($sqlSr);				
		array_push($a, $result);		
		return $result;
	}	
	
	public function updateInputIndicators() {
		// this basically records the input indicators
		// for now - device base split by device types
		// possibly HH penetration, HH number, replacement times etc.
	}	
	
	public function deleteDeviceBase () {
		// delete all records in DC_deviceBase		
		$stmnt = "DELETE FROM `Consulting`.`DC_deviceBaseTable`
				  WHERE sessionID = 1 and scenarioID = 0";
		$result = $this->connection->prepare($stmnt);
		$result->execute();		
		
		$stmnt = "SELECT count(*) as num FROM `Consulting`.`DC_deviceBaseTable`;";
		$result = $this->connection->fetchAll($stmnt);
		return $result[0]['num']; // need to catch an error here
	}

	public function insertDeviceBase () {
		// insert new values from all the tables, that were updated by user input				
		$stmntIns =" 
			INSERT INTO `Consulting`.`DC_deviceBaseTable`
				(`sessionID`,`scenarioID`,`countryID`,`deviceID`, `indicatorID`,
				`Y2000`,`Y2001`,`Y2002`,`Y2003`,`Y2004`,`Y2005`,`Y2006`,`Y2007`,`Y2008`,`Y2009`,
				`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,`Y2015`,`Y2016`,`Y2017`,`Y2018`,`Y2019`,
				`Y2020`,`Y2021`,`Y2022`,`Y2023`,`Y2024`,`Y2025`)
				SELECT 
				`sessionID`,`scenarioID`,`countryID`,`deviceID`, `indicatorID`,
				`Y2000`,`Y2001`,`Y2002`,`Y2003`,`Y2004`,`Y2005`,`Y2006`,`Y2007`,`Y2008`,`Y2009`,
				`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,`Y2015`,`Y2016`,`Y2017`,`Y2018`,`Y2019`,
				`Y2020`,`Y2021`,`Y2022`,`Y2023`,`Y2024`,`Y2025` 
				 FROM `Consulting`.`DC_deviceBase`;";		
		$result = $this->connection->prepare($stmntIns);
		$result->execute();
		
		$stmnt = "SELECT count(*) as num FROM `Consulting`.`DC_deviceBaseTable`;";
		$result = $this->connection->fetchAll($stmnt);
		return $result[0]['num']; // need to catch an error here
	}	
	
	public function getIndicatorNames() {
	// $splitByDevices, $splitByTypes - this is done locally
	// form query depending on detail level needed
		$a = array('a'=>"");
		$stmnt = "
			SELECT * 
			FROM `Consulting`.`DC_namesIndicators`
				WHERE 				 
				-- AND isOutputIndicator = 0 AND
				hasTimeSeries = 1";
		$result = $this->connection->fetchAll($stmnt);		
		array_push($a, $result);		
		return $result;
	}
	
	public function updateDeviceBase() {
		$this->deleteDeviceBase();
		$this->insertDeviceBase();	
		return true;
	}	
	
	public function getOutputData($countryID, $scenarioID) {
		$a = array('a'=>"");
		
		$stmnt = "
		SELECT scenarioID, sessionID, cntry.namen as cntryName, countryID, 
		indis.namen as indiName, indicatorID, 
		Y2004, Y2005, Y2006 FROM (
			SELECT sdm.scenarioID, sdm.sessionID, sdm.countryID, sdm.indicatorID, Y2004, Y2005, Y2006
				FROM `Consulting`.`DC_scenarioDataMacro` as sdm
				WHERE
				-- sdm.countryID = ".$countryID." AND 
				sdm.scenarioID = ".$scenarioID."
			UNION
			SELECT dma.scenarioID, dma.sessionID, dma.countryID, 2080 as indicatorID, Y2004, Y2005, Y2006
				FROM `Consulting`.`DC_demandAggregated` as dma
				WHERE 
				-- dma.countryID = ".$countryID." AND
				dma.scenarioID = ".$scenarioID."
		) as base
		JOIN `Consulting`.`DC_namesCountries` as cntry
			on cntry.id = base.countryID
		JOIN `Consulting`.`DC_namesIndicators` as indis
			on indis.id = base.indicatorID;";
		
		$result = $this->connection->fetchAll($stmnt);		
		array_push($a, $result);		
		return $result;
	}
	
}	
	
?>

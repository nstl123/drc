<?php

require_once 'Zend/Db/Adapter/Mysqli.php';

class Depot21 {

	public function __construct() {
		$this->connection = new Zend_Db_Adapter_Mysqli(array(
			'host'     => '192.168.44.200',
			'username' => 'cFullUserPW', // full user. a bit risky.
			'password' => 'c5ul1Use1QP',
			'dbname'   => 'Consulting'
		));
	}	
	
	public function getMacroDataFormat($n) {
		$a = array();
		for ($i = 0; $i < $n; $i++) {
			$z = array('id'=>$i, 'namen'=>'na');
			array_push($a, $z);
		};
		return $a;
	}
	
	// scenarioProxy data is distinct that uses proxy countries
	public function getMacroData($countryIDs, $indicatorID, $scenarioID, $hasSplit, $typeID, $wNames) {
		$a = array('a'=>"");		
		$countryArray = (array)($countryIDs);		
		$countryList = " (";
		for ($i = 0; $i < count($countryArray); $i++) {
			if ($i > 0) { $countryList = $countryList.", ".$countryArray[$i]; }			
			else $countryList = $countryList.$countryArray[$i];
		}
		$countryList = $countryList." )";
		
		$stmnt = "";
		
		if ($hasSplit == 0) { // hasSplitByTypes		
			$stmnt = "SELECT scenarioID, countryID, indicatorID, deviceID, typeID, unitID,
				Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2011, Y2012, Y2013, Y2014, Y2015,
				Y2016, Y2017, Y2018, Y2019, Y2020, Y2021 ". 
				($wNames > 0 ? ", nc.namen" : ", 'NA'")." AS namen				
			    FROM Consulting.DC_scenarioData sd ".
				($wNames > 0 ? " 
					JOIN Consulting.DC_namesCountries nc 
					ON sd.countryID = nc.id " : "").
			   "WHERE scenarioID IN (".$scenarioID.", 10001) 				
					AND nc.id IN ".$countryList."
					AND indicatorID = ".$indicatorID;				
			if ($indicatorID == 207) {
				$stmnt = $stmnt." AND typeID = ".$typeID;
			};					
		} else { 					
			$joinOn = "";
			switch($indicatorID) {
				case '204': 
					$joinOn = 'battery_size'; break;
				case '205': 
					$joinOn = 'pwr_DPP'; break;
				case '206': 
					$joinOn = 'avg_number'; break;
			};
			
			$stmnt = "SELECT sd.scenarioID, nc.id as countryID, sd.indicatorID, sd.deviceID, typeID, unitID,
				sd.Y2004, sd.Y2005, sd.Y2006, sd.Y2007, sd.Y2008, sd.Y2009, sd.Y2010, sd.Y2011, sd.Y2012, 
				sd.Y2013, sd.Y2014, sd.Y2015, sd.Y2016, sd.Y2017, sd.Y2018, sd.Y2019, sd.Y2020, sd.Y2021,
				nc.namen				
				FROM `Consulting`.`DC_scenarioDataProxy` sd
					JOIN `Consulting`.`DC_namesCountries` nc
				ON sd.countryID = nc.".$joinOn."
				WHERE 
					scenarioID IN (".$scenarioID.", 10001)
					AND nc.id IN ".$countryList." 
					AND sd.indicatorID = ".$indicatorID."
					AND typeID = ".$typeID;					
		}		
		
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return ($stmnt);
	}
	
	public function getDemandData($countryIDs, $scenarioID, $deviceID, $typeID, $pwrID, $isRegion, $showAtDeviceLevel) { 				
		$getWorldData = 0;
		$hasOtherCountries = 0;
		
		$countryArray = (array)($countryIDs);	
		$useCluster = 0;
		($isRegion > 1) ? $useCluster = "cluster" : $useCluster = "region";
	// aggType = 0 for device level, 1 - for country level
		$a = array('a'=>"");							
		$countryList = " (";				
		
		for ($i = 0; $i < count($countryArray); $i++) {		
			if ($countryArray[$i] > 3000) {
				$getWorldData = 1; 
			} else {
				$hasOtherCountries = 1;
				if ($i > 0) $countryList = $countryList.", ".$countryArray[$i]; 
				else 		$countryList = $countryList.$countryArray[$i];
			};
		}
		$countryList = $countryList." )";		
		$stmnt = "";

		if ($hasOtherCountries > 0 ) {	// flag showing there are countries besides World aggregate			
			$stmnt = $stmnt."
				SELECT scenarioID, 301 AS indicatorID, deviceID, devNam.categoryID AS categoryID, batTypeID, pwrTypeID, ".
					($isRegion > 0 ? " rg.namen as namen, rg.id AS countryID, " : "nc.namen AS namen, countryID, ")."					
					sum(Y2004) AS Y2004, sum(Y2005) AS Y2005, sum(Y2006) AS Y2006, sum(Y2007) AS Y2007, 
					sum(Y2008) AS Y2008, sum(Y2009) AS Y2009, sum(Y2010) AS Y2010, sum(Y2011) AS Y2011, 
					sum(Y2012) AS Y2012, sum(Y2013) AS Y2013, sum(Y2014) AS Y2014, sum(Y2015) AS Y2015,
					sum(Y2016) AS Y2016, sum(Y2017) AS Y2017, sum(Y2018) AS Y2018, sum(Y2019) AS Y2019,
					sum(Y2020) AS Y2020, sum(Y2021) AS Y2021
				FROM Consulting.DC_demand AS dm
				JOIN Consulting.DC_namesCountries AS nc ON (dm.countryID = nc.id) ".                    
					($isRegion > 0 ? " JOIN Consulting.DC_namesCountries AS rg ON (nc.".$useCluster." = rg.id)" : "")."				
				JOIN Consulting.DC_namesDevices devNam ON devNam.id = deviceID
				JOIN Consulting.DC_namesDeviceCategories devCat ON devCat.id = devNam.categoryID				
				WHERE scenarioID IN (".$scenarioID.", 10001)".				
					($typeID   > 0 ? " AND batTypeID = ".$typeID  : "").
					($pwrID    > 0 ? " AND pwrTypeID = ".$pwrID   : "").
					($isRegion > 0 ? " AND nc.".$useCluster." " : " AND countryID ")." IN ".$countryList.				
				"GROUP BY scenarioID ".
					($isRegion > 0 ? ", nc.".$useCluster : ", countryID").				
					($typeID   > 0 ? ", batTypeID": "").
					($pwrID    > 0 ? ", pwrTypeID": "");
					if ( ($showAtDeviceLevel  > 0) and ($deviceID > 0)) $stmnt = $stmnt.", deviceID;";
					if ( ($showAtDeviceLevel == 0) and ($deviceID > 0)) $stmnt = $stmnt.", categoryID;";										
		};
		if ($getWorldData > 0) {		
				$stmnt = $stmnt.
					($hasOtherCountries > 0 ? " UNION " : " ")."				
					SELECT scenarioID, 301 AS indicatorID, deviceID, devNam.categoryID AS categoryID, batTypeID, pwrTypeID, ".
						"'World' as namen, 1111 AS countryID, 
						sum(Y2004) AS Y2004, sum(Y2005) AS Y2005, sum(Y2006) AS Y2006, sum(Y2007) AS Y2007, 
						sum(Y2008) AS Y2008, sum(Y2009) AS Y2009, sum(Y2010) AS Y2010, sum(Y2011) AS Y2011, 
						sum(Y2012) AS Y2012, sum(Y2013) AS Y2013, sum(Y2014) AS Y2014, sum(Y2015) AS Y2015,
						sum(Y2016) AS Y2016, sum(Y2017) AS Y2017, sum(Y2018) AS Y2018, sum(Y2019) AS Y2019,
						sum(Y2020) AS Y2020, sum(Y2021) AS Y2021
					FROM Consulting.DC_demand AS dm
					JOIN Consulting.DC_namesCountries AS nc ON (dm.countryID = nc.id) 
					JOIN Consulting.DC_namesDevices devNam ON devNam.id = deviceID
					JOIN Consulting.DC_namesDeviceCategories devCat ON devCat.id = devNam.categoryID
					WHERE scenarioID IN (".$scenarioID.", 10001)".				
						($typeID   > 0 ? " AND batTypeID = ".$typeID  : "").
						($pwrID    > 0 ? " AND pwrTypeID = ".$pwrID   : "").						
				  " GROUP BY scenarioID ".						
						($typeID   > 0 ? ", batTypeID": "").
						($pwrID    > 0 ? ", pwrTypeID": "");
						if ( ($showAtDeviceLevel  > 0) and ($deviceID > 0)) $stmnt = $stmnt.", deviceID;";
						if ( ($showAtDeviceLevel == 0) and ($deviceID > 0)) $stmnt = $stmnt.", categoryID;";								
		};
		
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return $stmnt;		
	}
	
	public function getDeviceBase($countryIDs, $scenarioID) {
		$a = array('a'=>"");		
		$countryArray = (array)($countryIDs);		
		$countryList = " (";
		for ($i = 0; $i < count($countryArray); $i++) {
			if ($i > 0) { $countryList = $countryList.", ".$countryArray[$i]; }			
			else $countryList = $countryList.$countryArray[$i];
		}
		$countryList = $countryList." )";
		
		$stmnt = "
			SELECT scenarioID, countryID, indicatorID, deviceID, namen,
				Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2011, Y2012, Y2013, Y2014, Y2015,
				Y2016, Y2017, Y2018, Y2019, Y2020, Y2021
			FROM Consulting.DC_deviceBaseTable dbt
			JOIN Consulting.DC_namesCountries  nc
				ON dbt.countryID = nc.id
			WHERE scenarioID IN (".$scenarioID.", 10001) 				
				AND countryID IN ".$countryList;				
				//AND deviceID = 1;";
		
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return $countryList;
	}
	
	public function getDemandByChemistry($countryIDs, $scenarioID, $isRegion) {
		$useCluster = 0;
		($isRegion > 1) ? $useCluster = "cluster" : $useCluster = "region";
	
		$a = array('a'=>"");				
		$countryArray = (array)($countryIDs);		
		$countryList = " (";		
		
		for ($i = 0; $i < count($countryArray); $i++) {
			if ($i > 0) $countryList = $countryList.", ".$countryArray[$i]; 
			else 		$countryList = $countryList.$countryArray[$i];
		}
		$countryList = $countryList." )";	
		$stmnt = "
			SELECT scenarioID, 301 AS indicatorID, chm.id as chemistryID, 0 AS deviceID, ". 
				($isRegion > 0 ? " rg.namen as namen, rg.id AS countryID, " : "nc.namen AS namen, dma.countryID, ")."	
				Y2004 * chm.shr as Y2004, Y2005 * chm.shr as Y2005, Y2006 * chm.shr as Y2006, Y2007 * chm.shr as Y2007,  
				Y2008 * chm.shr as Y2008, Y2009 * chm.shr as Y2009, Y2010 * chm.shr as Y2010, Y2011 * chm.shr as Y2011,  
				Y2012 * chm.shr as Y2012, Y2013 * chm.shr as Y2013, Y2014 * chm.shr as Y2014, Y2015 * chm.shr as Y2015,  
				Y2016 * chm.shr as Y2016, Y2017 * chm.shr as Y2017, Y2018 * chm.shr as Y2018, Y2019 * chm.shr as Y2019,  
				Y2020 * chm.shr as Y2020, Y2021 * chm.shr as Y2021  
			FROM `Consulting`.`DC_demandAggregated` dma
				JOIN Consulting.DC_chemistry chm ON  chm.countryID = dma.countryID
			JOIN Consulting.DC_namesCountries AS nc ON (dma.countryID = nc.id) ".                    
				($isRegion > 0 ? " JOIN Consulting.DC_namesCountries AS rg ON (nc.".$useCluster." = rg.id)" : "")."						
			WHERE scenarioID IN (".$scenarioID.", 10001)".				
				($isRegion > 0 ? " AND nc.".$useCluster : " AND dma.countryID ")." IN ".$countryList.	
			"GROUP BY scenarioID, chemistryID ".
				($isRegion > 0 ? ", nc.".$useCluster : ", dma.countryID");
			
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return $stmnt;
	}
	
}		
?>

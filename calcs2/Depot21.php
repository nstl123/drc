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
	
	public function getMacroData($countryIDs, $indicatorID, $scenarioID, $hasSplit, $typeID, $wNames) {
		$a = array('a'=>"");		
		$countryArray = (array)($countryIDs);		
		$countryList = " (";
		for ($i = 0; $i < count($countryArray); $i++) {
			if ($i > 0) { $countryList = $countryList.", ".$countryArray[$i]; }			
			else $countryList = $countryList.$countryArray[$i];
		}
		$countryList = $countryList." )";
		
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
					AND countryID IN ".$countryList."
					AND indicatorID = ".$indicatorID;
				// AND deviceID = ".$deviceID; // for macro should be zero				
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
			
			$stmnt = "SELECT sdp.scenarioID, nc.id as countryID, sdp.indicatorID, sdp.deviceID, 
				sdp.Y2004, sdp.Y2005, sdp.Y2006, sdp.Y2007, sdp.Y2008, sdp.Y2009, sdp.Y2010, sdp.Y2011, sdp.Y2012, 
				sdp.Y2013, sdp.Y2014, sdp.Y2015, sdp.Y2016, sdp.Y2017, sdp.Y2018, sdp.Y2019, sdp.Y2020, sdp.Y2021,
				nc.namen				
				FROM `Consulting`.`DC_scenarioDataProxy` sdp
					JOIN `Consulting`.`DC_namesCountries` nc
				ON sdp.countryID = nc.".$joinOn."
				WHERE 
					nc.id IN ".$countryList." 
					AND sdp.indicatorID = ".$indicatorID."
					AND typeID = ".$typeID."
					AND scenarioID IN (".$scenarioID.", 10001)";
					//AND deviceID = ".$deviceID."
		}		
		
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return ($stmnt);
	}
	
	public function getDemandData($countryIDs, $scenarioID, $deviceID, $typeID, $pwrID, $isRegion) { 
	// aggType = 0 for device level, 1 - for country level
		$a = array('a'=>"");		
		$countryArray = (array)($countryIDs);		
		$countryList = " (";		
		
		for ($i = 0; $i < count($countryArray); $i++) {
			if ($i > 0) { 
				$countryList = $countryList.", ".$countryArray[$i]; 
			}			
			else $countryList = $countryList.$countryArray[$i];
		}
		$countryList = $countryList." )";
		
		$stmnt = "";		
		
		$stmnt = $stmnt."
			SELECT scenarioID, 301 AS indicatorID, deviceID, batTypeID, pwrTypeID, ".
				($isRegion > 0 ? " rg.namen as namen, rg.id AS countryID, " : "nc.namen AS namen, countryID, ")."					
				sum(Y2004) AS Y2004, sum(Y2005) AS Y2005, sum(Y2006) AS Y2006, sum(Y2007) AS Y2007, 
				sum(Y2008) AS Y2008, sum(Y2009) AS Y2009, sum(Y2010) AS Y2010, sum(Y2011) AS Y2011, 
				sum(Y2012) AS Y2012, sum(Y2013) AS Y2013, sum(Y2014) AS Y2014, sum(Y2015) AS Y2015,
				sum(Y2016) AS Y2016, sum(Y2017) AS Y2017, sum(Y2018) AS Y2018, sum(Y2019) AS Y2019,
				sum(Y2020) AS Y2020, sum(Y2021) AS Y2021
			FROM Consulting.DC_demand AS dm
			JOIN Consulting.DC_namesCountries AS nc ON (dm.countryID = nc.id) ".                    
				($isRegion > 0 ? " JOIN Consulting.DC_namesCountries AS rg ON (nc.region = rg.id)" : "")."						
			WHERE scenarioID IN (".$scenarioID.", 10001)".
				($deviceID > 0 ? " AND deviceID = ".$deviceID : "").							
				($typeID   > 0 ? " AND batTypeID = ".$typeID  : "").
				($pwrID    > 0 ? " AND pwrTypeID = ".$pwrID   : "").
				($isRegion > 0 ? " AND nc.region " : " AND countryID ")." IN ".$countryList."
			GROUP BY scenarioID".
				($isRegion > 0 ? ", nc.region" : ", countryID").
				($deviceID > 0 ? ", deviceID" : "").
				($typeID   > 0 ? ", batTypeID": "").
				($pwrID    > 0 ? ", pwrTypeID": "");															
		
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
	
}		
?>

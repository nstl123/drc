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
	
	public function getMacroData($countryIDs, $indicatorID, $scenarioID, $hasSplit) {
		$a = array('a'=>"");		
		$countryArray = (array)($countryIDs);		
		$countryList = " (";
		for ($i = 0; $i < count($countryArray); $i++) {
			if ($i > 0) { $countryList = $countryList.", ".$countryArray[$i]; }			
			else $countryList = $countryList.$countryArray[$i];
		}
		$countryList = $countryList." )";
		
		if (!$hasSplit) { // hasSplitByTypes
			$stmnt = "SELECT scenarioID, countryID, indicatorID, deviceID, typeID, unitID,
				Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2011, Y2012, Y2013, Y2014, Y2015
				FROM Consulting.DC_scenarioData
				WHERE scenarioID IN (".$scenarioID.", 10001) 				
					AND countryID IN ".$countryList."
					AND indicatorID = ".$indicatorID."
					AND deviceID in (0, 1);";			
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
				sdp.Y2013, sdp.Y2014, sdp.Y2015
				FROM `Consulting`.`DC_scenarioDataProxy` sdp
					JOIN `Consulting`.`DC_namesCountries` nc
				ON sdp.countryID = nc.".$joinOn."
				WHERE 
					nc.id IN ".$countryList." 
					AND sdp.indicatorID = ".$indicatorID." 
					AND deviceID = 1
					AND typeID = 1
					AND scenarioID IN (".$scenarioID.", 10001)";
		}		
		
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return $stmnt;
	}
	
	public function getDemandData($countryIDs, $scenarioID) {
		$a = array('a'=>"");		
		$countryArray = (array)($countryIDs);		
		$countryList = " (";
		for ($i = 0; $i < count($countryArray); $i++) {
			if ($i > 0) { $countryList = $countryList.", ".$countryArray[$i]; }			
			else $countryList = $countryList.$countryArray[$i];
		}
		$countryList = $countryList." )";
		
		$stmnt = "SELECT scenarioID, countryID, 208 AS indicatorID, deviceID, batTypeID, pwrTypeID,
			Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2011, Y2012, Y2013, Y2014, Y2015
			FROM Consulting.DC_demand
			WHERE scenarioID IN (".$scenarioID.", 10001) 				
				AND countryID IN ".$countryList."				
				AND deviceID = 1 AND batTypeID = 1 AND pwrTypeID = 1;";
		
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return $countryList;
	}
	
}		
?>

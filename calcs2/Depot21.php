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
	
	public function getMacroData($countryIDs, $indicatorID, $scenarioID, $hasSplit, $deviceID, $typeID) {
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
				Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2011, Y2012, Y2013, Y2014, Y2015
				FROM Consulting.DC_scenarioData
				WHERE scenarioID IN (".$scenarioID.", 10001) 				
					AND countryID IN ".$countryList."
					AND indicatorID = ".$indicatorID."
					AND deviceID = ".$deviceID; // for macro should be zero				
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
				sdp.Y2013, sdp.Y2014, sdp.Y2015
				FROM `Consulting`.`DC_scenarioDataProxy` sdp
					JOIN `Consulting`.`DC_namesCountries` nc
				ON sdp.countryID = nc.".$joinOn."
				WHERE 
					nc.id IN ".$countryList." 
					AND sdp.indicatorID = ".$indicatorID." 
					AND deviceID = ".$deviceID."
					AND typeID = ".$typeID."
					AND scenarioID IN (".$scenarioID.", 10001)";
		}		
		
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return ($stmnt);
	}
	
	public function getDemandData($countryIDs, $scenarioID, $aggType, $deviceID, $typeID, $pwrID, $isRegion) { 
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
		
		if ($aggType == 0) {			
			if ($isRegion == 0) {
					$stmnt = $stmnt."
						SELECT scenarioID, countryID, 301 AS indicatorID, deviceID, batTypeID, pwrTypeID,
							sum(Y2004) AS Y2004, sum(Y2005) AS Y2005, sum(Y2006) AS Y2006, sum(Y2007) AS Y2007, 
							sum(Y2008) AS Y2008, sum(Y2009) AS Y2009, sum(Y2010) AS Y2010, sum(Y2011) AS Y2011, 
							sum(Y2012) AS Y2012, sum(Y2013) AS Y2013, sum(Y2014) AS Y2014, sum(Y2015) AS Y2015
						FROM Consulting.DC_demand
						WHERE scenarioID IN (".$scenarioID.", 10001)".
							($deviceID > 0 ? " AND deviceID = ".$deviceID : "").							
							($typeID   > 0 ? " AND batTypeID = ".$typeID  : "").
							($pwrID    > 0 ? " AND pwrTypeID = ".$pwrID   : "")."
							AND countryID IN ".$countryList."
						GROUP BY scenarioID, countryID".
							($deviceID > 0 ? ", deviceID" : "").
							($typeID   > 0 ? ", batTypeID": "").
							($pwrID    > 0 ? ", pwrTypeID": "");							
			} else {
					$stmnt = $stmnt."
						SELECT scenarioID,  nc.region as countryID, 301 AS indicatorID, deviceID, batTypeID, pwrTypeID,
							sum(Y2004) AS Y2004, sum(Y2005) AS Y2005, sum(Y2006) AS Y2006, sum(Y2007) AS Y2007, 
							sum(Y2008) AS Y2008, sum(Y2009) AS Y2009, sum(Y2010) AS Y2010, sum(Y2011) AS Y2011, 
							sum(Y2012) AS Y2012, sum(Y2013) AS Y2013, sum(Y2014) AS Y2014, sum(Y2015) AS Y2015
						FROM Consulting.DC_demand AS dm
						JOIN Consulting.DC_namesCountries as nc ON (dm.countryID = nc.id)                    
						WHERE scenarioID IN (".$scenarioID.", 10001)".
							($deviceID > 0 ? " AND deviceID  = ".$deviceID : "").
							($typeID   > 0 ? " AND batTypeID = ".$typeID  : "").
							($pwrID    > 0 ? " AND pwrTypeID = ".$pwrID   : "")."
							AND region IN ".$countryList."
						GROUP BY scenarioID, region".
							($deviceID > 0 ? ", deviceID" : "").
							($typeID   > 0 ? ", batTypeID": "").
							($pwrID    > 0 ? ", pwrTypeID": "");
			};						
		} else if ($aggType == 1) {			
			if ($isRegion == 0) {
				$stmnt = "
					SELECT scenarioID, countryID, 302 AS indicatorID, 0 as deviceID, 0 as batTypeID, 0 as pwrTypeID,
						sum(Y2004) AS Y2004, sum(Y2005) AS Y2005, sum(Y2006) AS Y2006, sum(Y2007) AS Y2007, 
						sum(Y2008) AS Y2008, sum(Y2009) AS Y2009, sum(Y2010) AS Y2010, sum(Y2011) AS Y2011, 
						sum(Y2012) AS Y2012, sum(Y2013) AS Y2013, sum(Y2014) AS Y2014, sum(Y2015) AS Y2015
					FROM Consulting.DC_demandAggregated
					WHERE scenarioID IN (".$scenarioID.", 10001) 				
						AND countryID IN ".$countryList."
						GROUP BY countryID, scenarioID";
			} else {
				$stmnt = "
					SELECT scenarioID,  nc.region as countryID, 302 AS indicatorID, 0 as deviceID, 0 as batTypeID, 0 as pwrTypeID,
						sum(Y2004) AS Y2004, sum(Y2005) AS Y2005, sum(Y2006) AS Y2006, sum(Y2007) AS Y2007, 
						sum(Y2008) AS Y2008, sum(Y2009) AS Y2009, sum(Y2010) AS Y2010, sum(Y2011) AS Y2011, 
						sum(Y2012) AS Y2012, sum(Y2013) AS Y2013, sum(Y2014) AS Y2014, sum(Y2015) AS Y2015
					FROM Consulting.DC_demandAggregated AS dma
					JOIN Consulting.DC_namesCountries as nc ON (dma.countryID = nc.id)                    
					WHERE scenarioID IN (".$scenarioID.", 10001) 				
						AND region IN ".$countryList." 
						GROUP BY region, scenarioID";			
			}						
		} else {
			return "error in  aggType parameters";
			exit;
		}
		
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
		
		$stmnt = "SELECT scenarioID, countryID, indicatorID, deviceID, 
			Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2011, Y2012, Y2013, Y2014, Y2015
			FROM Consulting.DC_deviceBaseTable
			WHERE scenarioID IN (".$scenarioID.", 10001) 				
				AND countryID IN ".$countryList."				
				AND deviceID = 1;";
		
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return $countryList;
	}
	
}		
?>

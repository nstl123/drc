<?php

require_once 'Zend/Db/Adapter/Mysqli.php';

class Depot21 {

	//public var $perHHmultiplier;
	
	public function __construct() {
		$this->connection = new Zend_Db_Adapter_Mysqli(array(
			'host'     => '192.168.44.200',
			'username' => 'cFullUserPW', // full user. a bit risky.
			'password' => 'c5ul1Use1QP',
			'dbname'   => 'Consulting'
		));
		$this->perHHmultiplier = 1000;		
	}	
	
	public function getMacroDataFormat($n) {
		$a = array();
		for ($i = 0; $i < $n; $i++) {
			$z = array('id'=>$i, 'namen'=>'na');
			array_push($a, $z);
		};
		return $a; //$this->perHHmultiplier;
	}
	
	// scenarioProxy data is distinct in that it uses proxy countries
	public function getMacroData($countryIDs, $indicatorID, $scenarioID, $hasSplit, $typeID, $wNames) {
		$a = array('a'=>"");		
		$countryArray = explode(",", $countryIDs); //(array)($countryIDs);		
		$countryList = " (";
		for ($i = 0; $i < count($countryArray); $i++) {
			if ($i > 0) { $countryList = $countryList.", ".$countryArray[$i]; }			
			else $countryList = $countryList.$countryArray[$i];
		}
		$countryList = $countryList." )";
		
		$stmnt = ""; $selfields = ""; $sumStmnt = "";
		
		for ($u = 2006;  $u < 2022; $u++) {			
			$sumStmnt = $sumStmnt."sd.Y".$u.",";			
		};
		
		$selFields = "sd.scenarioID, sd.indicatorID, sd.deviceID, sd.typeID, sd.unitID, 0 AS categoryID,";			
		
		if ($hasSplit == 0) {		
			$stmnt = "SELECT ".$selFields." countryID, ".$sumStmnt. 
				($wNames > 0 ? " nc.namen" : ", 'NA'")." AS namen				
				FROM Consulting.DC_scenarioData sd ".
				($wNames > 0 ? "\r\n JOIN Consulting.DC_namesCountries nc 
						ON sd.countryID = nc.id " : "").
				"WHERE scenarioID IN (".$scenarioID.", 10001) 				
						AND nc.id IN ".$countryList."
						AND indicatorID = ".$indicatorID;				
				if ($indicatorID == 207) {
					$stmnt = $stmnt." AND typeID = ".$typeID;
				};								
		} else {
			$stmnt = "SELECT ".$selFields.$sumStmnt." nc.namen, nc.id as countryID 
				FROM `Consulting`.`DC_scenarioDataProxy` sd
				JOIN `Consulting`.`DC_namesCountries` nc
				ON sd.countryID = nc.id
				WHERE 	scenarioID IN (".$scenarioID.", 10001)
						AND nc.id IN ".$countryList." 
						AND sd.indicatorID = ".$indicatorID."
						AND typeID = ".$typeID;					
		};		
		
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return ($stmnt);
	}
	
	// scenarioProxy data is distinct that uses proxy countries
	public function getMacroDataCategory($countryIDs, $indicatorID, $scenarioID, $hasSplit, $typeID, $wNames) {
		$a = array('a'=>"");		
		$countryArray = explode(",", $countryIDs);		
		$countryList = " (";
		for ($i = 0; $i < count($countryArray); $i++) {
			if ($i > 0) { $countryList = $countryList.", ".$countryArray[$i]; }			
			else $countryList = $countryList.$countryArray[$i];
		}
		$countryList = $countryList." )";
		
		$stmnt = ""; $selfields = ""; $sumStmnt = "";
		
		for ($u = 2006;  $u < 2022; $u++) {			
			$sumStmnt = $sumStmnt.$this->perHHmultiplier." * sum(sdt.Y".$u." * wdb.Y".$u.") AS Y".$u.",";			
		};
		
		$selFields = "SELECT sdt.scenarioID, sdt.indicatorID,  nmd.categoryID AS deviceID, sdt.typeID, ";		
		
		if ($hasSplit == 0) { // hasSplitByTypes		
			$stmnt = $selFields.$sumStmnt. 
				($wNames > 0 ? "nc.namen" : ", 'NA'")." AS namen, sdt.countryID
				FROM Consulting.DC_scenarioData sdt
				JOIN Consulting.DC_weigthsFromDeviceBase wdb
					ON (wdb.countryID = sdt.countryID AND wdb.deviceID = sdt.deviceID)".
				($wNames > 0 ? " \r\n JOIN Consulting.DC_namesCountries nc 
						ON sdt.countryID = nc.id " : "")."
					JOIN Consulting.DC_namesDevices nmd
						ON (nmd.id = sdt.deviceID)					   
				   WHERE sdt.scenarioID IN (".$scenarioID.", 10001) 				
						AND nc.id IN ".$countryList."
						AND sdt.indicatorID = ".$indicatorID;				
			if ($indicatorID == 207) {
				$stmnt = $stmnt." AND sdt.typeID = ".$typeID;
			};								
		} else { 									
			$stmnt = $selFields.$sumStmnt." nc.namen, nc.id as countryID				
				FROM `Consulting`.`DC_scenarioDataProxy` sdt				
					JOIN `Consulting`.`DC_namesCountries` nc
						ON sdt.countryID = nc.id
					JOIN Consulting.DC_weigthsFromDeviceBase wdb
						ON (wdb.countryID = nc.id AND wdb.deviceID = sdt.deviceID)
					JOIN Consulting.DC_namesDevices nmd
						ON (nmd.id = sdt.deviceID)			
				WHERE 
					sdt.scenarioID IN (".$scenarioID.", 10001)
					AND nc.id IN ".$countryList." 
					AND sdt.indicatorID = ".$indicatorID."
					AND sdt.typeID = ".$typeID;					
		};
		$stmnt = $stmnt."
				GROUP BY sdt.scenarioID, sdt.countryID, sdt.indicatorID, nmd.categoryID, typeID";				
		
		$sumStmnt2 = "";
		for ($u = 2006;  $u < 2022; $u++) { $sumStmnt2 = $sumStmnt2."sd.Y".$u.","; };		
		$selFields2 = "sd.scenarioID, sd.indicatorID, sd.deviceID, sd.typeID, ";					
		if ($hasSplit == 0) {		
			$stmnt2 = "SELECT ".$selFields2.$sumStmnt2.
				($wNames > 0 ? " nc.namen" : ", 'NA'")." AS namen, countryID 				
				FROM Consulting.DC_scenarioData sd ".
				($wNames > 0 ? "\r\n JOIN Consulting.DC_namesCountries nc 
						ON sd.countryID = nc.id " : "").
				"WHERE scenarioID IN (".$scenarioID.", 10001) 				
						AND nc.id IN ".$countryList."
						AND indicatorID = ".$indicatorID;				
				if ($indicatorID == 207) {
					$stmnt2 = $stmnt2." AND typeID = ".$typeID;
				};								
		} else {
			$stmnt2 = "SELECT ".$selFields2.$sumStmnt2." nc.namen, nc.id as countryID 
				FROM `Consulting`.`DC_scenarioDataProxy` sd
				JOIN `Consulting`.`DC_namesCountries` nc
				ON sd.countryID = nc.id
				WHERE 	scenarioID IN (".$scenarioID.", 10001)
						AND nc.id IN ".$countryList." 
						AND sd.indicatorID = ".$indicatorID."
						AND typeID = ".$typeID;					
		};				
		$mainStmnt = $stmnt."\r\n UNION \r\n".$stmnt2;		
		$result = $this->connection->fetchAll($mainStmnt); 
		array_push($a, $result);		
		return $result;
		//return ($mainStmnt);
	}
	
	public function getDemandData($countryIDs, $scenarioID, $typeID, $pwrID, $isRegion, $showAtDeviceLevel, $perHH) { 				
		$getWorldData = 0;
		$hasOtherCountries = 0;
		
		$countryArray = explode(",", $countryIDs); // (array)($countryIDs);			
		$useCluster = 0; // isRegion could be: 0 - countries, 1 - regions, 2 - clusters;
		($isRegion > 1) ? $useCluster = "cluster" : $useCluster = "region";
		// aggType = 0 for device level, 1 - for country level
		$a = array('a'=>"");							
		$countryList = " (";				
		
		for ($i = 0; $i < count($countryArray); $i++) {		
			if ($countryArray[$i] < 10000) {
				$hasOtherCountries = 1;
				if ($i > 0)  $countryList = $countryList.", ".$countryArray[$i]; 
				else 		 $countryList = $countryList.$countryArray[$i]; 
			} else {
				$getWorldData = 1;
			}			
		};	
		
		$countryList = $countryList." )";		
		$stmnt = "";
		
		$sumStmnt = "";
		for ($u = 2006; $u < 2022; $u++) {
			if ((($u - 2006) % 3) == 0) $sumStmnt = $sumStmnt."\r\n";
			if ($perHH > 0) {
				$sumStmnt = $sumStmnt.", ".$this->perHHmultiplier." * sum( dm.Y".$u." / sdt.Y".$u." ) AS Y".$u;
			} else {
				$sumStmnt = $sumStmnt.", sum(dm.Y".$u.") AS Y".$u;
			};			
		};			
		
		$samePart = ", dm.scenarioID, 301 AS indicatorID, batTypeID, pwrTypeID".				
			($isRegion > 0 ? ", rg.namen as namen, rg.id AS countryID" : ", nc.namen AS namen, dm.countryID").	
				$sumStmnt."
			FROM Consulting.DC_demand AS dm
			JOIN Consulting.DC_namesCountries AS nc ON (dm.countryID = nc.id) ".                    
				($isRegion > 0 ? " JOIN Consulting.DC_namesCountries AS rg ON (nc.".$useCluster." = rg.id)" : "")."				
			JOIN Consulting.DC_namesDevices devNam ON devNam.id = deviceID
			JOIN Consulting.DC_namesDeviceCategories devCat ON devCat.id = devNam.categoryID					
			".($perHH > 0 ? "JOIN Consulting.DC_scenarioData sdt ON ((sdt.countryID = dm.countryID) AND (sdt.scenarioID = dm.scenarioID))" : "")."
			WHERE dm.scenarioID IN (".$scenarioID.", 10001)".				
				($typeID   > 0 ? " AND batTypeID = ".$typeID  : "").($pwrID    > 0 ? " AND pwrTypeID = ".$pwrID   : "").
				($isRegion > 0 ? " AND nc.".$useCluster." " : " AND dm.countryID ")." IN ".$countryList.
				($perHH    > 0 ? " AND sdt.indicatorID = 101" : "")."
			GROUP BY scenarioID ".
				($isRegion > 0 ? ", nc.".$useCluster : ", countryID").($typeID   > 0 ? ", batTypeID": "").
				($pwrID    > 0 ? ", pwrTypeID": "");
		
		$stmntDevices    = "dm.deviceID 	  AS deviceID"; $stmntCategories = "devNam.categoryID AS deviceID";	
		$stmntNull       = "0 				  AS deviceID";	$mainStmnt = "";
		
		if ($hasOtherCountries > 0) {	// flag showing there are countries besides World aggregate			
			if ($showAtDeviceLevel == 0) $mainStmnt = "SELECT ".$stmntNull.$samePart;
			if ($showAtDeviceLevel  > 0) $mainStmnt = "SELECT ".$stmntDevices.$samePart.", deviceID";
			
			if ($showAtDeviceLevel  > 0) {
				$mainStmnt = $mainStmnt."\r\nUNION\r\n";		
				$mainStmnt = $mainStmnt."SELECT ".$stmntCategories.$samePart.", categoryID";			
			};
		};
		
		$sameWorldPart = ", dm.scenarioID, 301 AS indicatorID, batTypeID, pwrTypeID, 'World' as namen, 1111 AS countryID".
					$sumStmnt."\r\n".
					"FROM Consulting.DC_demand AS dm
					JOIN Consulting.DC_namesCountries AS nc ON (dm.countryID = nc.id) 
					JOIN Consulting.DC_namesDevices devNam ON devNam.id = deviceID
					JOIN Consulting.DC_namesDeviceCategories devCat ON devCat.id = devNam.categoryID".
					($perHH > 0 ? "\r\nJOIN Consulting.DC_scenarioData sdt ON ((sdt.countryID = dm.countryID) AND (sdt.scenarioID = dm.scenarioID))" : "").
				"\r\nWHERE dm.scenarioID IN (".$scenarioID.", 10001)".				
						($typeID   > 0 ? " AND batTypeID = ".$typeID  : "").($pwrID    > 0 ? " AND pwrTypeID = ".$pwrID   : "").
						($perHH    > 0 ? " AND sdt.indicatorID = 101" : "")."						
				    GROUP BY scenarioID ".						
						($typeID   > 0 ? ", batTypeID": "").
						($pwrID    > 0 ? ", pwrTypeID": "");
		
		if ($getWorldData > 0) {		
				$mainStmnt = $mainStmnt.($hasOtherCountries > 0 ? "\r\nUNION\r\n" : " ");
				
				if ($showAtDeviceLevel == 0) $mainStmnt = $mainStmnt."SELECT ".$stmntNull.$sameWorldPart;
				if ($showAtDeviceLevel  > 0) $mainStmnt = $mainStmnt."SELECT ".$stmntDevices.$sameWorldPart.", deviceID";
				
				if ($showAtDeviceLevel  > 0) {
					$mainStmnt = $mainStmnt."\r\nUNION\r\n";		
					$mainStmnt = $mainStmnt."SELECT ".$stmntCategories.$sameWorldPart.", categoryID";			
				};								
		};
		
		$result = $this->connection->fetchAll($mainStmnt); 
		array_push($a, $result);		
		return $result;	
		//return $mainStmnt;
		//return $countryArray[1];
		//return $hasOtherCountries;		
	}
	
	public function getDeviceBase($countryIDs, $scenarioID, $pwrType, $isRegion, $showAtDeviceLevel, $perHH) {
		$a = array('a'=>"");		
		$countryArray = explode(",", $countryIDs); //(array)($countryIDs);	
		$useCluster = 0; // isRegion could be: 0 - countries, 1 - regions, 2 - clusters;
		($isRegion > 1) ? $useCluster = "cluster" : $useCluster = "region";
	
		$countryList = " (";
		for ($i = 0; $i < count($countryArray); $i++) {
			if ($i > 0) { $countryList = $countryList.", ".$countryArray[$i]; }			
			else $countryList = $countryList.$countryArray[$i];
		}
		$countryList = $countryList." )";
// --- summing statement formation BEGIN ---	
		$sumStmnt = "";
		for ($u = 2006; $u < 2022; $u++) {
			if ((($u - 2006) % 3) == 0) {	$sumStmnt = $sumStmnt."\r\n";	};
			if (($perHH > 0) && ($pwrType > 0)) {
				$sumStmnt = $sumStmnt.", ".$this->perHHmultiplier." * sum( dbt.Y".$u." * sdp.Y".$u." ) / ( sdt.Y".$u." ) AS Y".$u;
			} else if ($pwrType > 0) {
				$sumStmnt = $sumStmnt.", sum( dbt.Y".$u." * sdp.Y".$u." )/100 AS Y".$u;
			} else if ($perHH > 0) {
				$sumStmnt = $sumStmnt.", ".$this->perHHmultiplier." * sum( dbt.Y".$u.") / ( sdt.Y".$u." ) AS Y".$u;
			} else {
				$sumStmnt = $sumStmnt.", sum( dbt.Y".$u." ) AS Y".$u;
			};			
		};		
// --- summing statement formation END ---		
		$joinOn = "id";
		$stmntDevices    = "dbt.deviceID 	  AS deviceID"; $stmntCategories = "devNam.categoryID AS deviceID";	
		$stmntNull       = "0 				  AS deviceID";	$mainStmnt = "";
			
		$samePart= "\r\n , dbt.scenarioID, dbt.indicatorID".
				($pwrType  > 0 ? ", sdp.indicatorID, sdp.typeID " : ", 0 as indicatorID, 0 as typeID").
				($isRegion > 0 ? ", rg.namen as namen, rg.id AS countryID" : ", nc.namen AS namen, dbt.countryID").
				$sumStmnt."\r\n	FROM Consulting.DC_deviceBaseTable dbt
			JOIN Consulting.DC_namesCountries nc ON dbt.countryID = nc.id".    
					($isRegion > 0 ? " JOIN Consulting.DC_namesCountries AS rg ON (nc.".$useCluster." = rg.id)" : "")."				
			JOIN Consulting.DC_namesDevices devNam ON devNam.id = dbt.deviceID
			JOIN Consulting.DC_namesDeviceCategories devCat ON devCat.id = devNam.categoryID	
				".($perHH   > 0 ? "\r\n JOIN Consulting.DC_scenarioData sdt 
					ON ((sdt.countryID = dbt.countryID) AND (sdt.scenarioID = dbt.scenarioID))" : "").
				($pwrType > 0 ? "\r\n JOIN Consulting.DC_scenarioDataProxy sdp
					ON  (sdp.countryID = nc.".$joinOn.") AND (sdp.deviceID  = dbt.deviceID)	AND (sdp.scenarioID = dbt.scenarioID)" : "")."			
			WHERE dbt.scenarioID IN (".$scenarioID.", 10001)".
				($pwrType  > 0 ? " AND sdp.indicatorID = 205 AND sdp.typeID = ".$pwrType : "").
				($perHH    > 0 ? " AND sdt.indicatorID = 101" : "").
				($isRegion > 0 ? " AND nc.".$useCluster : " AND nc.id")." IN ".$countryList."		
			GROUP BY \r\n dbt.scenarioID".
				($isRegion > 0 ? ", nc.".$useCluster : ", dbt.countryID").				
				($pwrType  > 0 ? ", typeID" : "");
								

		if ($showAtDeviceLevel == 0) $mainStmnt = "SELECT ".$stmntNull.$samePart;
		if ($showAtDeviceLevel  > 0) $mainStmnt = "SELECT ".$stmntDevices.$samePart.", deviceID";
		
		if ($showAtDeviceLevel  > 0) {
			$mainStmnt = $mainStmnt."\r\nUNION\r\n";		
			$mainStmnt = $mainStmnt."SELECT ".$stmntCategories.$samePart.", categoryID";			
		};		
			
		$result = $this->connection->fetchAll($mainStmnt); 
		array_push($a, $result);		
		return $result;
		//return $mainStmnt;
	}
	
	public function getDemandByChemistry($countryIDs, $scenarioID, $isRegion, $perHH) {
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
		
		$sumStmnt = "";
		
		for ($u = 2006; $u < 2022; $u++) {
			if ((($u - 2006) % 3) == 0) $sumStmnt = $sumStmnt."
				";
			if ($perHH > 0) {
				$sumStmnt = $sumStmnt.", ".$this->perHHmultiplier." * sum(dma.Y".$u." * chm.shr)/sum(sdt.Y".$u.") as Y".$u;
			} else {
				$sumStmnt = $sumStmnt.", sum(dma.Y".$u." * chm.shr) as Y".$u;
			};			
		};		
		
		$stmnt = "
			SELECT dma.scenarioID, 301 AS indicatorID, chm.id as chemistryID, 0 AS deviceID, 0 as categoryID". 
				($isRegion > 0 ? ", rg.namen as namen, rg.id AS countryID, " : ", nc.namen AS namen, dma.countryID").
				 $sumStmnt."
			FROM Consulting.DC_demandAggregated dma
				JOIN Consulting.DC_chemistry chm ON  chm.countryID = dma.countryID
			JOIN Consulting.DC_namesCountries AS nc ON (dma.countryID = nc.id) ".                    
				($isRegion > 0 ? " JOIN Consulting.DC_namesCountries AS rg ON (nc.".$useCluster." = rg.id)" : "").
			    ($perHH    > 0 ? "
					JOIN Consulting.DC_scenarioData sdt 
					ON ((sdt.countryID = dma.countryID) AND (sdt.scenarioID = dma.scenarioID))" : "")."					
			WHERE dma.scenarioID IN (".$scenarioID.", 10001)".				
				($isRegion > 0 ? " AND nc.".$useCluster : " AND dma.countryID ")." IN ".$countryList.
				($perHH    > 0 ? " AND sdt.indicatorID = 101" : "")."				
			GROUP BY dma.scenarioID, chemistryID ".
				($isRegion > 0 ? ", nc.".$useCluster : ", dma.countryID");
			
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return $stmnt;
	}		
}		
?>
<?php

require_once 'Zend/Db/Adapter/Mysqli.php';
require_once 'Depot5_sqlFormation.php';

class Depot21 {

	//public var $perHHmultiplier;
	
	public function __construct() {
		$this->connection = new Zend_Db_Adapter_Mysqli(array(
			'host'     => '192.168.44.200',
			'username' => 'cFullUserPW', // full user. a bit risky.
			'password' => 'c5ul1Use1QP',
			'dbname'   => 'Consulting'
		));
		$this->perHHmultiplier = 1;		
	}	
	
	public function getMacroDataFormat($n) {
		$a = array();
		for ($i = 0; $i < $n; $i++) {
			$z = array('id'=>$i, 'namen'=>'na');
			array_push($a, $z);
		};
		return $a; //$this->perHHmultiplier;
	}
	
	// this function below is obsolete.
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
		
		/*$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;*/
		return ($stmnt);
	}
	
	// scenarioProxy data is distinct that uses proxy countries
	public function getMacroDataCategory($countryIDs, $indicatorID, $scenarioID, $hasSplit, $typeID, $wNames) {		
		$rawText =  new Depot5_sqlFormation();
		$mainStmnt = $rawText->formGetMacroCategory($countryIDs, $indicatorID, $scenarioID, $hasSplit, $typeID, $wNames, false, false);
		
		$a = array('a'=>"");		
		$result = $this->connection->fetchAll($mainStmnt); 
		array_push($a, $result);	
		return $result;		
		//return $mainStmnt;
	}
	
	public function getDemandData($countryIDs, $scenarioID, $typeID, $pwrID, $isRegion, $showAtDeviceLevel, $perHH) { 				
		$getWorldData = 0; $hasOtherCountries = 0;
		
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
		
		$sumStmnt = ""; $sumStmntPop=""; $sumStmntInner=""; $sumStmntOuter=""; $mainStmnt="";
		
		$addSum = ($isRegion > 0 ? "sum" : "");
		for ($u = 2006; $u < 2022; $u++) {	
			//if ($u % 3 == 0) { $sumStmntInner = $sumStmnt."\r\n"; $sumStmntPop = $sumStmntPop."\r\n"; };			
			if ($perHH > 0) {			
				$sumStmntInner = $sumStmntInner.", sum(dm.Y".$u.") AS dmY".$u;
				$sumStmntPop   = $sumStmntPop.", sdt.Y".$u." AS popY".$u;				
				
				$sumStmntOuter = $sumStmntOuter.", ".$this->perHHmultiplier." * ".$addSum."(dmY".$u.") / ".$addSum."(popY".$u.") AS Y".$u;
			} else {
				$sumStmntInner = $sumStmntInner.", sum(dm.Y".$u.") AS dmY".$u;
				$sumStmntPop   = $sumStmntPop.",  sdt.Y".$u." AS popY".$u;				
				
				$sumStmntOuter = $sumStmntOuter.", ".$addSum."(dmY".$u.")  AS Y".$u;
			}
		};					
		
		$coreStmntEnd = "";
		$cntryNameFields = ($isRegion > 0 ? "rg.namen " : "nc.namen ")." AS countryName, dm.countryID AS countryID";
		$globalNameFields = "'World' AS countryName, 11111 AS countryID";
		$cntryLevelWhereFields = " AND ".($isRegion > 0 ? "nc.".$useCluster : "dm.countryID")." IN ".$countryList;
		$cntryLevelGroupFields = " GROUP BY scenarioID, indicatorID, dm.countryID ";
		
		$coreStmnt = ", dm.scenarioID, 301 AS indicatorID, dm.deviceID as deviceID, devNam.namen AS deviceName,	
				    devCat.id as categoryID, devCat.namen as categoryName, nc.".$useCluster." as regionID".
				   ($typeID   > 0 ? ", batTypeID" : ", 0 as batTypeID").($pwrID > 0 ? ", pwrTypeID" : ", 0 as pwrTypeID").
					"\r\n".$sumStmntInner."\r\n".$sumStmntPop."					
				FROM Consulting.DC_demand AS dm
					JOIN Consulting.DC_namesCountries AS nc ON (dm.countryID = nc.id)  
						JOIN Consulting.DC_namesCountries AS rg ON (nc.".$useCluster." = rg.id)			
					JOIN Consulting.DC_namesDevices devNam ON devNam.id = deviceID
					JOIN Consulting.DC_namesDeviceCategories devCat ON devCat.id = devNam.categoryID					
					JOIN Consulting.DC_scenarioData sdt ON ((sdt.countryID = dm.countryID) AND (sdt.scenarioID = dm.scenarioID))
				WHERE dm.scenarioID IN (10001, ".$scenarioID.") AND sdt.indicatorID = 101".
				($typeID > 0 ? " AND batTypeID = ".$typeID : "").($pwrID > 0 ? " AND pwrTypeID = ".$pwrID : "");				
				
		$selFields = "scenarioID,  indicatorID, deviceName, categoryName, countryID, countryName, regionID \r\n".
					($typeID > 0 ? ", batTypeID" : ", 0 as batTypeID").($pwrID > 0 ? ", pwrTypeID" : ", 0 as pwrTypeID"); 
						
		if ($hasOtherCountries > 0) {
			if ($showAtDeviceLevel > 0) {				
				$coreStmntEnd = "SELECT ".$cntryNameFields.$coreStmnt.$cntryLevelWhereFields.$cntryLevelGroupFields.", deviceID";	
				$mainStmnt = "SELECT deviceID, ".$selFields."\r\n".$sumStmntOuter."\r\n FROM (".$coreStmntEnd.") AS a 
					 GROUP BY scenarioID, indicatorID, ".($isRegion > 0 ? "regionID" : "countryID");								
				$mainStmnt = $mainStmnt.", deviceID";		
				
				$mainStmnt = $mainStmnt."\r\n UNION \r\n";
				$coreStmntEnd = "SELECT ".$cntryNameFields.$coreStmnt.$cntryLevelWhereFields.$cntryLevelGroupFields.", categoryID";								
				$mainStmnt = $mainStmnt."SELECT "."categoryID AS deviceID, ".$selFields.$sumStmntOuter."\r\n FROM (".$coreStmntEnd.") AS a 
							 GROUP BY scenarioID, indicatorID, ".($isRegion > 0 ? "regionID" : "countryID").", categoryID";														
			} else {			
				$coreStmntEnd = "SELECT ".$cntryNameFields.$coreStmnt.$cntryLevelWhereFields.$cntryLevelGroupFields;	
				$mainStmnt = "SELECT 0 as deviceID, ".$selFields."\r\n".$sumStmntOuter."\r\n FROM (".$coreStmntEnd.") AS a 
					 GROUP BY scenarioID, indicatorID, ".($isRegion > 0 ? "regionID" : "countryID");								
			};		
		};
		
		if ($getWorldData > 0) {			
			$mainStmnt = ($hasOtherCountries > 0 ? $mainStmnt."\r\n UNION \r\n" : "");
			if ($showAtDeviceLevel > 0) {							
					$coreStmntEnd = "SELECT ".$globalNameFields.$coreStmnt.$cntryLevelGroupFields.", deviceID";	
					$mainStmnt = $mainStmnt."SELECT deviceID, ".$selFields."\r\n".$sumStmntOuter."\r\n FROM (".$coreStmntEnd.") AS a 
							GROUP BY scenarioID, indicatorID, deviceID";
				
					$mainStmnt = $mainStmnt."\r\n UNION \r\n";
					$coreStmntEnd = "SELECT ".$globalNameFields.$coreStmnt.$cntryLevelGroupFields.", categoryID";								
					$mainStmnt = $mainStmnt."SELECT categoryID AS deviceID, ".$selFields.$sumStmntOuter."\r\n FROM (".$coreStmntEnd.") AS a 
							GROUP BY scenarioID, indicatorID, categoryID";														
			} else  {					
					$coreStmntEnd = "SELECT ".$globalNameFields.$coreStmnt.$cntryLevelGroupFields;	
					$mainStmnt = $mainStmnt."SELECT 0 as deviceID, ".$selFields."\r\n".$sumStmntOuter."\r\n FROM (".$coreStmntEnd.") AS a 
							GROUP BY scenarioID, indicatorID";										
			};					
		};
		$result = $this->connection->fetchAll($mainStmnt); 
		array_push($a, $result);		
		return $result;
		//return $mainStmnt;
	}
	
	public function getDeviceBase($countryIDs, $scenarioID, $pwrType, $isRegion, $showAtDeviceLevel, $perHH) {
		$a = array('a'=>"");		
		$countryArray = explode(",", $countryIDs); //(array)($countryIDs);	
		$getWorldData = 0; $hasOtherCountries = 0;
		$useCluster = 0; // isRegion could be: 0 - countries, 1 - regions, 2 - clusters;
		($isRegion > 1) ? $useCluster = "cluster" : $useCluster = "region";
	
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
		$stmntDevices    = "dbt.deviceID 	  AS deviceID, devNam.namen as deviceName"; 
		$stmntCategories = "devNam.categoryID AS deviceID, devCat.namen as deviceName";	
		$stmntNull       = "0 				  AS deviceID";	$mainStmnt = "";

		$cntryLevelWhereFields = ($isRegion > 0 ? " AND nc.".$useCluster : " AND nc.id")." IN ".$countryList;
		$cntryLevelGroupBy     = " GROUP BY \r\n dbt.scenarioID".($isRegion > 0 ? ", nc.".$useCluster : ", dbt.countryID").				
								   ($pwrType  > 0 ? ", typeID" : "");
		$globalLevelGroupBy    = " GROUP BY \r\n dbt.scenarioID".($pwrType  > 0 ? ", typeID" : "");
		$cntryNamePart = ($isRegion > 0 ? ", rg.namen AS countryName, rg.id AS countryID" : ", nc.namen AS countryName, dbt.countryID");		
		$globalNamePart = ", 'World' AS countryName, 11111 as countryID";
	
		$samePart= ", dbt.scenarioID, dbt.indicatorID \r\n".
				($pwrType  > 0 ? ", sdp.indicatorID, sdp.typeID " : ", 0 as indicatorID, 0 as typeID").				
				$sumStmnt."\r\n	FROM Consulting.DC_deviceBaseTable dbt
			JOIN Consulting.DC_namesCountries nc ON dbt.countryID = nc.id".    
					($isRegion > 0 ? " JOIN Consulting.DC_namesCountries AS rg ON (nc.".$useCluster." = rg.id)" : "")."				
			JOIN Consulting.DC_namesDevices devNam ON devNam.id = dbt.deviceID
			JOIN Consulting.DC_namesDeviceCategories devCat ON devCat.id = devNam.categoryID	
				".($perHH   > 0 ? "\r\n JOIN Consulting.DC_scenarioData sdt 
					ON ((sdt.countryID = dbt.countryID) AND (sdt.scenarioID = dbt.scenarioID))" : "").
				($pwrType > 0 ? "\r\n JOIN Consulting.DC_scenarioData sdp
					ON  (sdp.countryID = nc.".$joinOn.") AND (sdp.deviceID  = dbt.deviceID)	AND (sdp.scenarioID = dbt.scenarioID)" : "")."			
			WHERE dbt.scenarioID IN (".$scenarioID.", 10001)".
				($pwrType  > 0 ? " AND sdp.indicatorID = 205 AND sdp.typeID = ".$pwrType : "").
				($perHH    > 0 ? " AND sdt.indicatorID = 101" : "");				

		if ($hasOtherCountries > 0) {
			if ($showAtDeviceLevel == 0) 
				$mainStmnt = "SELECT ".$stmntNull.$cntryNamePart.$samePart.$cntryLevelWhereFields.$cntryLevelGroupBy;
			if ($showAtDeviceLevel  > 0)  {
				$mainStmnt = "SELECT ".$stmntDevices.$cntryNamePart.$samePart.$cntryLevelWhereFields.$cntryLevelGroupBy.", deviceID";		
				$mainStmnt = $mainStmnt."\r\nUNION\r\n";		
				$mainStmnt = $mainStmnt."SELECT ".$stmntCategories.$cntryNamePart.$samePart.$cntryLevelWhereFields.$cntryLevelGroupBy.", categoryID";
			};					
		};
			
		if ($getWorldData > 0) {
			$mainStmnt = ($hasOtherCountries > 0 ? $mainStmnt."\r\nUNION\r\n" : "");
			if ($showAtDeviceLevel == 0) 
				$mainStmnt = $mainStmnt."SELECT ".$stmntNull.$globalNamePart.$samePart."".$globalLevelGroupBy;
			if ($showAtDeviceLevel  > 0)  {
				$mainStmnt = $mainStmnt."SELECT ".$stmntDevices.$globalNamePart.$samePart."".$globalLevelGroupBy.", deviceID";		
				$mainStmnt = $mainStmnt."\r\nUNION\r\n";		
				$mainStmnt = $mainStmnt."SELECT ".$stmntCategories.$globalNamePart.$samePart."".$globalLevelGroupBy.", categoryID";						
			};			
		}
			
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
				$sumStmnt = $sumStmnt.", ".$this->perHHmultiplier." * sum(dma.Y".$u." * chm.shr) as Y".$u;
			};			
		};		
		
		$stmnt = "
			SELECT dma.scenarioID, 301 AS indicatorID, chm.id as chemistryID, 0 AS deviceID, 0 as categoryID, null as deviceName". 
				($isRegion > 0 ? ", rg.namen as countryName, rg.id AS countryID, " : ", nc.namen AS countryName, dma.countryID").
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
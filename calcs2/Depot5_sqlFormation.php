<?php

require_once 'Zend/Db/Adapter/Mysqli.php';

class Depot5_sqlFormation {

	public function __construct() {
		$this->connection = new Zend_Db_Adapter_Mysqli(array(
			'host'     => '192.168.44.200',
			'username' => 'cFullUserPW', // full user. a bit risky.
			'password' => 'c5ul1Use1QP',
			'dbname'   => 'Consulting'
		));
		$this->perHHmultiplier = 1;		
	}	
	
	public function formGetMacroCategory($countryIDs, $indicatorID, $scenarioID, $hasSplit, $typeID, $wNames, $singleScenario, $wTypes) {
			$scenarioClause = (!$singleScenario ? "(".$scenarioID.", 10001)" : "(".$scenarioID.")" );
			$batTypesNamesJoin = "\r\n JOIN Consulting.DC_namesBatSizeTypes nmz ON (nmz.id = sdt.typeID)";
			$batTypesNamesCols = "nmz.namen as typeName, ";
			//$a = array('a'=>"");		
			$countryArray = explode(",", $countryIDs);		
			$countryList = " (";
			for ($i = 0; $i < count($countryArray); $i++) {
				if ($i > 0) { $countryList = $countryList.", ".$countryArray[$i]; }			
				else $countryList = $countryList.$countryArray[$i];
			}
			$countryList = $countryList." )";
			
			$stmnt = ""; $selfields = ""; $sumStmnt = "";
		    $weightFlag = ""; 
			for ($u = 2006;  $u < 2022; $u++) {							
				if ($indicatorID > 200) {
					$weightFlag = ( ($indicatorID == 210) ? "" : " * wdb.Y".$u );
					$sumStmnt = $sumStmnt.$this->perHHmultiplier." * sum(sdt.Y".$u.$weightFlag.") AS Y".$u.",";			
				} else {
					$sumStmnt = $sumStmnt." sdt.Y".$u." AS Y".$u.",";			
				};
			};
			
			$selFields = "SELECT sdt.scenarioID, sdt.indicatorID,";
			if ($indicatorID > 200) {
				$selFields = $selFields." nmd.categoryID AS deviceID, sdt.typeID, ";
			} else {
				$selFields = $selFields." 0 AS deviceID, Null AS deviceName, 0 AS typeID, ";
			};		
			
			$namesForDevices = "\r\n JOIN Consulting.DC_namesDevicesVisual nmd ON (nmd.id = a.deviceID)";
			if ($wTypes) { $selFields = $selFields.$batTypesNamesCols; };
			// category level first		
			$stmnt = $selFields.$sumStmnt." nc.namen AS countryName, nc.id as countryID				
				FROM `Consulting`.`DC_scenarioData` sdt				
					JOIN `Consulting`.`DC_namesCountries` nc     ON sdt.countryID = nc.id".
				 ($indicatorID > 200 ? "
					JOIN Consulting.DC_weightsPerDeviceBase wdb  ON (wdb.countryID = nc.id AND wdb.deviceID = sdt.deviceID)".					
					"\r\n JOIN Consulting.DC_namesDevices  nmd         ON (nmd.id = sdt.deviceID)	".
					"\r\n JOIN Consulting.DC_namesDeviceCategories ndc ON (ndc.id = nmd.categoryID)" : "").
					($wTypes ? $batTypesNamesJoin : "")."
				WHERE 
					sdt.scenarioID IN ".$scenarioClause."
					AND nc.id IN ".$countryList." 
					AND sdt.indicatorID = ".$indicatorID."
					AND sdt.typeID = ".$typeID;					
			
			$stmnt = $stmnt."\r\n GROUP BY sdt.scenarioID, sdt.countryID, sdt.indicatorID". 
					($indicatorID > 200 ? ", nmd.categoryID, typeID" : "");						
			
			// device level next		
			$sumStmnt2 = "";
			for ($u = 2006;  $u < 2022; $u++) { $sumStmnt2 = $sumStmnt2."sdt.Y".$u.","; };		
			$selFields2 = "sdt.scenarioID, sdt.indicatorID, ";						
			$stmnt2 = "";
			if ($indicatorID > 200) {
				$selFields2 = $selFields2." sdt.deviceID, sdt.typeID, ";		
				if ($wTypes) { $selFields2 = $selFields2.$batTypesNamesCols; };
				$stmnt2 = "SELECT ".$selFields2.$sumStmnt2." nc.namen AS countryName, nc.id as countryID 
					FROM `Consulting`.`DC_scenarioData` sdt
					JOIN `Consulting`.`DC_namesCountries` nc				
						ON sdt.countryID = nc.id".					
					($wTypes ? $batTypesNamesJoin : "")."				
					WHERE 	scenarioID IN ".$scenarioClause."
							AND nc.id IN ".$countryList." 
							AND sdt.indicatorID = ".$indicatorID."
							AND typeID = ".$typeID;					
				$mainStmnt = $stmnt."\r\n UNION \r\n".$stmnt2;		
			} else {
				$mainStmnt = $stmnt;		
			};	
			if ($indicatorID > 200) {
				$mainStmnt = "SELECT *, namen as deviceName FROM (\r\n".$mainStmnt.") AS a \r\n".$namesForDevices."\r\n ORDER BY countryID, orderID";
			} else {
				$mainStmnt = "SELECT *,  null as deviceName FROM (\r\n".$mainStmnt.") AS a ";
			};
			return ($mainStmnt);	
	}

	public function formGetDemandData($countryIDs, $scenarioID, $typeID, $pwrID, $isRegion, $showAtDeviceLevel, $perHH) {
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
		
		$devNameFields = ",	devCat.id as categoryID, devCat.namen as categoryName, dm.deviceID as deviceID, devNam.namen AS deviceName"; 
		//used to pass names to device categories. needed for export;
		$coreStmnt = ", dm.scenarioID, 301 AS indicatorID, 
					nc.".$useCluster." as regionID".
				   ($typeID   > 0 ? ", batTypeID" : ", 0 as batTypeID").($pwrID > 0 ? ", pwrTypeID" : ", 0 as pwrTypeID").
					"\r\n".$sumStmntInner."\r\n".$sumStmntPop."					
				FROM Consulting.DC_demand AS dm
					JOIN Consulting.DC_namesCountries AS nc ON (dm.countryID = nc.id)  
						JOIN Consulting.DC_namesCountries AS rg ON (nc.".$useCluster." = rg.id)			
					JOIN Consulting.DC_namesDevicesVisual devNam ON devNam.id = deviceID
					JOIN Consulting.DC_namesDeviceCategories devCat ON devCat.id = devNam.categoryID					
					JOIN Consulting.DC_scenarioData sdt ON ((sdt.countryID = dm.countryID) AND (sdt.scenarioID = dm.scenarioID))
				WHERE dm.scenarioID IN (10001, ".$scenarioID.") AND sdt.indicatorID = 101".
				($typeID > 0 ? " AND batTypeID = ".$typeID : "").($pwrID > 0 ? " AND pwrTypeID = ".$pwrID : "");				
				
		$selFields = "scenarioID,  indicatorID, deviceName, categoryName, countryID, countryName, regionID \r\n".
					($typeID > 0 ? ", batTypeID" : ", 0 as batTypeID").($pwrID > 0 ? ", pwrTypeID" : ", 0 as pwrTypeID"); 
						
		if ($hasOtherCountries > 0) {
			if ($showAtDeviceLevel > 0) {				
				$coreStmntEnd = "SELECT ".$cntryNameFields.$devNameFields.$coreStmnt.$cntryLevelWhereFields.$cntryLevelGroupFields.", deviceID";	
				$mainStmnt = "SELECT deviceID, ".$selFields."\r\n".$sumStmntOuter."\r\n FROM (".$coreStmntEnd.") AS a 
					 GROUP BY scenarioID, indicatorID, ".($isRegion > 0 ? "regionID" : "countryID");								
				$mainStmnt = $mainStmnt.", deviceID";		
				
				$mainStmnt = $mainStmnt."\r\n UNION \r\n";
				$devNameFields = ",	devCat.id as categoryID, devCat.namen as categoryName, dm.deviceID as deviceID, devCat.namen AS deviceName"; 
				$coreStmntEnd = "SELECT ".$cntryNameFields.$devNameFields.$coreStmnt.$cntryLevelWhereFields.$cntryLevelGroupFields.", categoryID";								
				$mainStmnt = $mainStmnt."SELECT "."categoryID AS deviceID, ".$selFields.$sumStmntOuter."\r\n FROM (".$coreStmntEnd.") AS a 
							 GROUP BY scenarioID, indicatorID, ".($isRegion > 0 ? "regionID" : "countryID").", categoryID";														
			} else {			
				$coreStmntEnd = "SELECT ".$cntryNameFields.$devNameFields.$coreStmnt.$cntryLevelWhereFields.$cntryLevelGroupFields;	
				$mainStmnt = "SELECT 0 as deviceID, ".$selFields."\r\n".$sumStmntOuter."\r\n FROM (".$coreStmntEnd.") AS a 
					 GROUP BY scenarioID, indicatorID, ".($isRegion > 0 ? "regionID" : "countryID");								
			};		
		};
		
		if ($getWorldData > 0) {			
			$mainStmnt = ($hasOtherCountries > 0 ? $mainStmnt."\r\n UNION \r\n" : "");
			if ($showAtDeviceLevel > 0) {							
					$coreStmntEnd = "SELECT ".$globalNameFields.$devNameFields.$coreStmnt.$cntryLevelGroupFields.", deviceID";	
					$mainStmnt = $mainStmnt."SELECT deviceID, ".$selFields."\r\n".$sumStmntOuter."\r\n FROM (".$coreStmntEnd.") AS a 
							GROUP BY scenarioID, indicatorID, deviceID";
				
					$mainStmnt = $mainStmnt."\r\n UNION \r\n";
					$devNameFields = ",	devCat.id as categoryID, devCat.namen as categoryName, dm.deviceID as deviceID, devCat.namen AS deviceName"; 
					$coreStmntEnd = "SELECT ".$globalNameFields.$devNameFields.$coreStmnt.$cntryLevelGroupFields.", categoryID";
					$mainStmnt = $mainStmnt."SELECT categoryID AS deviceID, ".$selFields.$sumStmntOuter."\r\n FROM (".$coreStmntEnd.") AS a 
							GROUP BY scenarioID, indicatorID, categoryID";														
			} else  {					
					$coreStmntEnd = "SELECT ".$globalNameFields.$devNameFields.$coreStmnt.$cntryLevelGroupFields;	
					$mainStmnt = $mainStmnt."SELECT 0 as deviceID, ".$selFields."\r\n".$sumStmntOuter."\r\n FROM (".$coreStmntEnd.") AS a 
							GROUP BY scenarioID, indicatorID";										
			};					
		};
		if ($showAtDeviceLevel > 0) {
			$mainStmnt = "SELECT *, nm.orderID FROM (".$mainStmnt.") AS a JOIN Consulting.DC_namesDevicesVisual as nm on (a.deviceID = nm.id)
						ORDER BY orderID, countryID" ;
		};
		$result = $this->connection->fetchAll($mainStmnt); 
		array_push($a, $result);		
		//return $result;
		return $mainStmnt;
	}

	public function formGetIndicatorNames() {
		//$a = array('a'=>"");
		$stmnt = "SELECT * \r\n FROM `Consulting`.`DC_namesIndicators`
				WHERE -- AND isOutputIndicator = 0 AND
				hasTimeSeries = 1";
		/*$result = $this->connection->fetchAll($stmnt);		
		array_push($a, $result);		*/
		return $stmnt;
	}
}		
?>

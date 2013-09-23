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
			$scenarioClause = (($singleScenario == 1) ? "(10001)" :  "(".$scenarioID.", 10001)" );
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
			
			$selFields = "SELECT 0 as batClass, sdt.scenarioID, sdt.indicatorID,";
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
			$selFields2 = "0 as batClass, sdt.scenarioID, sdt.indicatorID, ";						
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
				$mainStmnt = "SELECT *, namen as deviceName FROM (\r\n".$mainStmnt.") AS a \r\n".$namesForDevices."\r\n ORDER BY scenarioID, countryID, orderID";
			} else {
				$mainStmnt = "SELECT *,  null as deviceName FROM (\r\n".$mainStmnt.") AS a ORDER BY scenarioID, countryID";
			};
			return ($mainStmnt);	
	}

	public function formGetDemandData($countryIDs, $scenarioID, $typeID, $pwrID, $isRegion, $showAtDeviceLevel, $perHH, $singleScenario) {
		$scenarioClause = (($singleScenario == 1) ? "(10001)" :  "(".$scenarioID.", 10001)" );
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
				WHERE dm.scenarioID IN ".$scenarioClause."
				AND sdt.indicatorID = 101".
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
						ORDER BY scenarioID, countryID, orderID" ;
		} else {
			$mainStmnt = "SELECT * FROM (".$mainStmnt.") AS a ORDER BY scenarioID, countryID" ;
		};
		$result = $this->connection->fetchAll($mainStmnt); 
		array_push($a, $result);		
		//return $result;
		return $mainStmnt;
	}

	public function formGetDeviceBase($countryIDs, $scenarioID, $pwrType, $isRegion, $showAtDeviceLevel, $perHH, $singleScenario) {
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
				$sumStmnt = $sumStmnt.", ".$this->perHHmultiplier." * sum( dbt.Y".$u.") / sum( sdt.Y".$u." ) AS Y".$u;
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
	
		$samePart= ", null AS batTypeID, dbt.scenarioID, dbt.indicatorID \r\n".
				($pwrType  > 0 ? ", sdp.indicatorID, sdp.typeID " : ", 0 as indicatorID, 0 as typeID").				
				$sumStmnt.", devNam.orderID \r\n	
				FROM Consulting.DC_deviceBaseTable dbt
				JOIN Consulting.DC_namesCountries nc ON dbt.countryID = nc.id".    
					($isRegion > 0 ? " JOIN Consulting.DC_namesCountries AS rg ON (nc.".$useCluster." = rg.id)" : "")."				
				JOIN Consulting.DC_namesDevicesVisual devNam ON devNam.id = dbt.deviceID
				JOIN Consulting.DC_namesDeviceCategories devCat ON devCat.id = devNam.categoryID	
				".($perHH   > 0 ? "\r\n JOIN Consulting.DC_scenarioData sdt 
					ON ((sdt.countryID = dbt.countryID) AND (sdt.scenarioID = dbt.scenarioID))" : "").
				($pwrType > 0 ? "\r\n JOIN Consulting.DC_scenarioData sdp
					ON  (sdp.countryID = nc.".$joinOn.") AND (sdp.deviceID  = dbt.deviceID)	AND (sdp.scenarioID = dbt.scenarioID)" : "")."			
				WHERE dbt.scenarioID IN (10001".($singleScenario == 1 ? "" : ", ".$scenarioID).")".
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
		
		// $mainStmnt = $mainStmnt."\r\n ORDER BY orderID, scenarioID, countryID ";
		return $mainStmnt;
	}

	public function formGetHHPenSplitData($countryIDs, $scenarioID) {
		$countryArray = explode(",", $countryIDs); 				
		$hasOtherCountries = 0; $getWorldData = 0;
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
	
		$sumStmnt = "";	$sumStmntC = "";
		for ($u = 2006; $u < 2022; $u++) {
			if ((($u - 2006) % 3) == 0) {	$sumStmnt = $sumStmnt."\r\n";	};			
			$sumStmnt = $sumStmnt.", sz.Y".$u."  AS Y".$u;			
			$sumStmntC = $sumStmntC.", sum(sdt.Y".$u." * hhp.Y".$u.")/ifnull(sum(sdt.Y".$u."), 1)  AS Y".$u;			
		};			
		$devPart = ", sz.deviceID as deviceID,  nd.namen as deviceName";
		$catPart = ", nd.categoryID as deviceID, ndv.namen as deviceName";
		$ndv = "\r\n JOIN Consulting.DC_namesDevicesVisual ndv ON (ndv.id = nd.categoryID) \r\n";
		
		$mainDQ = "SELECT sz.scenarioID, sz.countryID, nc.namen as countryName, 
				sz.indicatorID, sz.batClass".$devPart.$sumStmnt."\r\n
				FROM Consulting.DC_deviceWeightsBySizes sz
				JOIN Consulting.DC_namesCountries nc
					ON (nc.id = sz.countryID)			
				JOIN Consulting.DC_namesDevices nd
					ON (nd.id = sz.deviceID)			
				WHERE sz.scenarioID IN (10001, ".$scenarioID.")
					AND sz.countryID IN ".$countryList;
		
		$mainCQ = "SELECT
				sdt.scenarioID AS scenarioID, sdt.countryID AS countryID, nc.namen as countryName,
				sdt.indicatorID AS indicatorID, sz.batClass AS batClass".$catPart.$sumStmntC."				
				from Consulting.`DC_scenarioData` `sdt` 	
					join Consulting.`DC_scenarioData` `hhp` 
						on ( (`hhp`.`scenarioID` = `sdt`.`scenarioID`) and (`hhp`.`countryID` = `sdt`.`countryID`) 
						and (`hhp`.`deviceID` = `sdt`.`deviceID`) )
					join Consulting.`DC_namesBatSizeTypes` `sz` on (`sz`.`id` = `sdt`.`typeID`)
					join Consulting.DC_namesCountries nc ON (nc.id = sdt.countryID)
					JOIn Consulting.DC_namesDevices   nd  on (nd.id = sdt.deviceID)
					JOIn Consulting.DC_namesDevicesVisual ndv on (nd.categoryID = ndv.id)						
				where ((`sdt`.`indicatorID` = 204) and (`hhp`.`indicatorID` = 201) and (`sz`.`batClass` in (1,2,3))
						AND sdt.scenarioID IN (10001, ".$scenarioID.")
						AND sdt.countryID IN ".$countryList.")
				GROUP BY `sdt`.`scenarioID`,`sdt`.`countryID`,`nd`.`categoryID`,`sz`.`batClass` ";
		
		$mainQ = $mainDQ."\r\n UNION \r\n".$mainCQ;
		
		return $mainQ;			
	} 

	public function formGetDemandByChemistry($countryIDs, $scenarioID, $isRegion, $perHH, $singleScenario) {
		$scenarioClause = (($singleScenario == 1) ? "(10001)" :  "(".$scenarioID.", 10001)" );
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
				$sumStmnt = $sumStmnt.", ".$this->perHHmultiplier." * sum(dma.Y".$u." * chm.Y".$u.")/sum(sdt.Y".$u.") as Y".$u;
			} else {
				$sumStmnt = $sumStmnt.", ".$this->perHHmultiplier." * sum(dma.Y".$u." * chm.Y".$u.") as Y".$u;
			};			
		};		
		
		$stmnt = "
			SELECT dma.scenarioID, 301 AS indicatorID, chm.chemid as chemistryID, 0 AS deviceID, 0 as categoryID, null as deviceName". 
				($isRegion > 0 ? ", rg.namen as countryName, rg.id AS countryID" : ", nc.namen AS countryName, dma.countryID").
				 $sumStmnt."
			FROM Consulting.DC_demandAggregated dma
				JOIN Consulting.DC_chemistry chm ON (chm.countryID = dma.countryID)
			JOIN Consulting.DC_namesCountries AS nc ON (dma.countryID = nc.id) ".                    
				($isRegion > 0 ? " JOIN Consulting.DC_namesCountries AS rg ON (nc.".$useCluster." = rg.id)" : "").
			    ($perHH    > 0 ? "
					JOIN Consulting.DC_scenarioData sdt 
					ON ((sdt.countryID = dma.countryID) AND (sdt.scenarioID = dma.scenarioID))" : "")."					
			WHERE dma.scenarioID IN ".$scenarioClause.			
				($isRegion > 0 ? " AND nc.".$useCluster : " AND dma.countryID ")." IN ".$countryList.
				($perHH    > 0 ? " AND sdt.indicatorID = 101" : "")."				
			GROUP BY dma.scenarioID, chemistryID".
				($isRegion > 0 ? ", nc.".$useCluster : ", dma.countryID");
			
		/*$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;*/
		return $stmnt;
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

	public function formDeleteDataFromDevBase($scenID, $cntryList) {
		if ($scenID == 10001) // saving baseline
				$s = "SELECT null as REZ";
		else 	$s = "DELETE FROM `Consulting`.`DC_deviceBaseTable`					
					  WHERE scenarioID = ".$scenID." AND countryID IN (".$cntryList.") 
					  AND indicatorID = 203";
		return $s;
	}
	
	public function formGetDataForDevBase($scenID, $cntryList) {
		$s = "SELECT 
				dvb.scenarioID, dvb.countryID, dvb.deviceID,
				dvb.Y2006 as dvb06, dvb.Y2007 as dvb07, dvb.Y2008 as dvb08, dvb.Y2009 as dvb09, dvb.Y2010 as dvb10, dvb.Y2011 as dvb11,
				dvb.Y2012 as dvb12, dvb.Y2013 as dvb13, dvb.Y2014 as dvb14, dvb.Y2015 as dvb15, dvb.Y2016 as dvb16, dvb.Y2017 as dvb17,
				dvb.Y2018 as dvb18, dvb.Y2019 as dvb19, dvb.Y2020 as dvb20, dvb.Y2021 as dvb21,
				
				dpr.Y2006 as dpr06, dpr.Y2007 as dpr07, dpr.Y2008 as dpr08, dpr.Y2009 as dpr09, dpr.Y2010 as dpr10, dpr.Y2011 as dpr11,
				dpr.Y2012 as dpr12, dpr.Y2013 as dpr13, dpr.Y2014 as dpr14, dpr.Y2015 as dpr15, dpr.Y2016 as dpr16, dpr.Y2017 as dpr17,
				dpr.Y2018 as dpr18, dpr.Y2019 as dpr19, dpr.Y2020 as dpr20, dpr.Y2021 as dpr21,
				
				sls.Y2006 as sls06, sls.Y2007 as sls07, sls.Y2008 as sls08, sls.Y2009 as sls09, sls.Y2010 as sls10, sls.Y2011 as sls11,
				sls.Y2012 as sls12, sls.Y2013 as sls13, sls.Y2014 as sls14, sls.Y2015 as sls15, sls.Y2016 as sls16, sls.Y2017 as sls17,
				sls.Y2018 as sls18, sls.Y2019 as sls19, sls.Y2020 as sls20, sls.Y2021 as sls21				
			FROM Consulting.DC_deviceBaseTable dvb
			JOIN Consulting.DC_scenarioData dpr
				ON (dvb.countryID = dpr.countryID AND dvb.deviceID = dpr.deviceID)
			JOIN Consulting.DC_scenarioData sls
				ON (dpr.scenarioID = sls.scenarioID AND dvb.countryID = sls.countryID AND dvb.deviceID = sls.deviceID)
			WHERE dpr.indicatorID = 212 and sls.indicatorID = 210
				AND dvb.scenarioID = 10001 AND dpr.scenarioID = ".$scenID."
				AND dvb.countryID IN (".$cntryList.")";						
		return $s;
	}
	
	public function calcNewDevBase($src) {
		$devB = array();
		for ($u = 0; $u < count($src); $u++) { 			
			$ndb06 = ($src[$u]['dvb06']) ;
			$ndb07 = ($ndb06 + $src[$u]['sls07'])*(1 - $src[$u]['dpr07']);
			$ndb08 = ($ndb07 + $src[$u]['sls08'])*(1 - $src[$u]['dpr08']);
			$ndb09 = ($ndb08 + $src[$u]['sls09'])*(1 - $src[$u]['dpr09']);
			$ndb10 = ($ndb09 + $src[$u]['sls10'])*(1 - $src[$u]['dpr10']);
			$ndb11 = ($ndb10 + $src[$u]['sls11'])*(1 - $src[$u]['dpr11']);
			$ndb12 = ($ndb11 + $src[$u]['sls12'])*(1 - $src[$u]['dpr12']);
			$ndb13 = ($ndb12 + $src[$u]['sls13'])*(1 - $src[$u]['dpr13']);
			$ndb14 = ($ndb13 + $src[$u]['sls14'])*(1 - $src[$u]['dpr14']);
			$ndb15 = ($ndb14 + $src[$u]['sls15'])*(1 - $src[$u]['dpr15']);
			$ndb16 = ($ndb15 + $src[$u]['sls16'])*(1 - $src[$u]['dpr16']);
			$ndb17 = ($ndb16 + $src[$u]['sls17'])*(1 - $src[$u]['dpr17']);
			$ndb18 = ($ndb17 + $src[$u]['sls18'])*(1 - $src[$u]['dpr18']);
			$ndb19 = ($ndb18 + $src[$u]['sls19'])*(1 - $src[$u]['dpr19']);
			$ndb20 = ($ndb19 + $src[$u]['sls20'])*(1 - $src[$u]['dpr20']);
			$ndb21 = ($ndb20 + $src[$u]['sls21'])*(1 - $src[$u]['dpr21']);
			
			$oneRow = array('countryID'=> $src[$u]['countryID'], 'deviceID'=> $src[$u]['deviceID'], 
							'Y2006'=>$ndb06, 'Y2007'=>$ndb07, 'Y2008'=>$ndb08, 'Y2009'=>$ndb09, 'Y2010'=>$ndb10, 'Y2011'=>$ndb11, 'Y2012'=>$ndb12,
							'Y2013'=>$ndb13, 'Y2014'=>$ndb14, 'Y2015'=>$ndb15, 'Y2016'=>$ndb16, 'Y2017'=>$ndb17, 'Y2018'=>$ndb18,
							'Y2019'=>$ndb19, 'Y2020'=>$ndb20, 'Y2021'=>$ndb21);					
			array_push($devB, $oneRow);		
		};
		return $devB;
	}

	public function formInsertDataForDevBase($scenID, $src, $cycleLength) {	
		$s = "INSERT INTO `Consulting`.``
					(`scenarioID`,`countryID`,`deviceID`,`indicatorID`,
						`Y2006`,`Y2007`,`Y2008`,`Y2009`,`Y2010`,`Y2011`,`Y2012`,`Y2013`,
						`Y2014`,`Y2015`,`Y2016`,`Y2017`,`Y2018`,`Y2019`,`Y2020`,`Y2021`)
			  VALUES \r\n";
		$baseSql = "";
		for ($u = 0; $u < min($cycleLength, count($src)); $u++) {
			if ($u > 0) $baseSql = $baseSql.", \r\n";
			$app = "(".$scenID.",".$src[$u]['countryID'].", ".$src[$u]['deviceID'].", 203,".
					$src[$u]['Y2006'].",".$src[$u]['Y2007'].",".$src[$u]['Y2008'].",".$src[$u]['Y2009'].",".
					$src[$u]['Y2010'].",".$src[$u]['Y2011'].",".$src[$u]['Y2012'].",".$src[$u]['Y2013'].",".$src[$u]['Y2014'].",".
					$src[$u]['Y2015'].",".$src[$u]['Y2016'].",".$src[$u]['Y2017'].",".$src[$u]['Y2018'].",".$src[$u]['Y2019'].",".
					$src[$u]['Y2020'].",".$src[$u]['Y2021'].")";			
			$baseSql = $baseSql.$app;
		};
		$baseSql = $s.$baseSql;
		return $baseSql;
	}
	
	public function formInsertTotalForDevBase($scenID) {		
		$yrsField = "`Y2006`,`Y2007`,`Y2008`,`Y2009`,`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,
					 `Y2015`,`Y2016`,`Y2017`,`Y2018`,`Y2019`,`Y2020`,`Y2021`";					 
	
		$delStmnt1 = "DELETE FROM `Consulting`.`DC_deviceBaseTable` WHERE scenarioID = ".$scenarioID." AND deviceID = 200";
		$result1 = $this->connection->prepare($delStmnt1);		
		$result1->execute();	
		// write from view to static table;
		$insStmnt1 = "\r\n	INSERT INTO `Consulting`.`DC_deviceBaseTable` \r\n (`scenarioID`,`countryID`,`deviceID`, `indicatorID`, ".$yrsField.")
					SELECT `scenarioID`,`countryID`,`deviceID`, indicatorID, ".$yrsField."
					FROM `Consulting`.`DC_totalDevices`
					WHERE scenarioID = ".$scenarioID." AND indicatorID = 203;";	
		//$result2 = $this->connection->prepare($insStmnt1);		
		return $insStmnt1;	
	}
	
	public function formInsertTotalForAvg($scenID) {	
		$yrsField = "`Y2006`,`Y2007`,`Y2008`,`Y2009`,`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,
					 `Y2015`,`Y2016`,`Y2017`,`Y2018`,`Y2019`,`Y2020`,`Y2021`";					 
	
		$delStmnt1 = "DELETE FROM `Consulting`.`DC_scenarioData` WHERE scenarioID = ".$scenarioID." AND deviceID = 200;";
		$result1 = $this->connection->prepare($delStmnt1);		
		$result1->execute();	
		// write from view to static table;
		$insStmnt1 = "\r\n	INSERT INTO `Consulting`.`DC_scenarioData` \r\n (`scenarioID`,`countryID`,`deviceID`, `indicatorID`, ".$yrsField.")
					SELECT `scenarioID`,`countryID`,`deviceID`, indicatorID, ".$yrsField."
					FROM `Consulting`.`DC_totalDevices`
					WHERE scenarioID = ".$scenarioID." AND indicatorID = 202";	
		$result2 = $this->connection->prepare($insStmnt1);		
		return null;	
	}
	
	public function formTestInsertion($scenID, $cntryList) {
		$s = "SELECT count(*) as tot FROM `Consulting`.`DC_deviceBaseTable`
			   WHERE scenarioID = ".$scenID." AND countryID IN (".$cntryList.") AND indicatorID = 203";
		return $s;
	}
}		
?>

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
				$mainStmnt = "SELECT * FROM (\r\n".$mainStmnt.") AS a \r\n".$namesForDevices."\r\n ORDER BY countryID, orderID";
			} else {
				$mainStmnt = "SELECT *, null as namen FROM (\r\n".$mainStmnt.") AS a ";
			};
			return ($mainStmnt);	
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

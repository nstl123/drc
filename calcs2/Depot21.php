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
		$a = array('a'=>"");		
		
		$rawText =  new Depot5_sqlFormation();
		$mainStmnt = $rawText->formGetMacroCategory($countryIDs, $indicatorID, $scenarioID, $hasSplit, $typeID, $wNames, 0, 0);	
		
		$sumStmnt = $mainStmnt;
		
		if ($indicatorID == 202) {			
			$addStmnt = $rawText ->formGetTotalNumberOfDev($countryIDs, $scenarioID, $indicatorID);		
			$sumStmnt = $mainStmnt."\r\n UNION \r\n".$addStmnt;				
		};
		if ($indicatorID > 200) {
			$sumStmnt = $sumStmnt."\r\n ORDER BY scenarioID, countryID, orderID";
		} else {
			$sumStmnt = $sumStmnt."\r\n ORDER BY scenarioID, countryID";
		};		
		$result = $this->connection->fetchAll($sumStmnt); 
		array_push($a, $result);	
		
		return $result;		
		//return $sumStmnt;
	}
	
	public function getDemandData($countryIDs, $scenarioID, $typeID, $pwrID, $isRegion, $showAtDeviceLevel, $perHH) { 							
		$rawText =  new Depot5_sqlFormation();
		$mainStmnt = $rawText->formGetDemandData($countryIDs, $scenarioID, $typeID, $pwrID, $isRegion, $showAtDeviceLevel, $perHH, 0);
		
		$a = array('a'=>"");		
		$result = $this->connection->fetchAll($mainStmnt); 
		array_push($a, $result);	
		return $result;			
		//return $mainStmnt;
	}
	
	public function getDeviceBase($countryIDs, $scenarioID, $pwrType, $isRegion, $showAtDeviceLevel, $perHH) {
		$a = array('a'=>"");		
		
		$rawText =  new Depot5_sqlFormation();
		$mainStmnt = $rawText->formGetDeviceBase($countryIDs, $scenarioID, $pwrType, $isRegion, $showAtDeviceLevel, $perHH, 0);
		
		$addStmnt = $rawText ->formGetTotalNumberOfDev($countryIDs, $scenarioID, 203);
		// 203 for dev base, 202 for avg # of dev per HH
		$sumStmnt = $mainStmnt."\r\n UNION \r\n".$addStmnt;		
		//$sumStmnt = $mainStmnt;
		
		$result = $this->connection->fetchAll($sumStmnt); 
		array_push($a, $result);	
		return $result;			
		//return $sumStmnt;
	}
	
	public function getDemandByChemistry($countryIDs, $scenarioID, $isRegion, $perHH) {
		$rawText =  new Depot5_sqlFormation();
		$mainStmnt = $rawText->formGetDemandByChemistry($countryIDs, $scenarioID, $isRegion, $perHH, 0);
		
		$a = array('a'=>"");		
		$result = $this->connection->fetchAll($mainStmnt); 
		array_push($a, $result);	
		return $result;			
		//return $mainStmnt;		
	}			

	public function getHHpenSplit($countryIDs, $scenarioID) {
		$rawText =  new Depot5_sqlFormation();
		$mainStmnt = $rawText->formGetHHPenSplitData($countryIDs, $scenarioID);		
		$a = array('a'=>"");		
		$result = $this->connection->fetchAll($mainStmnt); 
		array_push($a, $result);	
		return $result;
		//return $mainStmnt;
	}
}		
?>
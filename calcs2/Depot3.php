<?php

require_once 'Zend/Db/Adapter/Mysqli.php';

class Depot3 {

	public function __construct() {
		$this->connection = new Zend_Db_Adapter_Mysqli(array(
			'host'     => '192.168.44.200',
			'username' => 'cFullUserPW', // full user. a bit risky.
			'password' => 'c5ul1Use1QP',
			'dbname'   => 'Consulting'
		));
	}	
	
	public function updateData($data, $hasSplit, $isDeviceBase, $deviceID, $typeID) { // id indicator hasSplit by batTypes
		$arr0 = (array)$data;
		$arr = $arr0['data'];
		
		$srcTable = "";
		if ($hasSplit) $srcTable = "Consulting.DC_scenarioDataProxy";
		else           $srcTable = "Consulting.DC_scenarioData";
		
		if ($isDeviceBase) $srcTable = "Consulting.DC_deviceBaseTable"; 		
		
		// loop to select
		// loop to select all country-indi pairs		
		
		for ($j = 0; $j < count($arr); $j++) {		
			$b =(array) $arr0['data'][$j];
			$stmnt = "
				UPDATE ".$srcTable." 
				SET						
					Y2005 = ".$b['Y2005'].", Y2010 = ".$b['Y2010']."
				WHERE scenarioID = ".$b['scenarioID']."			
					AND countryID = ".$b['countryID']."
					AND indicatorID = ".$b['indicatorID'];
			
			if ($b['indicatorID'] == 203) { // means device base
					$stmnt = $stmnt." AND deviceID = ".$deviceID;
			} else 			
			if ($b['indicatorID'] > 200) { // means not macro
					$stmnt = $stmnt."
						AND deviceID = ".$deviceID." AND typeID = ".$typeID.";";
			};
		
			$result = $this->connection->prepare($stmnt);
			$result->execute();	
		}		
		return  $j;
	}		
	
		
	public function updateDataCycle($data, $hasSplit, $isDeviceBase, $deviceID, $typeID, $yr, $shockVal) { // id indicator hasSplit by batTypes
		$arr0 = (array)$data;
		$arr = $arr0['data'];
		
		$srcTable = "";
		if ($hasSplit) $srcTable = "Consulting.DC_scenarioDataProxy";
		else           $srcTable = "Consulting.DC_scenarioData";
		
		if ($isDeviceBase) $srcTable = "Consulting.DC_deviceBaseTable"; 		
		
		// loop to select
		// loop to select all country-indi pairs		
		
		for ($j = 0; $j < count($arr); $j++) {		
			$b =(array) $arr0['data'][$j];
			$stmnt = "
				UPDATE ".$srcTable." 
				SET						
					Y2005 = ".$b['Y2005'].", Y2010 = ".$b['Y2010']."
				WHERE scenarioID = ".$b['scenarioID']."			
					AND countryID = ".$b['countryID']."
					AND indicatorID = ".$b['indicatorID'];
			
			if ($b['indicatorID'] == 203) { // means device base
					$stmnt = $stmnt." AND deviceID = ".$deviceID;
			} else 			
			if ($b['indicatorID'] > 200) { // means not macro
					$stmnt = $stmnt."
						AND deviceID = ".$deviceID." AND typeID = ".$typeID.";";
			};
		
			$result = $this->connection->prepare($stmnt);
			$result->execute();	
		}		
		return  $j;
	}	
	
	public function createNewWorkingScenario($scenarioID) {
		$this -> deleteWorkingScenario($scenarioID);
		$this -> insertWorkingScenario($scenarioID);
		return $scenarioID;
	}
	
	public function deleteAllScenarios() {
		$stmntData = "DELETE FROM `Consulting`.`DC_scenarioData`
							WHERE scenarioID < 9999";
		$result = $this->connection->prepare($stmntData);		
		$result->execute();	
		
		$stmntProxy = "DELETE FROM `Consulting`.`DC_scenarioDataProxy`
							WHERE scenarioID < 9999";
		$result = $this->connection->prepare($stmntProxy);
		$result->execute();	
	}	
	
	public function deleteWorkingScenario($scenarioID) {
		$stmntData = "DELETE FROM `Consulting`.`DC_scenarioData` WHERE scenarioID = ".$scenarioID;
		$result = $this->connection->prepare($stmntData);		
		$result->execute();	
		
		$stmntProxy = "DELETE FROM `Consulting`.`DC_scenarioDataProxy` WHERE scenarioID = ".$scenarioID;
		$result = $this->connection->prepare($stmntProxy);
		$result->execute();	
	}	
	
	public function insertWorkingScenario($scenarioID) {

		$stmntMacro = "
			INSERT INTO `Consulting`.`DC_scenarioData`
				(`scenarioID`,`countryID`,`indicatorID`, `deviceID`, typeID, `unitID`,
				`Y2000`,`Y2001`,`Y2002`,`Y2003`,`Y2004`,`Y2005`,`Y2006`,`Y2007`,`Y2008`,
				`Y2009`,`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,`Y2015`,`Y2016`,`Y2017`,
				`Y2018`,`Y2019`,`Y2020`,`Y2021`,`Y2022`,`Y2023`,`Y2024`,`Y2025`)
			SELECT
				".$scenarioID." as `scenarioID`,`countryID`,`indicatorID`, `deviceID`, `typeID`, `unitID`,
				`Y2000`,`Y2001`,`Y2002`,`Y2003`,`Y2004`,`Y2005`,`Y2006`,`Y2007`,`Y2008`,
				`Y2009`,`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,`Y2015`,`Y2016`,`Y2017`,
				`Y2018`,`Y2019`,`Y2020`,`Y2021`,`Y2022`,`Y2023`,`Y2024`,`Y2025`
			FROM `Consulting`.`DC_scenarioData`
				WHERE scenarioID = 10001;";
		
		$result = $this->connection->prepare($stmntMacro);
		$result->execute();	
		
		$stmntProxy = "
			INSERT INTO `Consulting`.`DC_scenarioDataProxy`
				(`scenarioID`,`countryID`,`indicatorID`,`deviceID`,	`typeID`,`unitID`,
				`Y2000`,`Y2001`,`Y2002`,`Y2003`,`Y2004`,`Y2005`,`Y2006`,`Y2007`,`Y2008`,
				`Y2009`,`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,`Y2015`,`Y2016`,`Y2017`,
				`Y2018`,`Y2019`,`Y2020`,`Y2021`,`Y2022`,`Y2023`,`Y2024`,`Y2025`)
			SELECT
				".$scenarioID." as `scenarioID`,`countryID`,`indicatorID`,`deviceID`, `typeID`, `unitID`,
				`Y2000`,`Y2001`,`Y2002`,`Y2003`,`Y2004`,`Y2005`,`Y2006`,`Y2007`,`Y2008`,
				`Y2009`,`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,`Y2015`,`Y2016`,`Y2017`,
				`Y2018`,`Y2019`,`Y2020`,`Y2021`,`Y2022`,`Y2023`,`Y2024`,`Y2025`
			FROM `Consulting`.`DC_scenarioDataProxy`
				WHERE scenarioID = 10001;"; // get the base scenario
		
		$result = $this->connection->prepare($stmntProxy);
		$result->execute();			
		
		$stmntTest = "SELECT count(*) FROM `Consulting`.`DC_scenarioData` where scenarioID = ".$scenarioID.";";		
		$result = $this->connection->prepare($stmntTest);
		$result->execute();			
		
		return $result;
	} 
	
	
	public function writeViewToTable() {	
		$delStmnt = "DELETE FROM `Consulting`.`DC_deviceBaseTable` WHERE scenarioID > 0; ";
		$result = $this->connection->prepare($delStmnt);		
		$result->execute();	
		
		$insStmnt = "
			INSERT INTO `Consulting`.`DC_deviceBaseTable`
				(`scenarioID`,`countryID`,`deviceID`,`indicatorID`,
				`Y2000`,`Y2001`,`Y2002`,`Y2003`,`Y2004`,`Y2005`,`Y2006`,`Y2007`,`Y2008`,`Y2009`,
				`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,`Y2015`,`Y2016`,`Y2017`,`Y2018`,`Y2019`,
				`Y2020`,`Y2021`,`Y2022`,`Y2023`,`Y2024`,`Y2025`)
			SELECT
				`scenarioID`,`countryID`,`deviceID`,`indicatorID`,
				`Y2000`,`Y2001`,`Y2002`,`Y2003`,`Y2004`,`Y2005`,`Y2006`,`Y2007`,`Y2008`,`Y2009`,
				`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,`Y2015`,`Y2016`,`Y2017`,`Y2018`,`Y2019`,
				`Y2020`,`Y2021`,`Y2022`,`Y2023`,`Y2024`,`Y2025`
			FROM `Consulting`.`DC_deviceBase`;";
		$result = $this->connection->prepare($insStmnt);		
		$result->execute();		
		
		return "ok"; // some error handling would be nice
	}
}		
?>

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
	
	public function updateData($data, $isDeviceBase, $deviceID, $typeID) { // id indicator hasSplit by batTypes
		$arr0 = (array)$data;
		$arr = $arr0['data'];
		
		$srcTable = "";		
		// in this case need to add proxy countries for matching batType and pwrType IDs
		$srcTable = "Consulting.DC_scenarioData";
		
		if ($isDeviceBase) $srcTable = "Consulting.DC_deviceBaseTable"; 				
		
		for ($j = 0; $j < count($arr); $j++) {		
			$b =(array) $arr0['data'][$j]; // need to extend to more data points
			$stmnt = "
				UPDATE ".$srcTable." 
				SET						
					Y2004 = ".$b['Y2004'].",
					Y2005 = ".$b['Y2005'].", Y2006 = ".$b['Y2006'].", Y2007 = ".$b['Y2007'].",
					Y2008 = ".$b['Y2008'].", Y2009 = ".$b['Y2009'].", Y2010 = ".$b['Y2010'].",
					Y2011 = ".$b['Y2011'].", Y2012 = ".$b['Y2012'].", Y2013 = ".$b['Y2013'].", 
					Y2014 = ".$b['Y2014'].", Y2015 = ".$b['Y2015'].", Y2016 = ".$b['Y2016'].", 
					Y2017 = ".$b['Y2017'].", Y2018 = ".$b['Y2018'].", Y2019 = ".$b['Y2019'].", 
					Y2020 = ".$b['Y2020']."
				WHERE scenarioID = ".$b['scenarioID']."			
					AND countryID = ".$b['countryID']."
					AND indicatorID = ".$b['indicatorID'];
			
			if ( ($b['indicatorID'] == 203)||($b['indicatorID'] == 210)||($b['indicatorID'] == 211) ) { // means device base
					$stmnt = $stmnt." AND deviceID = ".$deviceID;
			} else 			
			if ($b['indicatorID'] > 200) { // means not macro
					$stmnt = $stmnt."
						AND deviceID = ".$deviceID." AND typeID = ".$typeID.";";
			};
		
			$result = $this->connection->prepare($stmnt);
			$result->execute();	
		}		
		return true;
		//return  $stmnt;
	}		
		
	public function updateDataProxy($data, $deviceID, $typeID) { // id indicator hasSplit by batTypes
		$arr0 = (array)$data;
		$arr = $arr0['data'];
		
		$srcTable = "Consulting.DC_scenarioDataProxy"; 
		
		for ($j = 0; $j < count($arr); $j++) {		
			$b =(array) $arr0['data'][$j]; // need to extend to more data points
			switch ($b['indicatorID']) {
				case 204:
					$col_namen = 'avg_number'; 	 break;
				case 205:
					$col_namen = 'pwr_DPP'; 	 break;
				case 206:
					$col_namen = 'battery_size'; break;
			};			
			$stmnt = "
				UPDATE ".$srcTable." sdp
				JOIN Consulting.DC_namesCountries nc
				ON sdp.countryID = nc.".$col_namen." 
				SET						
					Y2004 = ".$b['Y2004'].",
					Y2005 = ".$b['Y2005'].", Y2006 = ".$b['Y2006'].", Y2007 = ".$b['Y2007'].",
					Y2008 = ".$b['Y2008'].", Y2009 = ".$b['Y2009'].", Y2010 = ".$b['Y2010'].",
					Y2011 = ".$b['Y2011'].", Y2012 = ".$b['Y2012'].", Y2013 = ".$b['Y2013'].", 
					Y2014 = ".$b['Y2014'].", Y2015 = ".$b['Y2015'].", Y2016 = ".$b['Y2016'].", 
					Y2017 = ".$b['Y2017'].", Y2018 = ".$b['Y2018'].", Y2019 = ".$b['Y2019'].", 
					Y2020 = ".$b['Y2020']."
				WHERE scenarioID = ".$b['scenarioID']."								
					AND indicatorID = ".$b['indicatorID']."			
					AND deviceID = ".$deviceID."					
					AND typeID = ".$typeID."
					AND nc.id = ".$b['countryID'].";";			
		
			$result = $this->connection->prepare($stmnt);
			$result->execute();	
		}		
		//return true;
		return  $stmnt;
	}	

	public function createNewWorkingScenario($scenarioID) {
		$this -> deleteWorkingScenario($scenarioID);
		$this -> insertWorkingScenario($scenarioID);
		
		$a = array('a'=>"");
		$stmnt = "SELECT count(*) as cnt FROM `Consulting`.`DC_scenarioNames` where id = ".$scenarioID.";";
		$result = $this->connection->fetchAll($stmnt);				
		if ($result[0]['cnt'] == 0) {
			$stmnt = "INSERT INTO  `Consulting`.`DC_scenarioNames`	(`id`, `namen`)
					   VALUES (".$scenarioID.", 'wrkscen');";
			$result = $this->connection->prepare($stmnt);		
			$result->execute();	
		};

		return $stmnt;
	}
	
	public function deleteAllScenarios() {
		$stmntData = "DELETE FROM `Consulting`.`DC_scenarioData`
					      USING `Consulting`.`DC_scenarioNamesDead`, `Consulting`.`DC_scenarioData`
						  WHERE id = scenarioID";
		$result = $this->connection->prepare($stmntData);		
		$result->execute();	
		
		$stmntProxy = "DELETE FROM `Consulting`.`DC_scenarioDataProxy`
						USING `Consulting`.`DC_scenarioNamesDead`, `Consulting`.`DC_scenarioDataProxy`
						WHERE id = scenarioID";
		$result = $this->connection->prepare($stmntProxy);
		$result->execute();			
		
		$stmntDvbt = "DELETE FROM `Consulting`.`DC_deviceBaseTable`
						USING `Consulting`.`DC_scenarioNamesDead`, `Consulting`.`DC_deviceBaseTable`
						WHERE id = scenarioID";
		$result = $this->connection->prepare($stmntDvbt);
		$result->execute();			
		
		$stmnt = "SELECT count(*) as cnt FROM `Consulting`.`DC_scenarioNames` WHERE id < 9999";
		$result = $this->connection->fetchAll($stmnt); 		
		
		$cnt = max($result[0]['cnt'] - 10, 0);
		
		$stmnt = "DELETE FROM `Consulting`.`DC_scenarioNames`
					WHERE id < 9999
					ORDER BY timestamp ASC
					LIMIT ".$cnt.";";
		$result = $this->connection->prepare($stmnt);
		$result->execute();	
	}		
	
	public function deleteWorkingScenario($scenarioID) {
		$stmntData = "DELETE FROM `Consulting`.`DC_scenarioData` WHERE scenarioID = ".$scenarioID;
		$result = $this->connection->prepare($stmntData);		
		$result->execute();	
		
		$stmntProxy = "DELETE FROM `Consulting`.`DC_scenarioDataProxy` WHERE scenarioID = ".$scenarioID;
		$result = $this->connection->prepare($stmntProxy);
		$result->execute();	
		
		/*$stmntScen = "DELETE FROM `Consulting`.`DC_scenarioNames` WHERE id = ".$scenarioID;
		$result = $this->connection->prepare($stmntScen);
		$result->execute();	*/
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
	
	public function writeViewToTable($scenarioID, $isMarket) {	
		
		$isMarket = 0;
		// fopr now lets override Market method
		
		$delStmnt = "DELETE FROM `Consulting`.`DC_deviceBaseTable` WHERE scenarioID = ".$scenarioID."; ";
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
			FROM `Consulting`.".(($isMarket == 0) ? 'DC_deviceBase' : 'DC_deviceBaseMarket')."
				WHERE scenarioID = ".$scenarioID.";";
		$result = $this->connection->prepare($insStmnt);		
		$result->execute();		
		
		return "ok"; // some error handling would be nice
	}

	public function testFile($a) {
		return $a;
	}

	/*public function insertExportIds($scenarioID, $countryIDs) {	
		$b = (array)$countryIDs;
		$st = "";
		for ($j = 0; $j < count($b); $j++) {				
			$stmnt  = "
				INSERT INTO Consulting.DC_exportIDTable
					(scenarioID, countryID, indicatorID)
				VALUES 
				    (".$scenarioID.",".$b[$j].", NULL);";		
			$result = $this->connection->prepare($stmnt);
			$result->execute();					
			$st = $st.$stmnt;
		};		
		return $st;
	}*/

	/*
	public function deleteExportIds($scenarioID) {
		return true;
	}*/

}		
?>

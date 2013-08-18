<?php

require_once 'Zend/Db/Adapter/Mysqli.php';
require_once 'Depot5_sqlFormation.php';

class Depot31 {

	public function __construct() {
		$this->connection = new Zend_Db_Adapter_Mysqli(array(
			'host'     => '192.168.44.200',
			'username' => 'cFullUserPW', // full user. a bit risky.
			'password' => 'c5ul1Use1QP',
			'dbname'   => 'Consulting'
		));
	}	
	
// this one should not be used; all data are present in scenarioData Table		
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
					Y2012 = ".$b['Y2012'].", Y2013 = ".$b['Y2013'].", 
					Y2014 = ".$b['Y2014'].", Y2015 = ".$b['Y2015'].", Y2016 = ".$b['Y2016'].", 
					Y2017 = ".$b['Y2017'].", Y2018 = ".$b['Y2018'].", Y2019 = ".$b['Y2019'].", 
					Y2020 = ".$b['Y2020'].", Y2021 = ".$b['Y2021']."
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
		return true;
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
		
		$stmntRPC = "DELETE FROM `Consulting`.`DC_newReplacementRateTable`
						USING `Consulting`.`DC_scenarioNamesDead`, `Consulting`.`DC_newReplacementRateTable`
						WHERE id = scenarioID";
		$result = $this->connection->prepare($stmntRPC);
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
		
		$stmntRp = "DELETE FROM `Consulting`.`DC_newReplacementRateTable` WHERE scenarioID = ".$scenarioID.";";
		$result = $this->connection->prepare($stmntRp);		
		$result->execute();
		
		/*$stmntScen = "DELETE FROM `Consulting`.`DC_scenarioNames` WHERE id = ".$scenarioID;
		$result = $this->connection->prepare($stmntScen);
		$result->execute();	*/
	}	
		
	public function insertWorkingScenario($scenarioID) {
		$yrsField = "`Y2002`, `Y2003`, `Y2004`, `Y2005`, `Y2006`,`Y2007`,`Y2008`,`Y2009`,`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,
					 `Y2015`,`Y2016`,`Y2017`,`Y2018`,`Y2019`,`Y2020`,`Y2021`";

		$stmntMacro = "
			INSERT INTO `Consulting`.`DC_scenarioData`
				(`scenarioID`,`countryID`,`indicatorID`, `deviceID`, typeID, `unitID`,
				".$yrsField.")
			SELECT
				".$scenarioID." as `scenarioID`,`countryID`,`indicatorID`, `deviceID`, `typeID`, `unitID`,
				".$yrsField."
			FROM `Consulting`.`DC_scenarioData`
				WHERE scenarioID = 10001;";
		
		$result = $this->connection->prepare($stmntMacro);
		$result->execute();	
		
		$stmntProxy = "
			INSERT INTO `Consulting`.`DC_scenarioDataProxy`
				(`scenarioID`,`countryID`,`indicatorID`,`deviceID`,	`typeID`,`unitID`,
				".$yrsField.")
			SELECT
				".$scenarioID." as `scenarioID`,`countryID`,`indicatorID`,`deviceID`, `typeID`, `unitID`,
				".$yrsField."
			FROM `Consulting`.`DC_scenarioDataProxy`
				WHERE scenarioID = 10001;"; // get the base scenario
		
		$result = $this->connection->prepare($stmntProxy);
		$result->execute();			
		
		$stmntTest = "SELECT count(*) FROM `Consulting`.`DC_scenarioData` where scenarioID = ".$scenarioID.";";		
		$result = $this->connection->prepare($stmntTest);
		$result->execute();			
		
		$this->insertReplacementRate($scenarioID); // for replcemenet rates
		
		return $result;
	} 
	
	public function insertReplacementRate($scenarioID) {
		$yrsField = "`Y2006`,`Y2007`,`Y2008`,`Y2009`,`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,
					 `Y2015`,`Y2016`,`Y2017`,`Y2018`,`Y2019`,`Y2020`,`Y2021`";
					 
		// clean table
		$delStmnt1 = "DELETE FROM `Consulting`.`DC_newReplacementRateTable` WHERE scenarioID = ".$scenarioID.";";
		$result1 = $this->connection->prepare($delStmnt1);		
		$result1->execute();	
		// write from view to static table;
		$insStmnt1 = "\r\n	INSERT INTO `Consulting`.`DC_newReplacementRateTable` \r\n (`scenarioID`,`countryID`,`deviceID`, ".$yrsField.")
					SELECT `scenarioID`,`countryID`,`deviceID`, ".$yrsField."
					FROM `Consulting`.`DC_newReplacementRate`
					WHERE scenarioID = ".$scenarioID.";";	
		$result2 = $this->connection->prepare($insStmnt1);		
		$result2->execute();	
	}
	
	public function writeViewToTable($scenarioID, $isMarket, $isMarketSize) {	
		$yrsField = "`Y2006`,`Y2007`,`Y2008`,`Y2009`,`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,
					 `Y2015`,`Y2016`,`Y2017`,`Y2018`,`Y2019`,`Y2020`,`Y2021`";
					 
		//$isMarket = 0;
		// for now lets override Market method
		//$isMarketSize = 0;
		
		if ($isMarketSize == 2) {
			// clean table
			$delStmnt1 = "DELETE FROM `Consulting`.`DC_newReplacementRateTable` WHERE scenarioID = ".$scenarioID.";";
			$result1 = $this->connection->prepare($delStmnt1);		
			$result1->execute();	
			// write from view to static table;
			$insStmnt1 = "\r\n	INSERT INTO `Consulting`.`DC_newReplacementRateTable` \r\n (`scenarioID`,`countryID`,`deviceID`, ".$yrsField.")
						SELECT `scenarioID`,`countryID`,`deviceID`, ".$yrsField."
						FROM `Consulting`.`DC_newReplacementRate`
						WHERE scenarioID = ".$scenarioID.";";	
			$result2 = $this->connection->prepare($insStmnt1);		
			$result2->execute();	
		};
		
		if ($isMarketSize == 0) {
			$delStmnt  = "DELETE FROM `Consulting`.`DC_deviceBaseTable` WHERE scenarioID = ".$scenarioID.";";			
		} else if ($isMarketSize == 2) {
			$delStmnt = "DELETE FROM `Consulting`.`DC_scenarioData` WHERE indicatorID = 277 and scenarioID = ".$scenarioID.";";
		} else { // delete market size from DB 
			$delStmnt = "DELETE FROM `Consulting`.`DC_scenarioData` WHERE indicatorID = 210 and scenarioID = ".$scenarioID.";";
		};		
		
		$result = $this->connection->prepare($delStmnt);		
		$result->execute();	
		
		$delStmnt2 = "DELETE FROM `Consulting`.`DC_scenarioData` WHERE indicatorID = 213 AND scenarioID = ".$scenarioID.";";
		$result = $this->connection->prepare($delStmnt2);		
		$result->execute();	
		
		if ($isMarketSize == 0) {		
			$insStmnt = "\r\n	INSERT INTO `Consulting`.`DC_deviceBaseTable` \r\n (`scenarioID`,`countryID`,`deviceID`,`indicatorID`,".$yrsField.")
							SELECT `scenarioID`,`countryID`,`deviceID`,`indicatorID`, ".$yrsField."
							FROM `Consulting`.".(($isMarket == 0) ? 'DC_deviceBase' : 'DC_deviceBaseMarket')."
							WHERE scenarioID = ".$scenarioID.";";				
		} else if ($isMarketSize == 2) {
			$insStmnt = "\r\n	INSERT INTO `Consulting`.`DC_scenarioData` \r\n (`scenarioID`,`countryID`,`deviceID`, `indicatorID`, ".$yrsField.")
							SELECT `scenarioID`,`countryID`,`deviceID`, 277 as `indicatorID`, ".$yrsField."
							FROM `Consulting`.`DC_newReplacementRateTable`
							WHERE scenarioID = ".$scenarioID.";";		
		} else {
			$insStmnt = "\r\n	INSERT INTO `Consulting`.`DC_scenarioData` \r\n (`scenarioID`,`countryID`,`deviceID`, `indicatorID`,".$yrsField.")
							SELECT `scenarioID`,`countryID`,`deviceID`, 210 as `indicatorID`, ".$yrsField."
							FROM `Consulting`.`DC_salesWTrend`
							WHERE scenarioID = ".$scenarioID.";";
		};
		
		$result = $this->connection->prepare($insStmnt);		
		$result->execute();		
		
		$insStmnt2 = "\r\n	INSERT INTO `Consulting`.`DC_scenarioData` \r\n (`scenarioID`,`countryID`,`deviceID`, `indicatorID`, ".$yrsField.")
							SELECT `scenarioID`,`countryID`,`deviceID`, 213 as `indicatorID`, ".$yrsField."
							FROM `Consulting`.`DC_scenarioDataHHpenW`
							WHERE scenarioID = ".$scenarioID.";";	
		
		$result = $this->connection->prepare($insStmnt2);		
		$result->execute();		
		
		return "ok"; // $insStmnt; // some error handling would be nice
		//return $insStmnt;
	}

	public function testFile($a) {
		return $a;
	}

	public function updateData2($data, $isDeviceBase, $deviceID, $typeID, $startYear, $shockValue) { // id indicator hasSplit by batTypes
		$arr0 = (array)$data;
		$arr = $arr0['data'];		
		
		$srcTable = "";	 $srcTable = "Consulting.DC_scenarioData sdt";		
		//if ($isDeviceBase == 1) $srcTable = "Consulting.DC_deviceBaseTable"; 				
		
		$updateYears = ""; 
		for ($u = $startYear; $u <= 2021; $u++) {
			if (($u % 3) == 0)  $updateYears = $updateYears."\r\n";		
			$updateYears = $updateYears.($u > $startYear ? ", " : "" );
			
			if ($shockValue != 0) $updateYears = $updateYears."sdt.Y".$u." = ( a.Y".$u." * ". (1 + $shockValue/100).")";			
		};		

		$devLevel     = (($deviceID > 200) ? " ndv.categoryID " : " ndv.id");
		$devLevelFull = (($deviceID >   0) ?  (" AND ".$devLevel."=".$deviceID) : "");
		
		for ($j = 0; $j < count($arr); $j++) {		
			$b =(array) $arr0['data'][$j]; 
			
			if ($shockValue == 0) { // this code part for single value update from dataGrid
				$updateYears = "";
				for ($u = $startYear; $u <= 2021; $u++) {
					if (($u % 3) == 0) $updateYears = $updateYears."\r\n";
					$updateYears = $updateYears.($u > $startYear ? ", " : "" );
					$updateYears = $updateYears.'sdt.Y'.$u." = ".$b['Y'.$u]; 
				};
			};

			$newUpdate = "\r\n UPDATE ".$srcTable."
							JOIN (
								SELECT * FROM Consulting.DC_scenarioData sdt2    
								LEFT JOIN Consulting.DC_namesDevices ndv ON (ndv.id = sdt2.deviceID)
								WHERE 
									sdt2.scenarioID = 10001 AND sdt2.countryID = ".$b['countryID']."
									AND sdt2.indicatorID = ".$b['indicatorID'].$devLevelFull." AND sdt2.typeID = ".$typeID."
								) as a
							ON ( sdt.countryID = a.countryID AND sdt.indicatorID = a.indicatorID
								 AND sdt.deviceID = a.deviceID AND sdt.typeID = a.typeID)
							SET ".$updateYears." WHERE sdt.scenarioID = ".$b['scenarioID'];
			
			$result = $this->connection->prepare($newUpdate);
			$result->execute();		
		};		
		//return true;
		return  $newUpdate;		
	}		

	public function recalcDeviceBase($scenarioID, $cntryList) {
		$depot =  new Depot5_sqlFormation();		
		// clean up
		$delStmnt = $depot->formDeleteDataFromDevBase($scenarioID, $cntryList);
		$resDel = $this->connection->prepare($delStmnt);		
		$resDel->execute();
		// get data
		$readStmnt = $depot->formGetDataForDevBase($scenarioID, $cntryList);
		$rawDataArray = $this->connection->fetchAll($readStmnt);					
		// calc
		$rezArray = $depot->calcNewDevBase($rawDataArray);		
		// update tbl
		$updStmnt = $depot->formInsertDataForDevBase($scenarioID, $rezArray, 1000);
		$resUpd = $this->connection->prepare($updStmnt);		
		$resUpd->execute();
		// check if all ok
		$testIns = $depot->formTestInsertion($scenarioID, $cntryList);	
		$resIns  = $this->connection->fetchAll($testIns);					
		$cnt = $resIns[0]['tot'];
		
		return  $cnt;
	}
}		
?>

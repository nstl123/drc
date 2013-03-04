<?php

require_once 'Zend/Db/Adapter/Mysqli.php';

class Base2 {

	public function __construct() {
		$this->connection = new Zend_Db_Adapter_Mysqli(array(
			'host'     => '192.168.44.200',
			'username' => 'cFullUserPW', // full user. a bit risky.
			'password' => 'c5ul1Use1QP',
			'dbname'   => 'Consulting'
		));
	}
	
	public function aut($t1, $t2) {					
		if (($t1 == 'Emi') && ($t2 == 'emi'))	{
			return 1;			
		} else {
			return 0;			
		};
	}				

	// for testinf purposes only to prepare update statement
	public function getMacroData($scenarioID, $sessionID, $countryID, $indicatorID ) {
		$a = array('a'=>"");
		$stmnt = "
			SELECT scenarioID, sessionID, countryID, indicatorID, unitID, Y2005, Y2010
			FROM Consulting.DC_scenarioDataMacro 
			WHERE scenarioID = ".$scenarioID."
				AND sessionID = ".$sessionID."
				AND countryID = ".$countryID."
				AND indicatorID = ".$indicatorID.";";
		
		$result = $this->connection->fetchAll($stmnt);
		array_push($a, $result);		
	    return $result;
	}
	
	/*public function updateMacroIndis($data) { // access testData
	// uses UPDATE
	$arr = (array) $data;
	$stmnt = "
		UPDATE Consulting.DC_scenarioDataMacro SET						
			Y2005 = ".$arr['Y2005'].", Y2010 = ".$arr['Y2010']."
		WHERE scenarioID = ".$arr['scenarioID']."
			AND sessionID = ".$arr['sessionID']."
			AND countryID = ".$arr['countryID']."
			AND indicatorID = ".$arr['indicatorID'].";";
	
		$result = $this->connection->prepare($stmnt);
		$result->execute();	
		
		return  $arr['countryID'];
	}	
	
	public function createNewWorkingScenario($scenarioID) {
		deleteWorkingScenario($scenarioID);
		insertWorkingScenario($scenarioID);
		return true;
	}
	
	public function deleteWorkingScenario($scenarioID) {
		$stmntMacro = "DELETE FROM `Consulting`.`DC_scenarioDataMacro` WHERE scenarioID = ".$scenarioID;
		$result = $this->connection->prepare($stmntMacro);		
		$result->execute();	
		
		$stmntSplit = "DELETE FROM `Consulting`.`DC_scenarioDataSplit` WHERE scenarioID = ".$scenarioID;
		$result = $this->connection->prepare($stmntSplit);
		$result->execute();	
	}	
	
	public function insertWorkingScenario($scenarioID) {

		$stmntMacro = "
			INSERT INTO `Consulting`.`DC_scenarioDataMacro`
				(`sessionID`,`scenarioID`,`countryID`,`indicatorID`, `unitID`,
				`Y2000`,`Y2001`,`Y2002`,`Y2003`,`Y2004`,`Y2005`,`Y2006`,`Y2007`,`Y2008`,
				`Y2009`,`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,`Y2015`,`Y2016`,`Y2017`,
				`Y2018`,`Y2019`,`Y2020`,`Y2021`,`Y2022`,`Y2023`,`Y2024`,`Y2025`)
			SELECT
				".$scenarioID." as `sessionID`, ".$scenarioID." as `scenarioID`,`countryID`,`indicatorID`,`unitID`,
				`Y2000`,`Y2001`,`Y2002`,`Y2003`,`Y2004`,`Y2005`,`Y2006`,`Y2007`,`Y2008`,
				`Y2009`,`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,`Y2015`,`Y2016`,`Y2017`,
				`Y2018`,`Y2019`,`Y2020`,`Y2021`,`Y2022`,`Y2023`,`Y2024`,`Y2025`
			FROM `Consulting`.`DC_scenarioDataMacro`
				WHERE scenarioID = 10001;";
		
		$result = $this->connection->prepare($stmntMacro);
		$result->execute();	
		
		$stmntSplit = "
			INSERT INTO `Consulting`.`DC_scenarioDataSplit`
				(`sessionID`,`scenarioID`,`countryID`,`indicatorID`,`deviceID`,
				`typeID`,`chemistryID`,`unitID`,
				`Y2000`,`Y2001`,`Y2002`,`Y2003`,`Y2004`,`Y2005`,`Y2006`,`Y2007`,`Y2008`,
				`Y2009`,`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,`Y2015`,`Y2016`,`Y2017`,
				`Y2018`,`Y2019`,`Y2020`,`Y2021`,`Y2022`,`Y2023`,`Y2024`,`Y2025`)
			SELECT
				".$scenarioID." as `sessionID`, ".$scenarioID." as `scenarioID`,`countryID`,`indicatorID`,`deviceID`,
				`typeID`,`chemistryID`,`unitID`,
				`Y2000`,`Y2001`,`Y2002`,`Y2003`,`Y2004`,`Y2005`,`Y2006`,`Y2007`,`Y2008`,
				`Y2009`,`Y2010`,`Y2011`,`Y2012`,`Y2013`,`Y2014`,`Y2015`,`Y2016`,`Y2017`,
				`Y2018`,`Y2019`,`Y2020`,`Y2021`,`Y2022`,`Y2023`,`Y2024`,`Y2025`
			FROM `Consulting`.`DC_scenarioDataSplit`
				WHERE scenarioID = 10001;"; // get the base scenario
		
		$result = $this->connection->prepare($stmntSplit);
		$result->execute();			
		
		$stmntTest = "SELECT count(*) FROM `Consulting`.`DC_scenarioDataMacro` where scenarioID = ".$scenarioID.";";		
		$result = $this->connection->prepare($stmntTest);
		$result->execute();			
		
		return $result;
	}
*/

}		
?>







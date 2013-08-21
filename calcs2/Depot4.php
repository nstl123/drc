<?php

require_once 'Zend/Db/Adapter/Mysqli.php';

class Depot4 {

	public function __construct() {
		$this->connection = new Zend_Db_Adapter_Mysqli(array(
			'host'     => '192.168.44.200',
			'username' => 'cFullUserPW', // full user. a bit risky.
			'password' => 'c5ul1Use1QP',
			'dbname'   => 'Consulting'
		));
	}	
	
	public function testScenario($scenarioID) {		
		$tst = "SELECT count(*) as quant FROM `Consulting`.`DC_exportIDTable` WHERE scenarioID= ".$scenarioID;
		$result = $this->connection->fetchAll($tst);
		$emptyTable = ($result[0]['quant'] == 0);				
		return $emptyTable;
	}

	public function insertExportIds($scenarioID, $countryIDs, $indicatorID, $indicatorID2) {	
		// 1. test for this scenario count
		$isZero = $this -> testScenario($scenarioID);
		// delete if there are any
		if (!$isZero) { $this -> deleteExportIds($scenarioID); };
	
		$b = explode(",", $countryIDs);		
		$stmnt  = ""; $a = "";		
		$st = " \r\n INSERT INTO Consulting.DC_exportIDTable
						(scenarioID, countryID, indicatorID, aggLevel)
					VALUES \r\n";		
		for ($j = 0; $j < count($b); $j++) {							
			if ($j > 0)  $a = ","; 
			$stmnt  = $a."(".$scenarioID.", ".$b[$j].", ".$indicatorID.", 0) ";					
			$st = $st.$stmnt;
		};				
		$result = $this->connection->prepare($st);
		$result->execute();					
		
		$stmnt  = ""; $a = "";		
		$st = " \r\n INSERT INTO Consulting.DC_exportIDTable
						(scenarioID, countryID, indicatorID, aggLevel)
					VALUES \r\n";	
		if ($indicatorID2 > 0) {
			for ($j = 0; $j < count($b); $j++) {							
				if ($j > 0)  $a = ","; 
				$stmnt  = $a."(".$scenarioID.", ".$b[$j].", ".$indicatorID2.", 0) ";					
				$st = $st.$stmnt;
			};				
			$result = $this->connection->prepare($st);
			$result->execute();					
		};
		return $st;		
	}

	
	public function deleteExportIds($scenarioID) {
		$stmnt = "
			DELETE FROM Consulting.DC_exportIDTable
			WHERE scenarioID = ".$scenarioID;
		
		$result = $this->connection->prepare($stmnt);
		$result->execute();					
		
		return true;
	}

}		
?>

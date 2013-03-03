<?php
require_once 'Zend/Db/Adapter/Mysqli.php';

class BaseInsDel {

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
	
	public function updateMacroIndis($data) { // access testData
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
}		
?>

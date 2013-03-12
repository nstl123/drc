<?php

require_once 'Zend/Db/Adapter/Mysqli.php';

class Depot21 {

	public function __construct() {
		$this->connection = new Zend_Db_Adapter_Mysqli(array(
			'host'     => '192.168.44.200',
			'username' => 'cFullUserPW', // full user. a bit risky.
			'password' => 'c5ul1Use1QP',
			'dbname'   => 'Consulting'
		));
	}	
	
	public function getMacroDataFormat($n) {
		$a = array();
		for ($i = 0; $i < $n; $i++) {
			$z = array('id'=>$i, 'namen'=>'na');
			array_push($a, $z);
		};
		return $a;
	}
	
	public function getMacroData($countryIDs, $indicatorID) {
		$a = array('a'=>"");
		
		$scenarioID = 10001;
		$sessionID = 10001;	
		$countryArray = (array)($countryIDs);		
		$countryList = " (";
		//$countyList .= implode(",", $countryArray);		
		//$countyList = substr($countyList, 2, -2);		
		//$countyList = " (".$countyList.") ";
		for ($i = 0; $i < count($countryArray); $i++) {
			if ($i > 0) { $countryList = $countryList.", ".$countryArray[$i]; }			
			else $countryList = $countryList.$countryArray[$i];
		}
		$countryList = $countryList." )";
		
		$stmnt = "SELECT scenarioID, sessionID, countryID, indicatorID, deviceID, 
			Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2011, Y2012, Y2013, Y2014, Y2015
			FROM Consulting.DC_scenarioDataSplit 
			WHERE scenarioID = ".$scenarioID."
				AND sessionID = ".$sessionID."
				AND countryID in ".$countryList."
				AND indicatorID = ".$indicatorID."
				AND deviceID = 1;";
		
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return $countryList;
	}
}		
?>

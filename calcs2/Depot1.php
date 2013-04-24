<?php

require_once 'Zend/Db/Adapter/Mysqli.php';

class Depot1 {

	public function __construct() {
		$this->connection = new Zend_Db_Adapter_Mysqli(array(
			'host'     => '192.168.44.200',
			'username' => 'cFullUserPW', // full user. a bit risky.
			'password' => 'c5ul1Use1QP',
			'dbname'   => 'Consulting'
		));
	}	
	
	public function getCountryList($isRegion) {	
		$a = array('a'=>"");
		$sqlSr = "SELECT *, false as active FROM `Consulting`.`DC_namesCountries` cntr WHERE cntr.isRegion = ".$isRegion."
					ORDER BY namen ASC";
		$result = $this->connection->fetchAll($sqlSr);
		array_push($a, $result);		
	    return $result;
	}		

	public function getCountryListTree($isRegion) {	
		$a = array('a'=>"");
		$sqlSr = "SELECT *, false as active FROM `Consulting`.`DC_namesCountries` cntr WHERE 
					cntr.isRegion <= ".$isRegion."
					AND cntr.id <= 107
					ORDER BY id ASC";
		$result = $this->connection->fetchAll($sqlSr);
		array_push($a, $result);		
	    return $result;
	}		
	
	public function getCountryListADG() {	
		$a = array('a'=>"");
		$sqlSr = "SELECT nc1.id, nc1.isRegion, nc1.namen as namen, nc1.region, nc2.namen as region
					FROM `Consulting`.`DC_namesCountries` nc1
				 JOIN `Consulting`.`DC_namesCountries` nc2
				 ON (nc1.region = nc2.id)
				 WHERE nc1.isRegion = 0;";
		$result = $this->connection->fetchAll($sqlSr);
		array_push($a, $result);		
	    return $result;
	}			
	
	public function getIndicatorNames() {
	// $splitByDevices, $splitByTypes - this is done locally
	// form query depending on detail level needed
		$a = array('a'=>"");
		$stmnt = "
			SELECT * 
			FROM `Consulting`.`DC_namesIndicators`
				WHERE -- AND isOutputIndicator = 0 AND
				hasTimeSeries = 1";
		$result = $this->connection->fetchAll($stmnt);		
		array_push($a, $result);		
		return $result;
	}

	public function getDeviceNames() {
		$a = array('a'=>"");
		$stmnt = "
			SELECT * FROM `Consulting`.`DC_namesDevices`;";
		$result = $this->connection->fetchAll($stmnt);		
		array_push($a, $result);		
		return $result;
	}	
}		
?>

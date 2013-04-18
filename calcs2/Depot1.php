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
		/*$b = array();
		for ($i = 0; $i < 10000000; $i++) {
			$z = ($i +1)/2 + 1 - 0.01 * sin(2.3256 * $i) + sin($i) + cos($i*$i);
			//$z = array('id'=>$i, 'namen'=>'na');
			//array_push($b, $z);
		};*/	
		$a = array('a'=>"");
		$sqlSr = "SELECT *, false as active FROM `Consulting`.`DC_namesCountries` cntr WHERE cntr.isRegion = ".$isRegion."
					ORDER BY namen ASC";
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

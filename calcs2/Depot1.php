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
					ORDER BY region, namen ASC";
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
		/*$sqlSr = "	SELECT nc1.id, nc1.isRegion, nc1.namen as namen, nc1.region as regionID, nc2.namen as region, 
						nc3.namen as subRegion, false AS active, false AS modified
					FROM Consulting.DC_namesCountries nc1
						JOIN Consulting.DC_namesCountries nc2 ON (nc1.region    = nc2.id)
						JOIN Consulting.DC_namesCountries nc3 ON (nc1.subRegion = nc3.id)
					WHERE nc1.isRegion = 0 -- ORDER BY nc2.namen , nc3.namen, nc1.namen
				  UNION
					SELECT nc1.id, nc1.isRegion, nc1.namen as namen, nc1.region as regionID, 'Others' as region,
						nc2.namen as subRegion, false AS active, false AS modified
					FROM Consulting.DC_namesCountries nc1
						JOIN Consulting.DC_namesCountries nc2 ON (nc1.region    = nc2.id)    
					WHERE nc1.subRegion = 99
					ORDER BY region, subregion, namen;";*/
		$sqlSr = "SELECT nc1.id, nc1.isRegion, nc1.namen as namen, nc1.region as regionID, 
					nc3.namen as subRegion, nc2.namen as region, 
					false AS active, false AS modified
						  FROM Consulting.DC_namesCountries nc1
								JOIN Consulting.DC_namesCountries nc2 ON (nc1.region    = nc2.id)
								JOIN Consulting.DC_namesCountries nc3 ON (nc1.subRegion = nc3.id)
							WHERE nc1.isRegion = 0 -- ORDER BY nc2.namen , nc3.namen, nc1.namen
					UNION
					SELECT nc1.id, nc1.isRegion, nc1.namen as namen, nc1.region as regionID,
					-- 'Others' as region, nc2.namen as subRegion, 
					   'SELECT COUNTRIES' as suRegion, nc2.namen as region, 
					false AS active, false AS modified    
						FROM Consulting.DC_namesCountries nc1
							JOIN Consulting.DC_namesCountries nc2 ON (nc1.region    = nc2.id)    
				WHERE nc1.subRegion = 99
				ORDER BY region, subregion, namen;";
					
		$result = $this->connection->fetchAll($sqlSr);
		array_push($a, $result);		
	    return $result;
	}			
	
	public function getIndicatorNames() {
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

// here we need additional parameter, so the query returns both device and categories names&IDs. 
// locally it will be filtered out upon selection
	public function getDeviceNames() {
		$a = array('a'=>"");
		/*$stmnt = "SELECT id, namen, categoryID FROM `Consulting`.`DC_namesDevices`
					UNION
				  SELECT id, namen, NULL as categoryID FROM `Consulting`.`DC_namesDeviceCategories`;";*/
		$stmnt = "SELECT id, namen, categoryID FROM `Consulting`.`DC_namesDevicesVisual`
				  ORDER BY orderID;";
		$result = $this->connection->fetchAll($stmnt);		
		array_push($a, $result);		
		return $result;
	}	
}		
?>

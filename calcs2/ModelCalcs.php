<?php

require_once 'Zend/Db/Adapter/Mysqli.php';

class ModelCalcs {

	public function __construct() {
		$this->connection = new Zend_Db_Adapter_Mysqli(array(
			'host'     => '192.168.44.200',
			'username' => 'cFullUserPW', // full user. a bit risky?
			'password' => 'c5ul1Use1QP',
			'dbname'   => 'Consulting'
		));
	}		

	public function calcSalesMethod1() {	
		/*$a = array('a'=>"");
	// Query to get base data from DB
		$sqlSr = "SELECT 
					dbs.countryID, dbs.deviceID, sls.scenarioID,					
					dbs.Y2005 as db05, dbs.Y2006 as db06, dbs.Y2007 as db07, 
					depr.Y2005 as dpr05, depr.Y2006 as dpr06, depr.Y2007 as dpr07, 
					0 as sls05, sls.Y2006 as sls06, sls.Y2007 as sls07, 
					zr.Y2005 as zr05, zr.Y2006 as zr06, zr.Y2007 as zr07, 
					fot.Y2005 as fot05, fot.Y2006 as fot06, fot.Y2007 as fot07 
				FROM Consulting.DC_deviceBaseStatic dbs
				JOIN Consulting.DC_deviceBaseStatic depr
						ON (dbs.countryID = depr.countryID AND dbs.deviceID = depr.deviceID AND dbs.scenarioID = depr.scenarioID)
				JOIN Consulting.DC_deviceBaseFlags fot 
						ON (fot.countryID = dbs.countryID AND fot.deviceID = dbs.deviceID)
				JOIN Consulting.DC_deviceBaseFlags zr 
						ON (zr.countryID = dbs.countryID AND zr.deviceID = dbs.deviceID)
				JOIN Consulting.DC_salesWTrend sls 
						ON (sls.countryID = dbs.countryID AND sls.deviceID = dbs.deviceID)
				WHERE 
					dbs.countryID = 1 
					AND dbs.deviceID = 8 
					AND dbs.scenarioID = 10001 AND dbs.indicatorID = 203
					AND depr.indicatorID = 212 AND fot.indicatorID = 140 AND zr.indicatorID = 141;";		
					
		//$rawData = $this->connection->fetchAll($sqlSr);			
		/*$newDemand = array();
		$currObj = array();		
		for ($u = 0; $u < count($rawData); $u++) {			
			$currObj = array("countryID" => $rawData[$u]['countryID'], "deviceID " => $rawData[$u]['deviceID']);
			//, "scenarioID" => $rawData[$u]['scenarioID'], "dmnd" => $dmnd);
			array_push($newDemand, $currObj);
		};		
		array_push($a, $newDemand);*/
		
	    //return $sqlSr; //$rawData; // $a;
		return 1;
	}			
		
	public function calcSalesMethod2() {	
		$a = array('a'=>"");
	// Query to get base data from DB
		$sqlSr = "SELECT 
					dbs.countryID, dbs.deviceID, sls.scenarioID,					
					dbs.Y2005 as db05, dbs.Y2006 as db06, dbs.Y2007 as db07, 
					depr.Y2005 as dpr05, depr.Y2006 as dpr06, depr.Y2007 as dpr07, 
					0 as sls05, sls.Y2006 as sls06, sls.Y2007 as sls07, 
					zr.Y2005 as zr05, zr.Y2006 as zr06, zr.Y2007 as zr07, 
					fot.Y2005 as fot05, fot.Y2006 as fot06, fot.Y2007 as fot07 
				FROM Consulting.DC_deviceBaseStatic dbs
				JOIN Consulting.DC_deviceBaseStatic depr
						ON (dbs.countryID = depr.countryID AND dbs.deviceID = depr.deviceID AND dbs.scenarioID = depr.scenarioID)
				JOIN Consulting.DC_deviceBaseFlags fot 
						ON (fot.countryID = dbs.countryID AND fot.deviceID = dbs.deviceID)
				JOIN Consulting.DC_deviceBaseFlags zr 
						ON (zr.countryID = dbs.countryID AND zr.deviceID = dbs.deviceID)
				JOIN Consulting.DC_salesWTrend sls 
						ON (sls.countryID = dbs.countryID AND sls.deviceID = dbs.deviceID)
				WHERE 
					dbs.countryID = 1 
					AND dbs.deviceID = 8 
					AND dbs.scenarioID = 10001 AND dbs.indicatorID = 203
					AND depr.indicatorID = 212 AND fot.indicatorID = 140 AND zr.indicatorID = 141;";		
					
		//$rawData = $this->connection->fetchAll($sqlSr);			
		/*$newDemand = array();
		$currObj = array();		
		for ($u = 0; $u < count($rawData); $u++) {			
			$currObj = array("countryID" => $rawData[$u]['countryID'], "deviceID " => $rawData[$u]['deviceID']);
			//, "scenarioID" => $rawData[$u]['scenarioID'], "dmnd" => $dmnd);
			array_push($newDemand, $currObj);
		};		
		array_push($a, $newDemand);*/
		
	    return $sqlSr; //$rawData; // $a;
	}			

}
?>








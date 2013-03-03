<?php
//require_once 'Zend/Db/Adapter/Mysqli.php';

	$link = mysql_connect('192.168.44.200', 'cFullUserPW', 'c5ul1Use1QP');
	mysql_select_db('Consulting');	

	// delete all records in DC_deviceBase		
	$a = array('a'=>"");
	
	$aggLevel = 0;
	$scenarioID = 10001;
	$countryID = 1;
	$indicatorID = 201;
	$batTypeID = 1;
	$pwrTypeID = 1;
	$useUnion = true;
	
	$arr  = array ("scenarioID"  => 10003, "countryID" => 1, "indciatorID" => 15, "Y2005" => 41515.2);
	
		
	// $result = $this->connection->fetchAll($stmnt_f);		
	// array_push($a, $result);				
	
	echo $arr["scenarioID"];
	// insert new values from all the tables, that were updated by user input				

?>
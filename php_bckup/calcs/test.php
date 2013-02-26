<?php
//require_once 'Zend/Db/Adapter/Mysqli.php';

	$link = mysql_connect('192.168.44.200', 'cFullUserPW', 'c5ul1Use1QP');
	mysql_select_db('Consulting');	

	// delete all records in DC_deviceBase		
	$stmnt = "DELETE FROM `Consulting`.`DC_deviceBaseTable`
			  WHERE sessionID = 1 and scenarioID = 0";
	$rez = mysql_query($stmnt);
	
	echo $rez;
	// insert new values from all the tables, that were updated by user input				

?>
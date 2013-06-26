<?php

include 'Classes/PHPExcel/IOFactory.php';
$scenID = $_GET['scenarioID']; $typeID =  $_GET['typeID']; $aggLevel = $_GET['aggLevel'];

$link = mysql_connect('192.168.44.200', 'cFullUserPW', 'c5ul1Use1QP');
mysql_select_db('Consulting');

//query the database for the scenario data ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$namesPart = ""; $groupPart = "";  $a = ""; $fromTable="";
$indiCond = "";  $addTables  = ""; $indiJoin = "";

$stmnt = "SELECT distinct indicatorID FROM `Consulting`.`DC_exportIDTable`
	  WHERE scenarioID = ".$scenID;				  
$res = mysql_query($stmnt);
$indiID = mysql_fetch_row($res);
		
switch ($typeID) {	
	case 0:	// macro data
		$fromTable = "FROM Consulting.DC_scenarioData dma";
		$addTables = "";
		$indiJoin  = "JOIN Consulting.DC_namesIndicators nind 
						ON (nind.id = dma.indicatorID)";
		$indiCond  = "AND dma.indicatorID = dxt.indicatorID";
		$a = "nind.namen AS indicatorName";
		break;
	case 1: // means battery factors	
		$fromTable = "FROM Consulting.DC_scenarioData dma";
		$addTables = "JOIN Consulting.DC_namesDevices ndv ON (ndv.id = dma.deviceID)
					  JOIN Consulting.DC_namesDeviceCategories ndvc ON (ndvc.id = ndv.categoryID)";
		$indiJoin  = "JOIN Consulting.DC_namesIndicators nind 
						ON (nind.id = dma.indicatorID)";		
		$indiCond  = "AND dma.indicatorID = dxt.indicatorID";
		$a         = "nind.namen AS indicatorName";
		break;				
	case 2:	 // nothing there yet
		//	deviseBase Table
		break;

	case 3: // means demand tab	
		$fromTable  = "FROM Consulting.DC_demand dma";
		$addTables  = "JOIN Consulting.DC_namesDevices ndv ON (ndv.id = dma.deviceID)
					  JOIN Consulting.DC_namesDeviceCategories ndvc ON (ndvc.id = ndv.categoryID)";
		$indiJoin   = "";
		$indiCond   = "";
		$a          = "'demand' AS indicatorName"; 
		break;	
};

$k =  (int)($indiID[0]);
$indicatorName = "";

if ($k == 300) {
		$namesPart = ", 'NA'       AS deviceName";
		$groupPart = "";		
} else if  ($k == 301) {	
		$namesPart = ", ndv.namen  AS deviceName";
		$groupPart = ", deviceID";		
} else if  ($k == 302) {		
		$namesPart = ", ndvc.namen AS deviceName";
		$groupPart = ", categoryID";		
} else if  ($k < 200) {	// macro
		$namesPart = ", null AS deviceName";
		$groupPart = "";
		
} else if  ($k == 401) { // deviceBase		

		// add another table		
		
} else if  ($k > 200) {	// all exogenous		
		// need to add pwrTypes and dop summing
		$namesPart = ", ndv.namen AS deviceName";
		$groupPart = ($aggLevel == 1 ? ", deviceID" : ", categoryID");				
};

$yrsList = "";
for ($u = 2006; $u < 2022; $u++) { 
	$yrsList = $yrsList.", sum( dma.Y".$u." ) AS Y".$u; 
};

$query  = "\r\n SELECT dma.scenarioID, dma.countryID, cntn.namen as countryName, ".$a."
			\r\n".$yrsList."\r\n".
			$namesPart."\r\n".$fromTable."
			JOIN Consulting.DC_exportIDTable dxt 
				ON (dma.scenarioID = dxt.scenarioID AND dma.countryID = dxt.countryID ".$indiCond.")			
			JOIN Consulting.DC_namesCountries cntn  
				ON (cntn.id = dma.countryID)".			
			$addTables.$indiJoin."			
			WHERE dma.scenarioID = ".$scenID."			
			GROUP BY scenarioID, countryID".$groupPart;
			
$select_result = mysql_query($query);	
//$select_result  = true;
if ($select_result) {	
	$timeIDs[]     = ""; $timeNames[] = "";				
	$i = 0;	$n = 0;

	$phpExcel = new PHPExcel();
	$phpExcel->setActiveSheetIndex(0);
	$phpExcel->getActiveSheet()->setTitle("Demand_".$scenID);

	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 1, "scenarioID");
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(1, 1, "countryName");	
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(2, 1, "indicator");
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(3, 1, "device/category");
	
	for ($u = 0; $u < 16; $u++) {		
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(4 + $u, 1, (string)("Y".(string)(2006 + $u)) );	
	};
		
	
	$m = 0;	
	while ($row = mysql_fetch_array($select_result, MYSQL_ASSOC)) {
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0,  $m + 2, $row["scenarioID"]);	
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(1,  $m + 2, $row["countryName"]);		
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(2,  $m + 2, $row["indicatorName"]);				
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(3,  $m + 2, $row["deviceName"]);				
		
		for ($u = 0; $u < 16; $u++) {	
			$yr = (string)("Y".(string)(2006+$u));
			$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(4 + $u, $m + 2,  $row[$yr]);	
		};
		
		$m += 1;
	}//while row
	
	header("Content-Type: application/vnd.ms-excel");
	header("Content-Disposition: attachment; filename=\"DataOutput_".time().".xls\"");
	header("Cache-Control: max-age=0");
	$objWriter = PHPExcel_IOFactory::createWriter($phpExcel, "Excel5");
	$objWriter->save("php://output");
	// cannot save here data? 
	echo "data exported successfully";
	//echo $query;
}// if select result
else {
	//echo "DB_Error";	exit;
	echo "file read/write error";	
};

?>
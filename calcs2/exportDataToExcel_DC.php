<?php

include 'Classes/PHPExcel/IOFactory.php';

$scenID = $_GET['scenarioID'];

$link = mysql_connect('192.168.44.200', 'cFullUserPW', 'c5ul1Use1QP');
mysql_select_db('Consulting');

//query the database for the scenario data ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$query  = "
		SELECT dma.scenarioID, dma.countryID, cntn.namen as countryName,
			dma.aggCountryID, cntn2.namen as aggCountryName, dma.batTypeID, nbt.namen as SizeSplit, dma.pwrTypeID,
			nbs.namen as PowerSplit,
			dma.Y2004,dma.Y2005,dma.Y2006,dma.Y2007,dma.Y2008,dma.Y2009, dma.Y2010
			FROM Consulting.DC_demandAggregated dma
		JOIN Consulting.DC_exportIDTable dxt on (dma.scenarioID = dxt.scenarioID and dma.countryID = dxt.countryID)
		JOIN Consulting.DC_namesCountries cntn  ON (cntn.id = dma.countryID)
		JOIN Consulting.DC_namesCountries cntn2 ON (cntn2.id = dma.aggCountryID)
		JOIN Consulting.DC_namesBatTypes nbt ON (nbt.id = dma.batTypeID)
		JOIN Consulting.DC_namesBatSorts nbs ON (nbs.id = dma.pwrTypeID)
		WHERE dma.scenarioID = ".$scenID;
			
$select_result = mysql_query($query);	
if ($select_result) {
	//arrays for data
	$timeIDs[]     = ""; $timeNames[] = "";				
	$i = 0;	$n = 0;
// put the data into a PHPExcel object, and then output it ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	$phpExcel = new PHPExcel();
	$phpExcel->setActiveSheetIndex(0);
	$phpExcel->getActiveSheet()->setTitle("workingScenario_".$scenID);

		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 1, "scenarioID");
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(1, 1, "countryName");
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(2, 1, "proxy country");
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(3, 1, "indicator");
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(4, 1, "Y2004");
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(5, 1, "Y2005");
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(6, 1, "Y2006");	
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(7, 1, "Y2007");
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(8, 1, "Y2008");
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(9, 1, "Y2009");
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(10, 1, "Y2010");
	
	$m = 0;	
	while ($row = mysql_fetch_array($select_result, MYSQL_ASSOC)) {
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0,  $m+2, $row["scenarioID"]);	
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(1,  $m+2, $row["countryName"]);
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(2,  $m+2, $row["aggCountryName"]);				
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(3,  $m+2, "agg. demand");				
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(4,  $m+2, $row["Y2004"]);
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(5,  $m+2, $row["Y2005"]);
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(6,  $m+2, $row["Y2006"]);
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(7,  $m+2, $row["Y2007"]);
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(8,  $m+2, $row["Y2008"]);
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(9,  $m+2, $row["Y2009"]);
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(10,  $m+2, $row["Y2010"]);
		$m += 1;
	}//while row
	
	header("Content-Type: application/vnd.ms-excel");
	header("Content-Disposition: attachment; filename=\"ModelOutput_".time().".xls\"");
	header("Cache-Control: max-age=0");
	$objWriter = PHPExcel_IOFactory::createWriter($phpExcel, "Excel5");
	$objWriter->save("php://output");
	// cannot save here data? 
	return "reached bottom";
	//exit;			
}// if select result
else {
	//echo "DB_Error";	exit;
	return "DB_error";
};

?>
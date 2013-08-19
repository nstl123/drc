<?php

include 'Classes/PHPExcel/IOFactory.php';
include 'Depot5_sqlFormation.php';

$scenID    = $_GET['scenarioID']; $typeID = $_GET['typeID'];  $aggLevel  = $_GET['aggLevel']; 
$batTypeID = $_GET['batTypeID'];  $pwrID  = $_GET['pwrID'];   $showPerHH = $_GET['perHH']; 

$link = mysql_connect('192.168.44.200', 'cFullUserPW', 'c5ul1Use1QP');
mysql_select_db('Consulting');

//query the database for the scenario data ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$namesPart = ""; $groupPart = "";  $a = ""; $fromTable="";
$indiCond = "";  $addTables  = ""; $indiJoin = "";
$typeNames = ""; $typeJoins = ""; $typeGroupBy = "";

$sizeNames = array("C", "D", "AAA", "9V", "AA", "Coin And Button", "Hearing Aid");

$stmnt1 = "SELECT distinct indicatorID, nmi.namen, nmi.unit, hasSplitByTypes FROM `Consulting`.`DC_exportIDTable` xid
			JOIN `Consulting`.`DC_namesIndicators` nmi ON (xid.indicatorID = nmi.id)
		  WHERE scenarioID = ".$scenID;				  
$res = mysql_query($stmnt1);
$indis = mysql_fetch_row($res);

$sqlMaker =  new Depot5_sqlFormation();
// -- BEGIN form indicator names array -- 
/*$query = $sqlMaker->formGetIndicatorNames();
$indiNames = mysql_fetch_row(mysql_query($query)); */
$indicatorName = ($indis[1]);
$indicatorUnit = ($indis[2]);
$indicatorHasSplit = ($indis[3]);
// -- END   form indicator names array -- 

// -- BEGIN form indicator names array -- 
// can i take params from exportDBTable?
$stmnt = "SELECT distinct countryID FROM `Consulting`.`DC_exportIDTable` WHERE scenarioID = ".$scenID;				  
$res = mysql_query($stmnt);
$cntryIDs=""; $k = 0; $isRegion=0;

while ($row = mysql_fetch_array($res, MYSQL_NUM)) {	 
	if ($k > 0) $cntryIDs = $cntryIDs.",";
	$k++;
	$cntryIDs = $cntryIDs.$row[0];  
	if ($row[0] > 100) $isRegion = 1;
	if ($row[0] > 999) $isRegion = 2;
};

if ($indis[0] < 300) {
	$query = $sqlMaker->formGetMacroCategory($cntryIDs, $indis[0], $scenID, 0, $pwrID, 1, true, $indicatorHasSplit);
} else {				
	$query = $sqlMaker->formGetDemandData($cntryIDs, $scenID, $batTypeID, $pwrID, $isRegion, $aggLevel, $showPerHH);
};
$select_result = mysql_query($query); 
// -- END   form indicator names array -- 

//$select_result  = false;
if ($select_result) {	
	$timeIDs[]     = ""; $timeNames[] = "";				
	$i = 0;	$n = 0;

	$phpExcel = new PHPExcel();
	$phpExcel->setActiveSheetIndex(0);
	$phpExcel->getActiveSheet()->setTitle("Demand_".$scenID);

	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 1, "scenarioID");
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(1, 1, (($isRegion > 0) ? "RegionName" : "CountryName") );	
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(2, 1, "indicator");	
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(3, 1, "unit");	
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(4, 1, "typeName");
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(5, 1, "device/category");
	
	for ($u = 0; $u < 16; $u++) {		
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(6 + $u, 1, (string)("Y".(string)(2006 + $u)) );	
	};
		
	
	$m = 0;	
	while ($row = mysql_fetch_array($select_result, MYSQL_ASSOC)) {
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0,  $m + 2, (($row["scenarioID"]==10001) ? "baseline" : "workingScenario")  );	
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(1,  $m + 2, $row["countryName"]);		
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(2,  $m + 2, $indicatorName);				
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(3,  $m + 2, (($showPerHH > 0) ? ($indicatorUnit.", per HH")       : $indicatorUnit));				
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(4,  $m + 2, (($batTypeID > 0) ? ($sizeNames[$row["batTypeID"]-1]) : "All types"   ));				
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(5,  $m + 2, (($aggLevel  > 0) ? ($row["deviceName"])              : "All devices" ));				
		
		for ($u = 0; $u < 16; $u++) {	
			$yr = (string)("Y".(string)(2006+$u));
			$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(6 + $u, $m + 2,  $row[$yr]);	
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
	//echo "cntry=".$cntryIDs.",scen=".$scenID.",batTypeID=".$batTypeID.",pwrID=".$pwrID.",isRegion=".$isRegion.",agg=".$aggLevel.",perHH=".$showPerHH;
	//echo ($isRegion);
	echo $query;
	/*echo "DB_Error";	
	exit;	*/
};

?>
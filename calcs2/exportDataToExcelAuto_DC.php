<?php

include 'Classes/PHPExcel/IOFactory.php';
include 'Depot5_sqlFormation.php';

$scenID    = $_GET['scenarioID']; $exportTypeID = $_GET['exportTypeID'];  $aggLevel  = $_GET['aggLevel']; 
$batTypeID = $_GET['batTypeID'];  $pwrID  = $_GET['pwrID'];   $showPerHH = $_GET['perHH']; $modeID = $_GET['modeID'];

$link = mysql_connect('192.168.44.200', 'cFullUserPW', 'c5ul1Use1QP');
mysql_select_db('Consulting');

//query the database for the scenario data ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$isSingleScenario = $modeID;

$namesPart = ""; $groupPart = "";  $a = ""; $fromTable="";
$indiCond = "";  $addTables  = ""; $indiJoin = "";
$typeNames = ""; $typeJoins = ""; $typeGroupBy = "";

$sizeNames = array("C", "D", "AAA", "9V", "AA", "Coin And Button", "Hearing Aid");
$chemNames = array("Alkaline Battery","Lithium Battery","RCR Major Cells","Zinc Battery");

$stmnt1 = "SELECT distinct indicatorID, nmi.namen, nmi.unit, hasSplitByTypes FROM `Consulting`.`DC_exportIDTable` xid
			JOIN `Consulting`.`DC_namesIndicators` nmi ON (xid.indicatorID = nmi.id)
		  WHERE scenarioID = ".$scenID." ORDER BY indicatorID asc";				  
$res = mysql_query($stmnt1);
$indis = mysql_fetch_row($res);

$sqlMaker =  new Depot5_sqlFormation();
// -- BEGIN form indicator names array -- 
$indicatorName = ($indis[1]);
$indicatorUnit = ($indis[2]);
$indicatorHasSplit = ($indis[3]);

if ($rw = mysql_fetch_row($res)) {
	$indicatorName2     = ($rw[1]);
	$indicatorUnit2     = ($rw[2]);
	$indicatorHasSplit2 = ($rw[3]);
}
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

// if ($indis[0] < 300) {		
$tabName = ""; $tabName2 = "";			
$tabName = "Input_Indicators";
$indiName = $indicatorName;

if (($exportTypeID == 0) and ($indis[0] < 401)) {
	$query = $sqlMaker->formGetMacroCategory($cntryIDs, $indis[0], $scenID, 0, max(0, $batTypeID, $pwrID), 1, $isSingleScenario, $indicatorHasSplit);
	$indicatorUnit2 = $indicatorUnit;
} else if ( ($exportTypeID == 0) and ($indis[0] == 401) ) { 
	$query = $sqlMaker->formGetDeviceBase($cntryIDs, $scenID, 0, $isRegion, $aggLevel, $showPerHH, $isSingleScenario);	
	$indicatorUnit2 = $indicatorUnit;
// -----------demand tab with some exogenous vars---------
} else if ($exportTypeID == 1) {				
	$tabName  = "Demand"; $tabName2  = "Input_Indicators";	
	$indiName = "Demand"; 
	$query      = $sqlMaker->formGetDemandData($cntryIDs, $scenID, $batTypeID, $pwrID, $isRegion, $aggLevel, $showPerHH, $isSingleScenario);
	
	if ($rw[0] == 401) {
		$queryMacro = $sqlMaker->formGetDeviceBase($cntryIDs, $scenID, 0, $isRegion, $aggLevel, $showPerHH, $isSingleScenario);	
		$indiName2 = "Device Base";
	} else {
		$queryMacro = $sqlMaker->formGetMacroCategory($cntryIDs, $indis[0], $scenID, 0, max(0, $batTypeID, $pwrID), 1, $isSingleScenario, $indicatorHasSplit);
		$indiName2 = $indicatorName;
	};		
// -----------demand by chemistry tab with some exogenous vars---------
} else if ($exportTypeID == 2) {				
	$tabName  = "Demand"; $tabName2  = "Input_Indicators";	
	$indiName = "Demand Split By Chemistry"; 
	$query      = $sqlMaker->formGetDemandByChemistry($cntryIDs, $scenID, $isRegion, $showPerHH, $isSingleScenario);
	
	if (($rw[0] == 401)||($indis[0] == 401))  {
		$queryMacro = $sqlMaker->formGetDeviceBase($cntryIDs, $scenID, 0, $isRegion, $aggLevel, $showPerHH, $isSingleScenario);	
		$indiName2 = "Device Base";
	} else {
		$queryMacro = $sqlMaker->formGetMacroCategory($cntryIDs, $indis[0], $scenID, 0, max(0, $batTypeID, $pwrID), 1, $isSingleScenario, $indicatorHasSplit);
		$indiName2 = $indicatorName;
	};		
};

$select_result = mysql_query($query); 
//$select_result  = false;
if ($select_result) {	
	$i = 0;	$n = 0;
	$phpExcel = new PHPExcel();
	// --------------formating for demand-------------
	$phpExcel->setActiveSheetIndex(0);
	$phpExcel->getActiveSheet()->setTitle($tabName."_".$scenID);
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 2, "Device And Battery Demand Landscape Tool (Data extraction)");
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 3, ("Indicator: ".$indiName) );	
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 4, "Date of extraction: ".date('jS \of F Y'));
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 5, "Data in this tool was researched, developed and modeled by Euromonitor International in 2013");
	$startLine = 7;
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $startLine, "scenarioID");
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $startLine, (($isRegion > 0) ? "RegionName" : "CountryName") );	
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(2, $startLine, "indicator");	
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(3, $startLine, "unit");	
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(4, $startLine, "typeName");
	$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(5, $startLine, "device/category");
	
	for ($u = 0; $u < 16; $u++) { $phpExcel->getActiveSheet()->setCellValueByColumnAndRow(6 + $u, $startLine, (string)("Y".(string)(2006 + $u)) );	};		
	
	$m = $startLine;	
	while ($row = mysql_fetch_array($select_result, MYSQL_ASSOC)) {
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0,  $m + 1, (($row["scenarioID"]==10001) ? "baseline" : "workingScenario")  );	
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(1,  $m + 1, $row["countryName"]);		
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(2,  $m + 1, $indiName);		
		
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(3,  $m + 1, (($showPerHH > 0) ? ($indicatorUnit2.", per HH")       : $indicatorUnit2));	
		
		if (($indis[0] == 204)||($indis[0] ==206))      { $rz = ($sizeNames[$row["typeID"]      - 1]); } 
		else if ($indis[0] == 205)              		{ $rz = ("Built-In RCR"); 	} 
		else if ($exportTypeID == 2) 					{ $rz = ($chemNames[$row["chemistryID"] - 201]); } 
		else if (max($batTypeID, $pwrID) > 0)			{ $rz = ($sizeNames[$row["batTypeID"]   - 1]); }
		else 											{ $rz = ("All types"); 	};
		
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(4,  $m + 1, $rz);				
		$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(5,  $m + 1, (($aggLevel  > 0) ? ($row["deviceName"]) : "All devices" ));		
		for ($u = 0; $u < 16; $u++) {	
			$yr = (string)("Y".(string)(2006+$u));
			$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(6 + $u, $m + 1,  $row[$yr]);	
		};		
		$m += 1;
	}//while row
		
// ---------------- data export for macro---------------------------
		if (($exportTypeID  > 0) && (!$isRegion)) {
			$select_resultMacro = mysql_query($queryMacro); 
			if ($select_resultMacro) {	
				$i = 0;	$n = 0;
				$phpExcel->createSheet();
				$phpExcel->setActiveSheetIndex(1);
				$phpExcel->getActiveSheet()->setTitle($tabName2."_".$scenID);
				$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 2, "Device And Battery Demand Landscape Tool (Data extraction)");
				$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 3, ("Indicator: ".$indiName2) );	
				$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 4, "Date of extraction: ".date('jS \of F Y'));
				$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0, 5, "Data in this tool was researched, developed and modeled by Euromonitor International in 2013");
				$startLine = 7;
				$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0, $startLine, "scenarioID");
				$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(1, $startLine, (($isRegion > 0) ? "RegionName" : "CountryName") );	
				$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(2, $startLine, "indicator");	
				$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(3, $startLine, "unit");	
				$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(4, $startLine, "typeName");
				$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(5, $startLine, "device/category");

				for ($u = 0; $u < 16; $u++) { $phpExcel->getActiveSheet()->setCellValueByColumnAndRow(6 + $u, $startLine, (string)("Y".(string)(2006 + $u)) );	};		

				$m = $startLine;	
				while ($row = mysql_fetch_array($select_resultMacro, MYSQL_ASSOC)) {
					$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(0,  $m + 1, (($row["scenarioID"]==10001) ? "baseline" : "workingScenario")  );	
					$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(1,  $m + 1, $row["countryName"]);		
					$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(2,  $m + 1, $indiName2);				
					$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(3,  $m + 1, (($showPerHH > 0) ? ($indicatorUnit.", per HH")       : $indicatorUnit));	
					if (($indis[0] == 204)||($indis[0] ==206))      { $rz = ($sizeNames[$row["typeID"]    - 1]); } 
					else if ($indis[0] == 205)              { $rz = ("Built-In RCR"); 	} 
					else if ($rw[0] == 401) 				{ $rz = "All types"; }					
					else if (max($batTypeID, $pwrID) > 0)	{ $rz = ($sizeNames[$row["batTypeID"] - 1]); };
					$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(4,  $m + 1, ((max($batTypeID, $pwrID) > 0) ? $rz : "All types"   ));				
					$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(5,  $m + 1, (($aggLevel  > 0) ? ($row["deviceName"]) : "All devices" ));		
					for ($u = 0; $u < 16; $u++) {	
						$yr = (string)("Y".(string)(2006+$u));
						$phpExcel->getActiveSheet()->setCellValueByColumnAndRow(6 + $u, $m + 1,  $row[$yr]);	
					};		
					$m += 1;
				}//while row
			}
		}
// ------------------- end of macro export -----------------	
	
	header("Content-Type: application/vnd.ms-excel");
	header("Content-Disposition: attachment; filename=\"DataOutput_".time().".xls\"");
	header("Cache-Control: max-age=0");
	$objWriter = PHPExcel_IOFactory::createWriter($phpExcel, "Excel5");
	$objWriter->save("php://output");
	// cannot save here data? 
	echo "data exported successfully";
	//echo $queryMacro;
}// if select result
else {	
	//echo "cntry=".$cntryIDs.",scen=".$scenID.",batTypeID=".$batTypeID.",pwrID=".$pwrID.",isRegion=".$isRegion.",agg=".$aggLevel.",perHH=".$showPerHH;
	//echo ($isRegion);
	echo $queryMacro;
	/*echo "DB_Error";	
	exit;	*/
};

?>
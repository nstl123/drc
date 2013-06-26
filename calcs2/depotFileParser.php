<?php
include 'Classes/PHPExcel/IOFactory.php';
include 'depotMySQLConnectionDataProvider.php';

/*
** function for parsing uploaded data files and uploading the data into the DB
*/

function parseDataFile($path, $type, $SessionID) { //type - historic=0, scenario=1; 
													//set $SessionID to any value for historic - doesn't matter
	$inputFileName = $path;	
	$sheetName="testData";	
	$credentials = new MySQLConnectionDataProvider();
	$link = mysql_connect($credentials->address, $credentials->usr, $credentials->pw);
	mysql_select_db($credentials->DB);

//get data for input verification from the DB ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	

	$objPHPExcel = PHPExcel_IOFactory::load($inputFileName);
	
//set the right sheet as active. Otherwise, echo an error message ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	$worksheets = $objPHPExcel->getSheetNames();
	$sheetExists = false;
	for ($i = 0; $i < count($worksheets); $i++) {
		if ($worksheets[$i] == $sheetName) {
			$sheetExists = true;
		}
	}

	$objWorksheet = null;
	if ($sheetExists) {
		$objWorksheet = $objPHPExcel->getSheetByName($sheetName);
	}
	else {
		return "ErrorSheet";
	}
	
//loop through file, try to parse it ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	$time_IDs[] = "";
	$indicator_IDS[] = "";
	$values[] = "";
	$periodTypes[] = "";
	$indicatorTypes[] = "";
	$first_row = true;
	$column_names[] = "";
	$column_count = 0;
	$periodInd = -1;
	$parsing_problem = false;
	$entries = 0;

	foreach ($objWorksheet->getRowIterator() as $row) {
		$cellIterator = $row->getCellIterator();
		$cellIterator->setIterateOnlyExistingCells(false);

		if ($first_row) {
			$i = 0;
			foreach ($cellIterator as $cell) {
				$a = $cell->getValue();
				$b = $cell->getCalculatedValue();
				if ($a <> "") {
					if(substr($a, 0, 1) == "=") {
						$column_names[$i]=$b;
					} else { 
						$column_names[$i]=$a; 
					};							
					if ($column_names[$i] == "Period"){$periodInd = $i;}
					$i += 1;
				}
			}// for each cell

			$column_count = $i;
			if ($column_count == 0 || $periodInd == -1) {$parsing_problem = true;}
				$first_row = false;
		} // if first row			
		else {
			if(!$parsing_problem) {
				$i = 0;
				$datavalues[] = "";
						
  				foreach ($cellIterator as $cell) {
					$a = $cell->getValue();
					if ($i <= $column_count) {
						if(substr($a, 0, 1) == "=") {
							$b = $cell->getCalculatedValue();
							$datavalues[$i]=$b;
						}
						else {$datavalues[$i] = $a;}
						$i += 1;
					}
  				}//for each cell

				$pKey = array_keys($tNames, $datavalues[$periodInd]);
				
				for($j = 0; $j < $column_count; $j++) {
				//check if the indicators and periods in the file correspond to the ones in the database
					if ($j <> $periodInd) {
						if($pKey) {
							$iKey = array_keys($iNames, $column_names[$j]);
							
							if($iKey) {
								$timeIDs[$entries] = $tIDs[$pKey[count($pKey)-1]];
								$indicatorIDs[$entries] = $iIDs[$iKey[0]];
								$values[$entries] = $datavalues[$j];
								$periodTypes[$entries] = $pTypes[count($pKey)-1];
								$indicatorTypes[$entries] = $iTypes[$iKey[0]];
									
								$entries += 1;
							}
							else {return "ErrorDB3";}
						}
						else {return "ErrorDB4";}
						
					} //if j <> periodInd
				}//for j
			} // if not parsing problem
		}//else
	} // for each row

// if there was a problem with parsing the file, quit; otherwise attempt to upload the data to DB ~
	if ($parsing_problem) {return "ErrorParsing";}
	
	else if ($type == 0) {
		for($k = 0; $k < $entries; $k++) {
			//only upload data for monthly periods, unless it's an annual indicator
			if ($periodTypes[$k] == 1 || ($periodTypes[$k] == 3 && $indicatorTypes[$k] == 3) ){
				$val = "";
				if ($values[$k] == "" || $values[$k] == "NA") {	$val="NULL";}
				else {$val = $values[$k];}

				$clean_query= "DELETE FROM ConsultingMQ.hr_historic_test2 WHERE "
							." TimeID=".$timeIDs[$k]
							." AND IndicatorID=".$indicatorIDs[$k];
							
				$insert_query	= "INSERT INTO ConsultingMQ.hr_historic_test2"
								."(TimeID, IndicatorID, DataValue) "
								."VALUES (".$timeIDs[$k].", ".$indicatorIDs[$k].", ".$val.")";
								
				$check = mysql_query($clean_query);
				
				if($check) {
					$insert = mysql_query($insert_query);
					if(!$insert) {return "ErrorDB5";}
				}
				else { return "ErrorDB6";}
					
			} // if periodType==1 or periodType==indicatorType==3
		}//for k < entries
	} //if type == 0 (historic file)
	
	//if all went well...
	return "Success";
	
}//function
?>
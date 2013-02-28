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
	
	$stmnt_begin = "SELECT scenarioID, sessionID, cntry.namen as cntryName, countryID, deviceID,  batTypeID, pwrTypeID,
						indis.namen as indiName, indicatorID, Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2011, Y2012, Y2013, Y2014, Y2015 ";
	
		if ($aggLevel == 0) { // aggergation on country level
			$stmnt = "				
				FROM (
					SELECT sdm.scenarioID, sdm.sessionID, sdm.countryID, sdm.indicatorID, 0 as deviceID, 0 as batTypeID, 0 as pwrTypeID,
						Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2011, Y2012, Y2013, Y2014, Y2015
						FROM `Consulting`.`DC_scenarioDataMacro` as sdm
						WHERE sdm.scenarioID IN (".$scenarioID.", 10001) 
							AND indicatorID = 1001 \n";
			if ($useUnion)	$stmnt = $stmnt."
					UNION
					SELECT dma.scenarioID, dma.sessionID, dma.countryID, 2080 as indicatorID, 0 as deviceID, 0 as batTypeID, 0 as pwrTypeID,
						Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2011,  Y2012, Y2013, Y2014, Y2015
						FROM `Consulting`.`DC_demandAggregated` as dma
							WHERE dma.scenarioID IN (".$scenarioID.", 10001) ";				
				// ") as base ";			
		} else if ($aggLevel == 1) { // aggregation on device level		
			$stmnt = " 
				FROM (
					SELECT sessionID, scenarioID, countryID, deviceID as deviceID, indicatorID,
							0 as batTypeID, 0 as pwrTypeID,	Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2011, Y2012, Y2013, Y2014, Y2015
						FROM Consulting.DC_scenarioDataSplit sdp
							WHERE countryID = ".$countryID." and indicatorID = ".$indicatorID." 
							AND scenarioID IN (".$scenarioID.", 10001) ";
			if ($useUnion)	$stmnt = $stmnt."
					UNION 
					SELECT sessionID, scenarioID, countryID, deviceID as deviceID, indicatorID,
							0 as batTypeID, 0 as pwrTypeID, Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2011, Y2012, Y2013, Y2014, Y2015
						FROM Consulting.DC_deviceBase as dvb
							WHERE countryID = ".$countryID." 
							AND scenarioID IN (".$scenarioID." , 10001) ";
				//) as base ";				
		} else if ($aggLevel > 1) { // aggregation on batery types level
			$stmnt = "
			FROM (
				SELECT sessionID, scenarioID, nc.id as countryID, indicatorID, deviceID, typeID as batTypeID, 0 as pwrTypeID, 
					Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2011, Y2012, Y2013, Y2014, Y2015
					FROM `Consulting`.`DC_scenarioDataSplit` sdp
						JOIN Consulting.DC_namesCountries nc ON (nc.battery_size = sdp.countryID)
						WHERE indicatorID = 204 AND  typeID = ".$batTypeID." 
							AND scenarioID IN(".$scenarioID.", 10001) 
							AND nc.id = ".$countryID;
			if ($useUnion)	$stmnt = $stmnt."
				UNION 
				SELECT sessionID, scenarioID, countryID, 208 as indicatorID, deviceID, batTypeID, pwrTypeID, 
					Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2011, Y2012, Y2013, Y2014, Y2015
					FROM `Consulting`.`DC_demand` dmd
						JOIN Consulting.DC_namesCountries nc ON (nc.id = dmd.countryID)
						WHERE	batTypeID = ".$batTypeID." AND pwrTypeID = ".$pwrTypeID." 
							AND scenarioID IN(".$scenarioID.", 10001)
							AND nc.id = ".$countryID;
			//) as base ";				
		};
		
		$stmnt_end = 
				") as base 	\n		
				  JOIN `Consulting`.`DC_namesCountries`  as cntry ON cntry.id = base.countryID
				  JOIN `Consulting`.`DC_namesIndicators` as indis ON indis.id = base.indicatorID;";
	
		$stmnt_f = $stmnt_begin.$stmnt.$stmnt_end;
	
	// $result = $this->connection->fetchAll($stmnt_f);		
	// array_push($a, $result);				
	
	
	echo $stmnt_f;
	// insert new values from all the tables, that were updated by user input				

?>
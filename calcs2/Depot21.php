<?php

require_once 'Zend/Db/Adapter/Mysqli.php';

class Depot21 {

	public function __construct() {
		$this->connection = new Zend_Db_Adapter_Mysqli(array(
			'host'     => '192.168.44.200',
			'username' => 'cFullUserPW', // full user. a bit risky.
			'password' => 'c5ul1Use1QP',
			'dbname'   => 'Consulting'
		));
	}	
	
	public function getMacroDataFormat($n) {
		$a = array();
		for ($i = 0; $i < $n; $i++) {
			$z = array('id'=>$i, 'namen'=>'na');
			array_push($a, $z);
		};
		return $a;
	}
	
	// scenarioProxy data is distinct in that it uses proxy countries
	public function getMacroData($countryIDs, $indicatorID, $scenarioID, $hasSplit, $typeID, $wNames) {
		$a = array('a'=>"");		
		$countryArray = (array)($countryIDs);		
		$countryList = " (";
		for ($i = 0; $i < count($countryArray); $i++) {
			if ($i > 0) { $countryList = $countryList.", ".$countryArray[$i]; }			
			else $countryList = $countryList.$countryArray[$i];
		}
		$countryList = $countryList." )";
		
		$stmnt = "";
		$selfields = "";		

		$selFields = "SELECT sd.scenarioID, sd.indicatorID, sd.deviceID, sd.typeID, sd.unitID, 0 AS categoryID,
						sd.Y2004, sd.Y2005, sd.Y2006, sd.Y2007, sd.Y2008, sd.Y2009, sd.Y2010, sd.Y2011, 
						sd.Y2012, sd.Y2013, sd.Y2014, sd.Y2015, sd.Y2016, sd.Y2017, sd.Y2018, sd.Y2019, 
						sd.Y2020, sd.Y2021";	
		
		if ($hasSplit == 0) { // hasSplitByTypes		
			$stmnt = $selFields.", countryID". 
				($wNames > 0 ? ", nc.namen" : ", 'NA'")." AS namen				
			    FROM Consulting.DC_scenarioData sd ".
				($wNames > 0 ? " 
					JOIN Consulting.DC_namesCountries nc 
					ON sd.countryID = nc.id " : "").
			   "WHERE scenarioID IN (".$scenarioID.", 10001) 				
					AND nc.id IN ".$countryList."
					AND indicatorID = ".$indicatorID;				
			if ($indicatorID == 207) {
				$stmnt = $stmnt." AND typeID = ".$typeID;
			};						
		} else { 					
			$joinOn = "";
			switch($indicatorID) {
				case '204': 
					$joinOn = 'battery_size'; break;
				case '205': 
					$joinOn = 'pwr_DPP'; break;
				case '206': 
					$joinOn = 'avg_number'; break;
			};
			
			$stmnt = $selFields.", nc.namen, nc.id as countryID				
				FROM `Consulting`.`DC_scenarioDataProxy` sd
					JOIN `Consulting`.`DC_namesCountries` nc
				ON sd.countryID = nc.".$joinOn."
				WHERE 
					scenarioID IN (".$scenarioID.", 10001)
					AND nc.id IN ".$countryList." 
					AND sd.indicatorID = ".$indicatorID."
					AND typeID = ".$typeID;					
		}		
		
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return ($stmnt);
	}
	
	// scenarioProxy data is distinct that uses proxy countries
	public function getMacroDataCategory($countryIDs, $indicatorID, $scenarioID, $hasSplit, $typeID, $wNames) {
		$a = array('a'=>"");		
		$countryArray = (array)($countryIDs);		
		$countryList = " (";
		for ($i = 0; $i < count($countryArray); $i++) {
			if ($i > 0) { $countryList = $countryList.", ".$countryArray[$i]; }			
			else $countryList = $countryList.$countryArray[$i];
		}
		$countryList = $countryList." )";
		
		$stmnt = "";
		$selfields = "";				
		
		$selFields = "
			SELECT sdt.scenarioID, sdt.countryID, sdt.indicatorID,  nmd.categoryID AS deviceID, sdt.typeID,
				1000*sum(sdt.Y2004*wdb.Y2004) as Y2004, 1000*sum(sdt.Y2005*wdb.Y2005) as Y2005, 1000*sum(sdt.Y2006*wdb.Y2006) as Y2006,
				1000*sum(sdt.Y2007*wdb.Y2007) as Y2007, 1000*sum(sdt.Y2008*wdb.Y2008) as Y2008, 1000*sum(sdt.Y2009*wdb.Y2009) as Y2009,			
				1000*sum(sdt.Y2010*wdb.Y2010) as Y2010, 1000*sum(sdt.Y2011*wdb.Y2011) as Y2011, 1000*sum(sdt.Y2012*wdb.Y2012) as Y2012,
				1000*sum(sdt.Y2013*wdb.Y2013) as Y2013, 1000*sum(sdt.Y2014*wdb.Y2014) as Y2014, 1000*sum(sdt.Y2015*wdb.Y2015) as Y2015,
				1000*sum(sdt.Y2016*wdb.Y2016) as Y2016, 1000*sum(sdt.Y2017*wdb.Y2017) as Y2017, 1000*sum(sdt.Y2018*wdb.Y2018) as Y2018,
				1000*sum(sdt.Y2019*wdb.Y2019) as Y2019, 1000*sum(sdt.Y2020*wdb.Y2020) as Y2020, 1000*sum(sdt.Y2021*wdb.Y2021) as Y2021
		";
		
		if ($hasSplit == 0) { // hasSplitByTypes		
			$stmnt = $selFields.", sdt.countryID". 
				($wNames > 0 ? ", nc.namen" : ", 'NA'")." AS namen							    
				FROM Consulting.DC_scenarioData sdt
				JOIN Consulting.DC_weigthsFromDeviceBase wdb
					ON (wdb.countryID = sdt.countryID AND wdb.deviceID = sdt.deviceID)".
				($wNames > 0 ? " 
					JOIN Consulting.DC_namesCountries nc 
						ON sdt.countryID = nc.id " : "")."
					JOIN Consulting.DC_namesDevices nmd
						ON (nmd.id = sdt.deviceID)					   
				   WHERE sdt.scenarioID IN (".$scenarioID.", 10001) 				
						AND nc.id IN ".$countryList."
						AND sdt.indicatorID = ".$indicatorID;				
			if ($indicatorID == 207) {
				$stmnt = $stmnt." AND sdt.typeID = ".$typeID;
			};								
		} else { 					
			$joinOn = "";
			switch($indicatorID) {
				case '204': 
					$joinOn = 'battery_size'; break;
				case '205': 
					$joinOn = 'pwr_DPP'; break;
				case '206': 
					$joinOn = 'avg_number'; break;
			};
			
			$stmnt = $selFields.", nc.namen, nc.id as countryID				
				FROM `Consulting`.`DC_scenarioDataProxy` sdt				
					JOIN `Consulting`.`DC_namesCountries` nc
						ON sdt.countryID = nc.".$joinOn."
					JOIN Consulting.DC_weigthsFromDeviceBase wdb
						ON (wdb.countryID = nc.id AND wdb.deviceID = sdt.deviceID)
					JOIN Consulting.DC_namesDevices nmd
						ON (nmd.id = sdt.deviceID)			
				WHERE 
					sdt.scenarioID IN (".$scenarioID.", 10001)
					AND nc.id IN ".$countryList." 
					AND sdt.indicatorID = ".$indicatorID."
					AND sdt.typeID = ".$typeID;					
		};
		$stmnt = $stmnt."
				GROUP BY sdt.scenarioID, sdt.countryID, sdt.indicatorID, nmd.categoryID, typeID";				
		
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return ($stmnt);
	}
	
	public function getDemandData($countryIDs, $scenarioID, $typeID, $pwrID, $isRegion, $showAtDeviceLevel, $perHH) { 				
		$getWorldData = "";
		$hasOtherCountries = 0;
		
		$countryArray = (array)($countryIDs);	
		//$countryArray = explode(",",$countryIDs);
		$useCluster = 0;
		($isRegion > 1) ? $useCluster = "cluster" : $useCluster = "region";
	// aggType = 0 for device level, 1 - for country level
		$a = array('a'=>"");							
		$countryList = " (";				
		
		for ($i = 0; $i < count($countryArray); $i++) {		
			if ($countryArray[$i] < 3000) {
				$hasOtherCountries = 1;
				if ($i > 0)  $countryList = $countryList.", ".$countryArray[$i]; 
				else 		 $countryList = $countryList.$countryArray[$i]; 
			} else {
				$getWorldData = 1;
			}			
		};	
		
		$countryList = $countryList." )";		
		$stmnt = "";
			
		if ($perHH > 0) {
			$sumStmnt = "
				    sum(dm.Y2004)/sum(sdt.Y2004) AS Y2004, sum(dm.Y2005)/sum(sdt.Y2005) AS Y2005, sum(dm.Y2006)/sum(sdt.Y2006) AS Y2006, 
					sum(dm.Y2007)/sum(sdt.Y2007) AS Y2007, sum(dm.Y2008)/sum(sdt.Y2008) AS Y2008, sum(dm.Y2009)/sum(sdt.Y2009) AS Y2009, 
					sum(dm.Y2010)/sum(sdt.Y2010) AS Y2010, sum(dm.Y2011)/sum(sdt.Y2011) AS Y2011, sum(dm.Y2012)/sum(sdt.Y2012) AS Y2012, 
					sum(dm.Y2013)/sum(sdt.Y2013) AS Y2013, sum(dm.Y2014)/sum(sdt.Y2014) AS Y2014, sum(dm.Y2015)/sum(sdt.Y2015) AS Y2015,
					sum(dm.Y2016)/sum(sdt.Y2016) AS Y2016, sum(dm.Y2017)/sum(sdt.Y2017) AS Y2017, sum(dm.Y2018)/sum(sdt.Y2018) AS Y2018,
					sum(dm.Y2019)/sum(sdt.Y2019) AS Y2019, sum(dm.Y2020)/sum(sdt.Y2020) AS Y2020, sum(dm.Y2021)/sum(sdt.Y2021) AS Y2021
					";		
		} else {
			$sumStmnt = "
				    sum(dm.Y2004) AS Y2004, sum(dm.Y2005) AS Y2005, sum(dm.Y2006) AS Y2006, sum(dm.Y2007) AS Y2007, 
					sum(dm.Y2008) AS Y2008, sum(dm.Y2009) AS Y2009, sum(dm.Y2010) AS Y2010, sum(dm.Y2011) AS Y2011, 
					sum(dm.Y2012) AS Y2012, sum(dm.Y2013) AS Y2013, sum(dm.Y2014) AS Y2014, sum(dm.Y2015) AS Y2015,
					sum(dm.Y2016) AS Y2016, sum(dm.Y2017) AS Y2017, sum(dm.Y2018) AS Y2018, sum(dm.Y2019) AS Y2019,
					sum(dm.Y2020) AS Y2020, sum(dm.Y2021) AS Y2021
					";
		};

		
		if ($hasOtherCountries > 0 ) {	// flag showing there are countries besides World aggregate			
			$stmnt = $stmnt."
				SELECT dm.scenarioID, 301 AS indicatorID, dm.deviceID 				
				".($showAtDeviceLevel == 0 ? ", 0 as categoryID" : ", devNam.categoryID AS categoryID").
				", batTypeID, pwrTypeID".				
				($isRegion > 0 ? ", rg.namen as namen, rg.id AS countryID, " : ", nc.namen AS namen, dm.countryID, ").	
					$sumStmnt.
				"FROM Consulting.DC_demand AS dm
				JOIN Consulting.DC_namesCountries AS nc ON (dm.countryID = nc.id) ".                    
					($isRegion > 0 ? " JOIN Consulting.DC_namesCountries AS rg ON (nc.".$useCluster." = rg.id)" : "")."				
				JOIN Consulting.DC_namesDevices devNam ON devNam.id = deviceID
				JOIN Consulting.DC_namesDeviceCategories devCat ON devCat.id = devNam.categoryID					
				".($perHH > 0 ? "
					JOIN Consulting.DC_scenarioData sdt 
					ON ((sdt.countryID = dm.countryID) AND (sdt.scenarioID = dm.scenarioID))" : "")."
				WHERE dm.scenarioID IN (".$scenarioID.", 10001)".				
					($typeID   > 0 ? " AND batTypeID = ".$typeID  : "").
					($pwrID    > 0 ? " AND pwrTypeID = ".$pwrID   : "").
					($isRegion > 0 ? " AND nc.".$useCluster." " : " AND dm.countryID ")." IN ".$countryList.
					($perHH    > 0 ? " AND sdt.indicatorID = 101" : "")."
				GROUP BY scenarioID ".
					($isRegion > 0 ? ", nc.".$useCluster : ", countryID").				
					($typeID   > 0 ? ", batTypeID": "").
					($pwrID    > 0 ? ", pwrTypeID": "");
			if ($showAtDeviceLevel == 1)  $stmnt = $stmnt.", deviceID";
			if ($showAtDeviceLevel == 2)  $stmnt = $stmnt.", categoryID";										
		};
		if ($getWorldData > 0) {		
				$stmnt = $stmnt.($hasOtherCountries > 0 ? " UNION " : " ")."				
					SELECT dm.scenarioID, 301 AS indicatorID, dm.deviceID 
					".($showAtDeviceLevel == 0 ? ", 0 as categoryID" : ", devNam.categoryID AS categoryID").
					", batTypeID, pwrTypeID, 'World' as namen, 1111 AS countryID, 
					".$sumStmnt."
					FROM Consulting.DC_demand AS dm
					JOIN Consulting.DC_namesCountries AS nc ON (dm.countryID = nc.id) 
					JOIN Consulting.DC_namesDevices devNam ON devNam.id = deviceID
					JOIN Consulting.DC_namesDeviceCategories devCat ON devCat.id = devNam.categoryID
					".($perHH > 0 ? "
						JOIN Consulting.DC_scenarioData sdt 
						ON ((sdt.countryID = dm.countryID) AND (sdt.scenarioID = dm.scenarioID))" : "")."
					WHERE dm.scenarioID IN (".$scenarioID.", 10001)".				
						($typeID   > 0 ? " AND batTypeID = ".$typeID  : "").
						($pwrID    > 0 ? " AND pwrTypeID = ".$pwrID   : "").
						($perHH    > 0 ? " AND sdt.indicatorID = 101" : "")."						
				    GROUP BY scenarioID ".						
						($typeID   > 0 ? ", batTypeID": "").
						($pwrID    > 0 ? ", pwrTypeID": "");
				if ($showAtDeviceLevel == 1) $stmnt = $stmnt.", deviceID;";
				if ($showAtDeviceLevel == 2) $stmnt = $stmnt.", categoryID;";								
		};
		
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;		
		//return  $stmnt;		
	}
	
	public function getDeviceBase($countryIDs, $scenarioID, $pwrType, $showAtDeviceLevel, $perHH) {
		$a = array('a'=>"");		
		$countryArray = (array)($countryIDs);		
		$countryList = " (";
		for ($i = 0; $i < count($countryArray); $i++) {
			if ($i > 0) { $countryList = $countryList.", ".$countryArray[$i]; }			
			else $countryList = $countryList.$countryArray[$i];
		}
		$countryList = $countryList." )";
		
		if ($perHH > 0) {
			$sumStmnt = "
				   ,sum(dbt.Y2004*sdp.Y2004/sdt.Y2004) as Y2004, sum(dbt.Y2005*sdp.Y2005/sdt.Y2005) as Y2005, sum(dbt.Y2006*sdp.Y2006/sdt.Y2006) as Y2006,
					sum(dbt.Y2007*sdp.Y2007/sdt.Y2007) as Y2007, sum(dbt.Y2008*sdp.Y2008/sdt.Y2008) as Y2008, sum(dbt.Y2009*sdp.Y2009/sdt.Y2009) as Y2009,
					sum(dbt.Y2010*sdp.Y2010/sdt.Y2010) as Y2010, sum(dbt.Y2011*sdp.Y2011/sdt.Y2011) as Y2011, sum(dbt.Y2012*sdp.Y2012/sdt.Y2012) as Y2012,
					sum(dbt.Y2013*sdp.Y2013/sdt.Y2013) as Y2013, sum(dbt.Y2014*sdp.Y2014/sdt.Y2014) as Y2014, sum(dbt.Y2015*sdp.Y2015/sdt.Y2015) as Y2015,    
					sum(dbt.Y2016*sdp.Y2016/sdt.Y2016) as Y2016, sum(dbt.Y2017*sdp.Y2017/sdt.Y2017) as Y2017, sum(dbt.Y2018*sdp.Y2018/sdt.Y2018) as Y2018,    
					sum(dbt.Y2019*sdp.Y2019/sdt.Y2019) as Y2019, sum(dbt.Y2020*sdp.Y2020/sdt.Y2020) as Y2020, sum(dbt.Y2021*sdp.Y2021/sdt.Y2021) as Y2021
					";		
		} else {
			$sumStmnt = "
				   ,sum(dbt.Y2004*sdp.Y2004) as Y2004, sum(dbt.Y2005*sdp.Y2005) as Y2005, sum(dbt.Y2006*sdp.Y2006) as Y2006,
					sum(dbt.Y2007*sdp.Y2007) as Y2007, sum(dbt.Y2008*sdp.Y2008) as Y2008, sum(dbt.Y2009*sdp.Y2009) as Y2009,
					sum(dbt.Y2010*sdp.Y2010) as Y2010, sum(dbt.Y2011*sdp.Y2011) as Y2011, sum(dbt.Y2012*sdp.Y2012) as Y2012,
					sum(dbt.Y2013*sdp.Y2013) as Y2013, sum(dbt.Y2014*sdp.Y2014) as Y2014, sum(dbt.Y2015*sdp.Y2015) as Y2015,    
					sum(dbt.Y2016*sdp.Y2016) as Y2016, sum(dbt.Y2017*sdp.Y2017) as Y2017, sum(dbt.Y2018*sdp.Y2018) as Y2018,    
					sum(dbt.Y2019*sdp.Y2019) as Y2019, sum(dbt.Y2020*sdp.Y2020) as Y2020, sum(dbt.Y2021*sdp.Y2021) as Y2021
					";
		};
		
		$stmnt = "
			SELECT dbt.scenarioID, dbt.countryID, dbt.indicatorID, sdp.indicatorID, 
				   nc.namen, sdp.typeID, ";
				if ($showAtDeviceLevel == 0) $stmnt = $stmnt."0 as deviceID";
				if ($showAtDeviceLevel == 1) $stmnt = $stmnt."sdp.deviceID as deviceID";
				if ($showAtDeviceLevel == 2) $stmnt = $stmnt."devNam.categoryID AS deviceID";
		$stmnt= $stmnt.$sumStmnt."		
			FROM Consulting.DC_deviceBaseTable dbt
			JOIN Consulting.DC_namesCountries nc ON dbt.countryID = nc.id    
			
			JOIN Consulting.DC_namesDevices devNam ON devNam.id = dbt.deviceID
			JOIN Consulting.DC_namesDeviceCategories devCat ON devCat.id = devNam.categoryID	
			".($perHH > 0 ? "
				JOIN Consulting.DC_scenarioData sdt 
				ON ((sdt.countryID = dbt.countryID) AND (sdt.scenarioID = dbt.scenarioID))" : "")."
			JOIN Consulting.DC_scenarioDataProxy sdp	
				ON  (sdp.countryID = nc.pwr_DPP) 
				AND (sdp.deviceID  = dbt.deviceID)
				AND (sdp.scenarioID = dbt.scenarioID)    

			WHERE dbt.scenarioID IN (".$scenarioID.", 10001) 				
				AND nc.id IN ".$countryList."
				AND sdp.indicatorID = 205".
				($pwrType > 0 ? " AND sdp.typeID = ".$pwrType : "").
				($perHH   > 0 ? " AND sdt.indicatorID = 101" : "")."		
			GROUP BY 
				dbt.scenarioID, dbt.countryID".
				($pwrType > 0 ? ", typeID" : "");
				if ($showAtDeviceLevel == 1)  $stmnt = $stmnt.", dbt.deviceID;";
				if ($showAtDeviceLevel == 2)  $stmnt = $stmnt.", categoryID;";		
			
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return $stmnt;
	}
	
	public function getDemandByChemistry($countryIDs, $scenarioID, $isRegion, $perHH) {
		$useCluster = 0;
		($isRegion > 1) ? $useCluster = "cluster" : $useCluster = "region";
	
		$a = array('a'=>"");				
		$countryArray = (array)($countryIDs);		
		$countryList = " (";		
		
		for ($i = 0; $i < count($countryArray); $i++) {
			if ($i > 0) $countryList = $countryList.", ".$countryArray[$i]; 
			else 		$countryList = $countryList.$countryArray[$i];
		}
		$countryList = $countryList." )";	
		
		$sumStmnt = "";
		if ($perHH > 0) {
			$sumStmnt = "
				sum(dma.Y2004 * chm.shr)/sum(sdt.Y2004) as Y2004, sum(dma.Y2005 * chm.shr)/sum(sdt.Y2005) as Y2005, 
				sum(dma.Y2006 * chm.shr)/sum(sdt.Y2006) as Y2006, sum(dma.Y2007 * chm.shr)/sum(sdt.Y2007) as Y2007,  
				sum(dma.Y2008 * chm.shr)/sum(sdt.Y2008) as Y2008, sum(dma.Y2009 * chm.shr)/sum(sdt.Y2009) as Y2009, 
				sum(dma.Y2010 * chm.shr)/sum(sdt.Y2010) as Y2010, sum(dma.Y2011 * chm.shr)/sum(sdt.Y2011) as Y2011,  
				sum(dma.Y2012 * chm.shr)/sum(sdt.Y2012) as Y2012, sum(dma.Y2013 * chm.shr)/sum(sdt.Y2013) as Y2013, 
				sum(dma.Y2014 * chm.shr)/sum(sdt.Y2014) as Y2014, sum(dma.Y2015 * chm.shr)/sum(sdt.Y2015) as Y2015,  
				sum(dma.Y2016 * chm.shr)/sum(sdt.Y2016) as Y2016, sum(dma.Y2017 * chm.shr)/sum(sdt.Y2017) as Y2017, 
				sum(dma.Y2018 * chm.shr)/sum(sdt.Y2018) as Y2018, sum(dma.Y2019 * chm.shr)/sum(sdt.Y2019) as Y2019,  
				sum(dma.Y2020 * chm.shr)/sum(sdt.Y2020) as Y2020, sum(dma.Y2021 * chm.shr)/sum(sdt.Y2021) as Y2021
				";
		} else {
			$sumStmnt = "
				sum(dma.Y2004 * chm.shr) as Y2004, sum(dma.Y2005 * chm.shr) as Y2005, 
				sum(dma.Y2006 * chm.shr) as Y2006, sum(dma.Y2007 * chm.shr) as Y2007,  
				sum(dma.Y2008 * chm.shr) as Y2008, sum(dma.Y2009 * chm.shr) as Y2009, 
				sum(dma.Y2010 * chm.shr) as Y2010, sum(dma.Y2011 * chm.shr) as Y2011,  
				sum(dma.Y2012 * chm.shr) as Y2012, sum(dma.Y2013 * chm.shr) as Y2013, 
				sum(dma.Y2014 * chm.shr) as Y2014, sum(dma.Y2015 * chm.shr) as Y2015,  
				sum(dma.Y2016 * chm.shr) as Y2016, sum(dma.Y2017 * chm.shr) as Y2017, 
				sum(dma.Y2018 * chm.shr) as Y2018, sum(dma.Y2019 * chm.shr) as Y2019,  
				sum(dma.Y2020 * chm.shr) as Y2020, sum(dma.Y2021 * chm.shr) as Y2021
				";	
		};		
		
		$stmnt = "
			SELECT dma.scenarioID, 301 AS indicatorID, chm.id as chemistryID, 0 AS deviceID, 0 as categoryID, ". 
				($isRegion > 0 ? " rg.namen as namen, rg.id AS countryID, " : "nc.namen AS namen, dma.countryID, ").
				 $sumStmnt."
			FROM `Consulting`.`DC_demandAggregated` dma
				JOIN Consulting.DC_chemistry chm ON  chm.countryID = dma.countryID
			JOIN Consulting.DC_namesCountries AS nc ON (dma.countryID = nc.id) ".                    
				($isRegion > 0 ? " JOIN Consulting.DC_namesCountries AS rg ON (nc.".$useCluster." = rg.id)" : "").
			    ($perHH    > 0 ? "
					JOIN Consulting.DC_scenarioData sdt 
					ON ((sdt.countryID = dma.countryID) AND (sdt.scenarioID = dma.scenarioID))" : "")."					
			WHERE dma.scenarioID IN (".$scenarioID.", 10001)".				
				($isRegion > 0 ? " AND nc.".$useCluster : " AND dma.countryID ")." IN ".$countryList.
				($perHH    > 0 ? " AND sdt.indicatorID = 101" : "")."				
			GROUP BY dma.scenarioID, chemistryID ".
				($isRegion > 0 ? ", nc.".$useCluster : ", dma.countryID");
			
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return $stmnt;
	}
	
	
}		
?>

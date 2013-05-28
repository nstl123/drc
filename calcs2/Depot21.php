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
	
	// scenarioProxy data is distinct that uses proxy countries
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
		
		if ($hasSplit == 0) { // hasSplitByTypes		
			$stmnt = "SELECT scenarioID, countryID, indicatorID, deviceID, typeID, unitID, 0 AS categoryID,
				Y2004, Y2005, Y2006, Y2007, Y2008, Y2009, Y2010, Y2011, Y2012, Y2013, Y2014, Y2015,
				Y2016, Y2017, Y2018, Y2019, Y2020, Y2021 ". 
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
			
			$stmnt = "SELECT sd.scenarioID, nc.id as countryID, sd.indicatorID, sd.deviceID, typeID, unitID, 0 AS categoryID,
				sd.Y2004, sd.Y2005, sd.Y2006, sd.Y2007, sd.Y2008, sd.Y2009, sd.Y2010, sd.Y2011, sd.Y2012, 
				sd.Y2013, sd.Y2014, sd.Y2015, sd.Y2016, sd.Y2017, sd.Y2018, sd.Y2019, sd.Y2020, sd.Y2021,
				nc.namen				
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
	
	public function getDemandData($countryIDs, $scenarioID, $deviceID, $typeID, $pwrID, $isRegion, $showAtDeviceLevel, $perHH) { 				
		$getWorldData = 0;
		$hasOtherCountries = 0;
		
		$countryArray = (array)($countryIDs);	
		$useCluster = 0;
		($isRegion > 1) ? $useCluster = "cluster" : $useCluster = "region";
	// aggType = 0 for device level, 1 - for country level
		$a = array('a'=>"");							
		$countryList = " (";				
		
		for ($i = 0; $i < count($countryArray); $i++) {		
			if ($countryArray[$i] > 3000) {
				$getWorldData = 1; 
			} else {
				$hasOtherCountries = 1;
				if ($i > 0) $countryList = $countryList.", ".$countryArray[$i]; 
				else 		$countryList = $countryList.$countryArray[$i];
			};
		}
		$countryList = $countryList." )";		
		$stmnt = "";
			
		if ($perHH) {
			$sumStmnt = "
				    sum(dm.Y2004/sdt.Y2004) AS Y2004, sum(dm.Y2005/sdt.Y2005) AS Y2005, sum(dm.Y2006/sdt.Y2006) AS Y2006, 
					sum(dm.Y2007/sdt.Y2007) AS Y2007, sum(dm.Y2008/sdt.Y2008) AS Y2008, sum(dm.Y2009/sdt.Y2009) AS Y2009, 
					sum(dm.Y2010/sdt.Y2010) AS Y2010, sum(dm.Y2011/sdt.Y2011) AS Y2011, sum(dm.Y2012/sdt.Y2012) AS Y2012, 
					sum(dm.Y2013/sdt.Y2013) AS Y2013, sum(dm.Y2014/sdt.Y2014) AS Y2014, sum(dm.Y2015/sdt.Y2015) AS Y2015,
					sum(dm.Y2016/sdt.Y2016) AS Y2016, sum(dm.Y2017/sdt.Y2017) AS Y2017, sum(dm.Y2018/sdt.Y2018) AS Y2018,
					sum(dm.Y2019/sdt.Y2019) AS Y2019, sum(dm.Y2020/sdt.Y2020) AS Y2020, sum(dm.Y2021/sdt.Y2021) AS Y2021
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
				SELECT dm.scenarioID, 301 AS indicatorID, dm.deviceID, devNam.categoryID AS categoryID, batTypeID, pwrTypeID, ".
					($isRegion > 0 ? " rg.namen as namen, rg.id AS countryID, " : "nc.namen AS namen, dm.countryID, ").	
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
					if ( ($showAtDeviceLevel  > 0) and ($deviceID > 0)) $stmnt = $stmnt.", deviceID;";
					if ( ($showAtDeviceLevel == 0) and ($deviceID > 0)) $stmnt = $stmnt.", categoryID;";										
		};
		if ($getWorldData > 0) {		
				$stmnt = $stmnt.
					($hasOtherCountries > 0 ? " UNION " : " ")."				
					SELECT dm.scenarioID, 301 AS indicatorID, dm.deviceID, devNam.categoryID AS categoryID, batTypeID, pwrTypeID, ".
						"'World' as namen, 1111 AS countryID, 
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
						if ( ($showAtDeviceLevel  > 0) and ($deviceID > 0)) $stmnt = $stmnt.", deviceID;";
						if ( ($showAtDeviceLevel == 0) and ($deviceID > 0)) $stmnt = $stmnt.", categoryID;";								
		};
		
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return $stmnt;		
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
		
		if ($perHH) {
			$sumStmnt = "
					sum(dbt.Y2004*sdp.Y2004/sdt.Y2004) as Y2004, sum(dbt.Y2005*sdp.Y2005/sdt.Y2005) as Y2005, sum(dbt.Y2006*sdp.Y2006/sdt.Y2006) as Y2006,
					sum(dbt.Y2007*sdp.Y2007/sdt.Y2007) as Y2007, sum(dbt.Y2008*sdp.Y2008/sdt.Y2008) as Y2008, sum(dbt.Y2009*sdp.Y2009/sdt.Y2009) as Y2009,
					sum(dbt.Y2010*sdp.Y2010/sdt.Y2010) as Y2010, sum(dbt.Y2011*sdp.Y2011/sdt.Y2011) as Y2011, sum(dbt.Y2012*sdp.Y2012/sdt.Y2012) as Y2012,
					sum(dbt.Y2013*sdp.Y2013/sdt.Y2013) as Y2013, sum(dbt.Y2014*sdp.Y2014/sdt.Y2014) as Y2014, sum(dbt.Y2015*sdp.Y2015/sdt.Y2015) as Y2015,    
					sum(dbt.Y2016*sdp.Y2016/sdt.Y2016) as Y2016, sum(dbt.Y2017*sdp.Y2017/sdt.Y2017) as Y2017, sum(dbt.Y2018*sdp.Y2018/sdt.Y2018) as Y2018,    
					sum(dbt.Y2019*sdp.Y2019/sdt.Y2019) as Y2019, sum(dbt.Y2020*sdp.Y2020/sdt.Y2020) as Y2020, sum(dbt.Y2021*sdp.Y2021/sdt.Y2021) as Y2021
					";		
		} else {
			$sumStmnt = "
				    sum(dbt.Y2004*sdp.Y2004) as Y2004, sum(dbt.Y2005*sdp.Y2005) as Y2005, sum(dbt.Y2006*sdp.Y2006) as Y2006,
					sum(dbt.Y2007*sdp.Y2007) as Y2007, sum(dbt.Y2008*sdp.Y2008) as Y2008, sum(dbt.Y2009*sdp.Y2009) as Y2009,
					sum(dbt.Y2010*sdp.Y2010) as Y2010, sum(dbt.Y2011*sdp.Y2011) as Y2011, sum(dbt.Y2012*sdp.Y2012) as Y2012,
					sum(dbt.Y2013*sdp.Y2013) as Y2013, sum(dbt.Y2014*sdp.Y2014) as Y2014, sum(dbt.Y2015*sdp.Y2015) as Y2015,    
					sum(dbt.Y2016*sdp.Y2016) as Y2016, sum(dbt.Y2017*sdp.Y2017) as Y2017, sum(dbt.Y2018*sdp.Y2018) as Y2018,    
					sum(dbt.Y2019*sdp.Y2019) as Y2019, sum(dbt.Y2020*sdp.Y2020) as Y2020, sum(dbt.Y2021*sdp.Y2021) as Y2021
					";
		};
		
		$stmnt = "
			SELECT dbt.scenarioID, dbt.countryID, dbt.indicatorID, sdp.indicatorID, 
				dbt.deviceID, sdp.deviceID,	nc.namen, sdp.typeID, devNam.categoryID AS categoryID,
				".$sumStmnt."		
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
				if ($showAtDeviceLevel  > 0)  $stmnt = $stmnt.", dbt.deviceID;";
				if ($showAtDeviceLevel == 0)  $stmnt = $stmnt.", categoryID;";		
			
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return $stmnt;
	}
	
	public function getDemandByChemistry($countryIDs, $scenarioID, $isRegion) {
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
		$stmnt = "
			SELECT scenarioID, 301 AS indicatorID, chm.id as chemistryID, 0 AS deviceID, ". 
				($isRegion > 0 ? " rg.namen as namen, rg.id AS countryID, " : "nc.namen AS namen, dma.countryID, ")."	
				Y2004 * chm.shr as Y2004, Y2005 * chm.shr as Y2005, Y2006 * chm.shr as Y2006, Y2007 * chm.shr as Y2007,  
				Y2008 * chm.shr as Y2008, Y2009 * chm.shr as Y2009, Y2010 * chm.shr as Y2010, Y2011 * chm.shr as Y2011,  
				Y2012 * chm.shr as Y2012, Y2013 * chm.shr as Y2013, Y2014 * chm.shr as Y2014, Y2015 * chm.shr as Y2015,  
				Y2016 * chm.shr as Y2016, Y2017 * chm.shr as Y2017, Y2018 * chm.shr as Y2018, Y2019 * chm.shr as Y2019,  
				Y2020 * chm.shr as Y2020, Y2021 * chm.shr as Y2021  
			FROM `Consulting`.`DC_demandAggregated` dma
				JOIN Consulting.DC_chemistry chm ON  chm.countryID = dma.countryID
			JOIN Consulting.DC_namesCountries AS nc ON (dma.countryID = nc.id) ".                    
				($isRegion > 0 ? " JOIN Consulting.DC_namesCountries AS rg ON (nc.".$useCluster." = rg.id)" : "")."						
			WHERE scenarioID IN (".$scenarioID.", 10001)".				
				($isRegion > 0 ? " AND nc.".$useCluster : " AND dma.countryID ")." IN ".$countryList.	
			"GROUP BY scenarioID, chemistryID ".
				($isRegion > 0 ? ", nc.".$useCluster : ", dma.countryID");
			
		$result = $this->connection->fetchAll($stmnt); 
		array_push($a, $result);		
		return $result;
		//return $stmnt;
	}
	
}		
?>

CREATE ALGORITHM=UNDEFINED DEFINER=`cFullUserPW`@`%` SQL SECURITY DEFINER VIEW `DC_demand` AS 

select `devb`.`scenarioID` AS `scenarioID`,`devb`.`countryID` AS `countryID`,`devb`.`deviceID` AS `deviceID`,`batMap`.`sizeID` AS `batTypeID`,`batMap`.`pwrID` AS `pwrTypeID`,
NULL AS `Y2005`,
((((`devb`.`Y2006` * `batSizeShare`.`Y2006`) * `dpws`.`Y2006`) * `avgBat`.`Y2006`) * `rplc`.`Y2006`) AS `Y2006`,
((((`devb`.`Y2007` * `batSizeShare`.`Y2007`) * `dpws`.`Y2007`) * `avgBat`.`Y2007`) * `rplc`.`Y2007`) AS `Y2007`,
((((`devb`.`Y2008` * `batSizeShare`.`Y2008`) * `dpws`.`Y2008`) * `avgBat`.`Y2008`) * `rplc`.`Y2008`) AS `Y2008`,
((((`devb`.`Y2009` * `batSizeShare`.`Y2009`) * `dpws`.`Y2009`) * `avgBat`.`Y2009`) * `rplc`.`Y2009`) AS `Y2009`,
((((`devb`.`Y2010` * `batSizeShare`.`Y2010`) * `dpws`.`Y2010`) * `avgBat`.`Y2010`) * `rplc`.`Y2010`) AS `Y2010`,
((((`devb`.`Y2011` * `batSizeShare`.`Y2011`) * `dpws`.`Y2011`) * `avgBat`.`Y2011`) * `rplc`.`Y2011`) AS `Y2011`,
((((`devb`.`Y2012` * `batSizeShare`.`Y2012`) * `dpws`.`Y2012`) * `avgBat`.`Y2012`) * `rplc`.`Y2012`) AS `Y2012`,
((((`devb`.`Y2013` * `batSizeShare`.`Y2013`) * `dpws`.`Y2013`) * `avgBat`.`Y2013`) * `rplc`.`Y2013`) AS `Y2013`,
((((`devb`.`Y2014` * `batSizeShare`.`Y2014`) * `dpws`.`Y2014`) * `avgBat`.`Y2014`) * `rplc`.`Y2014`) AS `Y2014`,
((((`devb`.`Y2015` * `batSizeShare`.`Y2015`) * `dpws`.`Y2015`) * `avgBat`.`Y2015`) * `rplc`.`Y2015`) AS `Y2015`,
((((`devb`.`Y2016` * `batSizeShare`.`Y2016`) * `dpws`.`Y2016`) * `avgBat`.`Y2016`) * `rplc`.`Y2016`) AS `Y2016`,
((((`devb`.`Y2017` * `batSizeShare`.`Y2017`) * `dpws`.`Y2017`) * `avgBat`.`Y2017`) * `rplc`.`Y2017`) AS `Y2017`,
((((`devb`.`Y2018` * `batSizeShare`.`Y2018`) * `dpws`.`Y2018`) * `avgBat`.`Y2018`) * `rplc`.`Y2018`) AS `Y2018`,
((((`devb`.`Y2019` * `batSizeShare`.`Y2019`) * `dpws`.`Y2019`) * `avgBat`.`Y2019`) * `rplc`.`Y2019`) AS `Y2019`,
((((`devb`.`Y2020` * `batSizeShare`.`Y2020`) * `dpws`.`Y2020`) * `avgBat`.`Y2020`) * `rplc`.`Y2020`) AS `Y2020`,
((((`devb`.`Y2021` * `batSizeShare`.`Y2021`) * `dpws`.`Y2021`) * `avgBat`.`Y2021`) * `rplc`.`Y2021`) AS `Y2021` 

from (((((`DC_deviceBaseTable` `devb` 
	join `DC_scenarioData` `batSizeShare` 
		on(((`batSizeShare`.`deviceID` = `devb`.`deviceID`) and (`batSizeShare`.`scenarioID` = `devb`.`scenarioID`) and (`batSizeShare`.`countryID` = `devb`.`countryID`)))) 
	join `DC_scenarioData` `avgBat` 
		on(((`avgBat`.`deviceID` = `devb`.`deviceID`) and (`avgBat`.`countryID` = `devb`.`countryID`) and (`batSizeShare`.`typeID` = `avgBat`.`typeID`) and (`avgBat`.`scenarioID` = `devb`.`scenarioID`)))) 
	join `DC_newReplacementRateTable` `rplc` 
		on(((`rplc`.`deviceID` = `devb`.`deviceID`) and (`rplc`.`scenarioID` = `devb`.`scenarioID`) and (`rplc`.`countryID` = `devb`.`countryID`)))) 
	join `DC_scenarioData` `dpws` 
		on(((`dpws`.`deviceID` = `devb`.`deviceID`) and (`devb`.`scenarioID` = `dpws`.`scenarioID`) and (`dpws`.`countryID` = `devb`.`countryID`)))) 
	join `DC_sizesToPwrMap` `batMap` 
		on(((`batMap`.`sizeID` = `batSizeShare`.`typeID`) and (`batMap`.`pwrID` = `dpws`.`typeID`)))) 

where ((`batSizeShare`.`indicatorID` = 204) and (`avgBat`.`indicatorID` = 206) and (`dpws`.`indicatorID` = 205) and (`batSizeShare`.`typeID` <> 8))
CREATE ALGORITHM=UNDEFINED DEFINER=`cFullUserPW`@`%` SQL SECURITY DEFINER VIEW `DC_salesWTrend` AS 

select `sls`.`scenarioID` AS `scenarioID`,`sls`.`countryID` AS `countryID`,`sls`.`deviceID` AS `deviceID`, 
(exp((`sls`.`Y2006` + ln(`tr`.`Y2006`))) * `sdt`.`Y2006`) AS `Y2006`, 
(exp((`sls`.`Y2007` + ln(`tr`.`Y2007`))) * `sdt`.`Y2007`) AS `Y2007`, 
(exp((`sls`.`Y2008` + ln(`tr`.`Y2008`))) * `sdt`.`Y2008`) AS `Y2008`, 
(exp((`sls`.`Y2009` + ln(`tr`.`Y2009`))) * `sdt`.`Y2009`) AS `Y2009`, 
(exp((`sls`.`Y2010` + ln(`tr`.`Y2010`))) * `sdt`.`Y2010`) AS `Y2010`, 
(exp((`sls`.`Y2011` + ln(`tr`.`Y2011`))) * `sdt`.`Y2011`) AS `Y2011`, 
(exp((`sls`.`Y2012` + ln(`tr`.`Y2012`))) * `sdt`.`Y2012`) AS `Y2012`, 
(exp((`sls`.`Y2013` + ln(`tr`.`Y2013`))) * `sdt`.`Y2013`) AS `Y2013`, 
(exp((`sls`.`Y2014` + ln(`tr`.`Y2014`))) * `sdt`.`Y2014`) AS `Y2014`, 
(exp((`sls`.`Y2015` + ln(`tr`.`Y2015`))) * `sdt`.`Y2015`) AS `Y2015`, 
(exp((`sls`.`Y2016` + ln(`tr`.`Y2016`))) * `sdt`.`Y2016`) AS `Y2016`, 
(exp((`sls`.`Y2017` + ln(`tr`.`Y2017`))) * `sdt`.`Y2017`) AS `Y2017`, 
(exp((`sls`.`Y2018` + ln(`tr`.`Y2018`))) * `sdt`.`Y2018`) AS `Y2018`, 
(exp((`sls`.`Y2019` + ln(`tr`.`Y2019`))) * `sdt`.`Y2019`) AS `Y2019`, 
(exp((`sls`.`Y2020` + ln(`tr`.`Y2020`))) * `sdt`.`Y2020`) AS `Y2020`, 
(exp((`sls`.`Y2021` + ln(`tr`.`Y2021`))) * `sdt`.`Y2021`) AS `Y2021` 

from ((`DC_sales` `sls` 
	join `DC_salesTrend` `tr` 
		on(((`tr`.`countryID` = `sls`.`countryID`) and (`tr`.`deviceID` = `sls`.`deviceID`)))) 
	join `DC	_scenarioData` `sdt` 
		on(((`sdt`.`countryID` = `sls`.`countryID`) and (`sdt`.`scenarioID` = `sls`.`scenarioID`)))) 

where (`sdt`.`indicatorID` = 153)
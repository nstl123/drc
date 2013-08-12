CREATE ALGORITHM=UNDEFINED DEFINER=`cFullUserPW`@`%` SQL SECURITY DEFINER VIEW `DC_salesWTrend` AS 

select `sls`.`scenarioID` AS `scenarioID`,`sls`.`countryID` AS `countryID`,`sls`.`deviceID` AS `deviceID`, 

hst.Y2006, hst.Y2007, hst.Y2008, hst.Y2009, hst.Y2010, hst.Y2011, hst.Y2012, 
(exp((`sls`.`Y2013` + ln(`tr`.`Y2013`))) * `sdt`.`Y2013`) AS `Y2013`, 
(exp((`sls`.`Y2014` + ln(`tr`.`Y2014`))) * `sdt`.`Y2014`) AS `Y2014`, 
(exp((`sls`.`Y2015` + ln(`tr`.`Y2015`))) * `sdt`.`Y2015`) AS `Y2015`, 
(exp((`sls`.`Y2016` + ln(`tr`.`Y2016`))) * `sdt`.`Y2016`) AS `Y2016`, 
(exp((`sls`.`Y2017` + ln(`tr`.`Y2017`))) * `sdt`.`Y2017`) AS `Y2017`, 
(exp((`sls`.`Y2018` + ln(`tr`.`Y2018`))) * `sdt`.`Y2018`) AS `Y2018`, 
(exp((`sls`.`Y2019` + ln(`tr`.`Y2019`))) * `sdt`.`Y2019`) AS `Y2019`, 
(exp((`sls`.`Y2020` + ln(`tr`.`Y2020`))) * `sdt`.`Y2020`) AS `Y2020`, 
(exp((`sls`.`Y2021` + ln(`tr`.`Y2021`))) * `sdt`.`Y2021`) AS `Y2021` 

from Consulting.`DC_sales` `sls` 
	join Consulting.`DC_salesTrend` `tr` 
		on ( (`tr`.`countryID` = `sls`.`countryID`) and (`tr`.`deviceID` = `sls`.`deviceID`) )
  join Consulting.`DC_historicSales` `hst` 
		on ( (`hst`.`countryID` = `sls`.`countryID`) and (`hst`.`deviceID` = `sls`.`deviceID`) ) 
	join Consulting.`DC_scenarioData` `sdt` 
		on ( (`sdt`.`countryID` = `sls`.`countryID`) and (`sdt`.`scenarioID` = `sls`.`scenarioID`) )
    
where (`sdt`.`indicatorID` = 153)
/*and sls.scenarioID = 10001
and sls.countryID = 51
and sls.deviceID = 51;*/
CREATE ALGORITHM=UNDEFINED DEFINER=`cFullUserPW`@`%` SQL SECURITY DEFINER VIEW `DC_newSalesShare` AS 

select `msz`.`scenarioID` AS `scenarioID`,`msz`.`countryID` AS `countryID`,`msz`.`deviceID` AS `deviceID`,`msz`.`typeID` AS `typeID`,
(`msz`.`Y2006` / `devB`.`Y2006`) AS `Y2006`,
(`msz`.`Y2007` / `devB`.`Y2007`) AS `Y2007`,
(`msz`.`Y2008` / `devB`.`Y2008`) AS `Y2008`,
(`msz`.`Y2009` / `devB`.`Y2009`) AS `Y2009`,
(`msz`.`Y2010` / `devB`.`Y2010`) AS `Y2010`,
(`msz`.`Y2011` / `devB`.`Y2011`) AS `Y2011`,
(`msz`.`Y2012` / `devB`.`Y2012`) AS `Y2012`,
(`msz`.`Y2013` / `devB`.`Y2013`) AS `Y2013`,
(`msz`.`Y2014` / `devB`.`Y2014`) AS `Y2014`,
(`msz`.`Y2015` / `devB`.`Y2015`) AS `Y2015`,
(`msz`.`Y2016` / `devB`.`Y2016`) AS `Y2016`,
(`msz`.`Y2017` / `devB`.`Y2017`) AS `Y2017`,
(`msz`.`Y2018` / `devB`.`Y2018`) AS `Y2018`,
(`msz`.`Y2019` / `devB`.`Y2019`) AS `Y2019`,
(`msz`.`Y2020` / `devB`.`Y2020`) AS `Y2020`,
(`msz`.`Y2021` / `devB`.`Y2021`) AS `Y2021` 

from (`DC_scenarioData` `msz` 
	join `DC_deviceBaseTable` `devB` 
		on(((`msz`.`scenarioID` = `devB`.`scenarioID`) and (`msz`.`countryID` = `devB`.`countryID`) and (`msz`.`deviceID` = `devB`.`deviceID`)))) 

where ((`msz`.`indicatorID` = 210) and (`devB`.`indicatorID` = 203))
CREATE ALGORITHM=UNDEFINED DEFINER=`cFullUserPW`@`%` SQL SECURITY DEFINER VIEW `DC_newSalesShare` AS 

select `msz`.`scenarioID` AS `scenarioID`,`msz`.`countryID` AS `countryID`,`msz`.`deviceID` AS `deviceID`,`msz`.`typeID` AS `typeID`,
ifnull(`msz`.`Y2006` / `devB`.`Y2006`, 0) AS `Y2006`,
ifnull(`msz`.`Y2007` / `devB`.`Y2007`, 0) AS `Y2007`,
ifnull(`msz`.`Y2008` / `devB`.`Y2008`, 0) AS `Y2008`,
ifnull(`msz`.`Y2009` / `devB`.`Y2009`, 0) AS `Y2009`,
ifnull(`msz`.`Y2010` / `devB`.`Y2010`, 0) AS `Y2010`,
ifnull(`msz`.`Y2011` / `devB`.`Y2011`, 0) AS `Y2011`,
ifnull(`msz`.`Y2012` / `devB`.`Y2012`, 0) AS `Y2012`,
ifnull(`msz`.`Y2013` / `devB`.`Y2013`, 0) AS `Y2013`,
ifnull(`msz`.`Y2014` / `devB`.`Y2014`, 0) AS `Y2014`,
ifnull(`msz`.`Y2015` / `devB`.`Y2015`, 0) AS `Y2015`,
ifnull(`msz`.`Y2016` / `devB`.`Y2016`, 0) AS `Y2016`,
ifnull(`msz`.`Y2017` / `devB`.`Y2017`, 0) AS `Y2017`,
ifnull(`msz`.`Y2018` / `devB`.`Y2018`, 0) AS `Y2018`,
ifnull(`msz`.`Y2019` / `devB`.`Y2019`, 0) AS `Y2019`,
ifnull(`msz`.`Y2020` / `devB`.`Y2020`, 0) AS `Y2020`,
ifnull(`msz`.`Y2021` / `devB`.`Y2021`, 0) AS `Y2021` 

from (`DC_scenarioData` `msz` 
	join `DC_deviceBaseTable` `devB` 
		on(((`msz`.`scenarioID` = `devB`.`scenarioID`) and (`msz`.`countryID` = `devB`.`countryID`) and (`msz`.`deviceID` = `devB`.`deviceID`)))) 

where ((`msz`.`indicatorID` = 210) and (`devB`.`indicatorID` = 203))
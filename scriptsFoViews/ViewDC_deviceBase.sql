CREATE ALGORITHM=UNDEFINED DEFINER=`cFullUserPW`@`%` SQL SECURITY DEFINER VIEW `DC_deviceBase` AS 

select `sdt1`.`scenarioID` AS `scenarioID`,`sdt1`.`countryID` AS `countryID`,`sdt1`.`deviceID` AS `deviceID`,
203 AS `indicatorID`,
(((`sdt1`.`Y2005` * `sdt2`.`Y2005`) * `sdm`.`Y2005`) / 100) AS `Y2005`,
(((`sdt1`.`Y2006` * `sdt2`.`Y2006`) * `sdm`.`Y2006`) / 100) AS `Y2006`,
(((`sdt1`.`Y2007` * `sdt2`.`Y2007`) * `sdm`.`Y2007`) / 100) AS `Y2007`,
(((`sdt1`.`Y2008` * `sdt2`.`Y2008`) * `sdm`.`Y2008`) / 100) AS `Y2008`,
(((`sdt1`.`Y2009` * `sdt2`.`Y2009`) * `sdm`.`Y2009`) / 100) AS `Y2009`,
(((`sdt1`.`Y2010` * `sdt2`.`Y2010`) * `sdm`.`Y2010`) / 100) AS `Y2010`,
(((`sdt1`.`Y2011` * `sdt2`.`Y2011`) * `sdm`.`Y2011`) / 100) AS `Y2011`,
(((`sdt1`.`Y2012` * `sdt2`.`Y2012`) * `sdm`.`Y2012`) / 100) AS `Y2012`,
(((`sdt1`.`Y2013` * `sdt2`.`Y2013`) * `sdm`.`Y2013`) / 100) AS `Y2013`,
(((`sdt1`.`Y2014` * `sdt2`.`Y2014`) * `sdm`.`Y2014`) / 100) AS `Y2014`,
(((`sdt1`.`Y2015` * `sdt2`.`Y2015`) * `sdm`.`Y2015`) / 100) AS `Y2015`,
(((`sdt1`.`Y2016` * `sdt2`.`Y2016`) * `sdm`.`Y2016`) / 100) AS `Y2016`,
(((`sdt1`.`Y2017` * `sdt2`.`Y2017`) * `sdm`.`Y2017`) / 100) AS `Y2017`,
(((`sdt1`.`Y2018` * `sdt2`.`Y2018`) * `sdm`.`Y2018`) / 100) AS `Y2018`,
(((`sdt1`.`Y2019` * `sdt2`.`Y2019`) * `sdm`.`Y2019`) / 100) AS `Y2019`,
(((`sdt1`.`Y2020` * `sdt2`.`Y2020`) * `sdm`.`Y2020`) / 100) AS `Y2020`,
(((`sdt1`.`Y2021` * `sdt2`.`Y2021`) * `sdm`.`Y2021`) / 100) AS `Y2021`

from ((Consulting.`DC_scenarioData` `sdt1` 
	join Consulting.`DC_scenarioData` `sdt2` 
		on(((`sdt1`.`countryID` = `sdt2`.`countryID`) and (`sdt1`.`deviceID` = `sdt2`.`deviceID`) and (`sdt1`.`scenarioID` = `sdt2`.`scenarioID`)))) 
	join Consulting.`DC_scenarioData` `sdm` 
		on(((`sdm`.`countryID` = `sdt1`.`countryID`) and (`sdm`.`scenarioID` = `sdt1`.`scenarioID`)))) 

where ((`sdt1`.`indicatorID` = 201) and (`sdt2`.`indicatorID` = 202) and (`sdm`.`indicatorID` = 101))
CREATE ALGORITHM=UNDEFINED DEFINER=`cFullUserPW`@`%` SQL SECURITY DEFINER VIEW `DC_deviceWeightsBySizes` AS 

select `sdt`.`scenarioID` AS `scenarioID`,`sdt`.`indicatorID` AS `indicatorID`,
`sdt`.`countryID` AS `countryID`,`sdt`.`deviceID` AS `deviceID`,`sz`.`batClass` AS `batClass`,
(sum(`sdt`.`Y2002`) * `hhp`.`Y2002`) AS `Y2002`, (sum(`sdt`.`Y2003`) * `hhp`.`Y2003`) AS `Y2003`,
(sum(`sdt`.`Y2004`) * `hhp`.`Y2004`) AS `Y2004`, (sum(`sdt`.`Y2005`) * `hhp`.`Y2005`) AS `Y2005`,
(sum(`sdt`.`Y2006`) * `hhp`.`Y2006`) AS `Y2006`, (sum(`sdt`.`Y2007`) * `hhp`.`Y2007`) AS `Y2007`,
(sum(`sdt`.`Y2008`) * `hhp`.`Y2008`) AS `Y2008`, (sum(`sdt`.`Y2009`) * `hhp`.`Y2009`) AS `Y2009`,
(sum(`sdt`.`Y2010`) * `hhp`.`Y2010`) AS `Y2010`, (sum(`sdt`.`Y2011`) * `hhp`.`Y2011`) AS `Y2011`,
(sum(`sdt`.`Y2012`) * `hhp`.`Y2012`) AS `Y2012`, (sum(`sdt`.`Y2013`) * `hhp`.`Y2013`) AS `Y2013`,
(sum(`sdt`.`Y2014`) * `hhp`.`Y2014`) AS `Y2014`, (sum(`sdt`.`Y2015`) * `hhp`.`Y2015`) AS `Y2015`,
(sum(`sdt`.`Y2016`) * `hhp`.`Y2016`) AS `Y2016`, (sum(`sdt`.`Y2017`) * `hhp`.`Y2017`) AS `Y2017`, 
(sum(`sdt`.`Y2018`) * `hhp`.`Y2018`) AS `Y2018`, (sum(`sdt`.`Y2019`) * `hhp`.`Y2019`) AS `Y2019`, 
(sum(`sdt`.`Y2020`) * `hhp`.`Y2020`) AS `Y2020`, (sum(`sdt`.`Y2021`) * `hhp`.`Y2021`) AS `Y2021` 

from ((`DC_scenarioData` `sdt` 
	join `DC_namesBatSizeTypes` `sz` on((`sz`.`id` = `sdt`.`typeID`))) 
	join `DC_scenarioData` `hhp` 
		on(((`hhp`.`scenarioID` = `sdt`.`scenarioID`) and (`hhp`.`countryID` = `sdt`.`countryID`) and (`hhp`.`deviceID` = `sdt`.`deviceID`)))) 
		
where ((`sdt`.`indicatorID` = 204) and (`hhp`.`indicatorID` = 201) and (`sz`.`batClass` in (1,2,3))) 

group by `sdt`.`scenarioID`,`sdt`.`countryID`,`sdt`.`deviceID`,`sz`.`batClass`
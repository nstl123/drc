CREATE ALGORITHM=UNDEFINED DEFINER=`cFullUserPW`@`%` SQL SECURITY DEFINER VIEW `DC_weightsPerDeviceBase` AS 

select `a`.`scenarioID` AS `scenarioID`,`dvb2`.`countryID` AS `countryID`,`dvb2`.`deviceID` AS `deviceID`,`nmd2`.`categoryID` AS `categoryID`,
(`dvb2`.`Y2005` / `a`.`Y2005`) AS `Y2005`,(`dvb2`.`Y2006` / `a`.`Y2006`) AS `Y2006`, 
(`dvb2`.`Y2007` / `a`.`Y2007`) AS `Y2007`,(`dvb2`.`Y2008` / `a`.`Y2008`) AS `Y2008`, 
(`dvb2`.`Y2009` / `a`.`Y2009`) AS `Y2009`,(`dvb2`.`Y2010` / `a`.`Y2010`) AS `Y2010`, 
(`dvb2`.`Y2011` / `a`.`Y2011`) AS `Y2011`,(`dvb2`.`Y2012` / `a`.`Y2012`) AS `Y2012`, 
(`dvb2`.`Y2013` / `a`.`Y2013`) AS `Y2013`,(`dvb2`.`Y2014` / `a`.`Y2014`) AS `Y2014`, 
(`dvb2`.`Y2015` / `a`.`Y2015`) AS `Y2015`,(`dvb2`.`Y2016` / `a`.`Y2016`) AS `Y2016`, 
(`dvb2`.`Y2017` / `a`.`Y2017`) AS `Y2017`,(`dvb2`.`Y2018` / `a`.`Y2018`) AS `Y2018`, 
(`dvb2`.`Y2019` / `a`.`Y2019`) AS `Y2019`,(`dvb2`.`Y2020` / `a`.`Y2020`) AS `Y2020`, 
(`dvb2`.`Y2021` / `a`.`Y2021`) AS `Y2021` 

from ((`DC_devBaseTotalsCategories` `a` 
	join `DC_deviceBase` `dvb2` 
		on(((`dvb2`.`countryID` = `a`.`countryID`) and (`dvb2`.`scenarioID` = `a`.`scenarioID`)))) 
	
	join `DC_namesDevices` `nmd2` 
		on(((`nmd2`.`id` = `dvb2`.`deviceID`) and (`nmd2`.`categoryID` = `a`.`categoryID`))))
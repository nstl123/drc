CREATE ALGORITHM=UNDEFINED DEFINER=`cFullUserPW`@`%` SQL SECURITY DEFINER 
VIEW `Consulting`.`DC_scenarioDataIndisWeightedBySz` AS 

	select `wg`.`scenarioID` AS `scenarioID`,`wg`.`countryID` AS `countryID`,
	213 AS `indicatorID`,`wg`.`deviceID` AS `deviceID`,0 AS `typeID`,
	(`wg`.`Y2002` * `hhp`.`Y2002`) AS `Y2002`,(`wg`.`Y2003` * `hhp`.`Y2003`) AS `Y2003`,(`wg`.`Y2004` * `hhp`.`Y2004`) AS `Y2004`,
	(`wg`.`Y2005` * `hhp`.`Y2005`) AS `Y2005`,(`wg`.`Y2006` * `hhp`.`Y2006`) AS `Y2006`,(`wg`.`Y2007` * `hhp`.`Y2007`) AS `Y2007`,
	(`wg`.`Y2008` * `hhp`.`Y2008`) AS `Y2008`,(`wg`.`Y2009` * `hhp`.`Y2009`) AS `Y2009`,(`wg`.`Y2010` * `hhp`.`Y2010`) AS `Y2010`,
	(`wg`.`Y2011` * `hhp`.`Y2011`) AS `Y2011`,(`wg`.`Y2012` * `hhp`.`Y2012`) AS `Y2012`,(`wg`.`Y2013` * `hhp`.`Y2013`) AS `Y2013`,
	(`wg`.`Y2014` * `hhp`.`Y2014`) AS `Y2014`,(`wg`.`Y2015` * `hhp`.`Y2015`) AS `Y2015`,(`wg`.`Y2016` * `hhp`.`Y2016`) AS `Y2016`,
	(`wg`.`Y2017` * `hhp`.`Y2017`) AS `Y2017`,(`wg`.`Y2018` * `hhp`.`Y2018`) AS `Y2018`,(`wg`.`Y2019` * `hhp`.`Y2019`) AS `Y2019`,
	(`wg`.`Y2020` * `hhp`.`Y2020`) AS `Y2020`,(`wg`.`Y2021` * `hhp`.`Y2021`) AS `Y2021` 

	from (`Consulting`.`DC_scenarioData` `wg` 
		join `Consulting`.`DC_scenarioData` `hhp` 
		on(((`wg`.`scenarioID` = `hhp`.`scenarioID`) and (`wg`.`countryID` = `hhp`.`countryID`) and (`wg`.`deviceID` = `hhp`.`deviceID`)))) 
		where ((`wg`.`indicatorID` = 205) and (`hhp`.`indicatorID` = 201) and (`wg`.`typeID` = 105)) 
 
union 

	select `wg`.`scenarioID` AS `scenarioID`,`wg`.`countryID` AS `countryID`,
	214 AS `indicatorID`,`wg`.`deviceID` AS `deviceID`,0 AS `typeID`,
	(`wg`.`Y2002` * `msz`.`Y2002`) AS `Y2002`,(`wg`.`Y2003` * `msz`.`Y2003`) AS `Y2003`,(`wg`.`Y2004` * `msz`.`Y2004`) AS `Y2004`,
	(`wg`.`Y2005` * `msz`.`Y2005`) AS `Y2005`,(`wg`.`Y2006` * `msz`.`Y2006`) AS `Y2006`,(`wg`.`Y2007` * `msz`.`Y2007`) AS `Y2007`,
	(`wg`.`Y2008` * `msz`.`Y2008`) AS `Y2008`,(`wg`.`Y2009` * `msz`.`Y2009`) AS `Y2009`,(`wg`.`Y2010` * `msz`.`Y2010`) AS `Y2010`,
	(`wg`.`Y2011` * `msz`.`Y2011`) AS `Y2011`,(`wg`.`Y2012` * `msz`.`Y2012`) AS `Y2012`,(`wg`.`Y2013` * `msz`.`Y2013`) AS `Y2013`,
	(`wg`.`Y2014` * `msz`.`Y2014`) AS `Y2014`,(`wg`.`Y2015` * `msz`.`Y2015`) AS `Y2015`,(`wg`.`Y2016` * `msz`.`Y2016`) AS `Y2016`,
	(`wg`.`Y2017` * `msz`.`Y2017`) AS `Y2017`,(`wg`.`Y2018` * `msz`.`Y2018`) AS `Y2018`,(`wg`.`Y2019` * `msz`.`Y2019`) AS `Y2019`,
	(`wg`.`Y2020` * `msz`.`Y2020`) AS `Y2020`,(`wg`.`Y2021` * `msz`.`Y2021`) AS `Y2021` 

	from (`Consulting`.`DC_scenarioData` `wg` 
		join `Consulting`.`DC_scenarioData` `msz` 
		on(((`wg`.`scenarioID` = `msz`.`scenarioID`) and (`wg`.`countryID` = `msz`.`countryID`) and (`wg`.`deviceID` = `msz`.`deviceID`)))) 
		where ((`wg`.`indicatorID` = 205) and (`msz`.`indicatorID` = 210) and (`wg`.`typeID` = 105)) 

union 

	select `wg`.`scenarioID` AS `scenarioID`,`wg`.`countryID` AS `countryID`,
	215 AS `indicatorID`,`wg`.`deviceID` AS `deviceID`,0 AS `typeID`,
	NULL AS `Y2002`,NULL AS `Y2003`,NULL AS `Y2004`,
	(`wg`.`Y2005` * `dvb`.`Y2005`) AS `Y2005`,(`wg`.`Y2006` * `dvb`.`Y2006`) AS `Y2006`,(`wg`.`Y2007` * `dvb`.`Y2007`) AS `Y2007`,
	(`wg`.`Y2008` * `dvb`.`Y2008`) AS `Y2008`,(`wg`.`Y2009` * `dvb`.`Y2009`) AS `Y2009`,(`wg`.`Y2010` * `dvb`.`Y2010`) AS `Y2010`,
	(`wg`.`Y2011` * `dvb`.`Y2011`) AS `Y2011`,(`wg`.`Y2012` * `dvb`.`Y2012`) AS `Y2012`,(`wg`.`Y2013` * `dvb`.`Y2013`) AS `Y2013`,
	(`wg`.`Y2014` * `dvb`.`Y2014`) AS `Y2014`,(`wg`.`Y2015` * `dvb`.`Y2015`) AS `Y2015`,(`wg`.`Y2016` * `dvb`.`Y2016`) AS `Y2016`,
	(`wg`.`Y2017` * `dvb`.`Y2017`) AS `Y2017`,(`wg`.`Y2018` * `dvb`.`Y2018`) AS `Y2018`,(`wg`.`Y2019` * `dvb`.`Y2019`) AS `Y2019`,
	(`wg`.`Y2020` * `dvb`.`Y2020`) AS `Y2020`,(`wg`.`Y2021` * `dvb`.`Y2021`) AS `Y2021` 

	from (`Consulting`.`DC_scenarioData` `wg` 
		join `Consulting`.`DC_deviceBaseTable` `dvb` 
		on(((`wg`.`scenarioID` = `dvb`.`scenarioID`) and (`wg`.`countryID` = `dvb`.`countryID`) and (`wg`.`deviceID` = `dvb`.`deviceID`)))) 
		where ((`wg`.`indicatorID` = 205) and (`dvb`.`indicatorID` = 203) and (`wg`.`typeID` = 105))
		
union

	select `wg`.`scenarioID` AS `scenarioID`,`wg`.`countryID` AS `countryID`,
	216 AS `indicatorID`,`wg`.`deviceID` AS `deviceID`,0 AS `typeID`,
	(`wg`.`Y2002` * `avg`.`Y2002`) AS `Y2002`,(`wg`.`Y2003` * `avg`.`Y2003`) AS `Y2003`,(`wg`.`Y2004` * `avg`.`Y2004`) AS `Y2004`,
	(`wg`.`Y2005` * `avg`.`Y2005`) AS `Y2005`,(`wg`.`Y2006` * `avg`.`Y2006`) AS `Y2006`,(`wg`.`Y2007` * `avg`.`Y2007`) AS `Y2007`,
	(`wg`.`Y2008` * `avg`.`Y2008`) AS `Y2008`,(`wg`.`Y2009` * `avg`.`Y2009`) AS `Y2009`,(`wg`.`Y2010` * `avg`.`Y2010`) AS `Y2010`,
	(`wg`.`Y2011` * `avg`.`Y2011`) AS `Y2011`,(`wg`.`Y2012` * `avg`.`Y2012`) AS `Y2012`,(`wg`.`Y2013` * `avg`.`Y2013`) AS `Y2013`,
	(`wg`.`Y2014` * `avg`.`Y2014`) AS `Y2014`,(`wg`.`Y2015` * `avg`.`Y2015`) AS `Y2015`,(`wg`.`Y2016` * `avg`.`Y2016`) AS `Y2016`,
	(`wg`.`Y2017` * `avg`.`Y2017`) AS `Y2017`,(`wg`.`Y2018` * `avg`.`Y2018`) AS `Y2018`,(`wg`.`Y2019` * `avg`.`Y2019`) AS `Y2019`,
	(`wg`.`Y2020` * `avg`.`Y2020`) AS `Y2020`,(`wg`.`Y2021` * `avg`.`Y2021`) AS `Y2021` 

	from (`Consulting`.`DC_scenarioData` `wg` 
		join `Consulting`.`DC_scenarioData` `avg` 
		on(((`wg`.`scenarioID` = `avg`.`scenarioID`) and (`wg`.`countryID` = `avg`.`countryID`) and (`wg`.`deviceID` = `avg`.`deviceID`)))) 
		where ((`wg`.`indicatorID` = 205) and (`avg`.`indicatorID` = 202) and (`wg`.`typeID` = 105)) 		

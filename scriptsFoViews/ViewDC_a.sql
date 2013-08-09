CREATE ALGORITHM=UNDEFINED DEFINER=`cFullUserPW`@`%` SQL SECURITY DEFINER VIEW `DC_a` AS 
select `exodt`.`scenarioID` AS `scenarioID`,`exodt`.`countryID` AS `countryID`,`exodt`.`indicatorID` AS `indicatorID`,`md`.`deviceID` AS `deviceID`,`md`.`transCap` AS `transCap`,`md`.`transLog` AS `transLog`,`md`.`transDiff` AS `transDiff`,`md`.`transLag` AS `transLag`,`md`.`coef` AS `coef`,
((`exodt`.`Y2002` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2002` / `percap`.`Y2002`) * `md`.`transCap`)) AS `Y2002f`,
((`exodt`.`Y2003` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2003` / `percap`.`Y2003`) * `md`.`transCap`)) AS `Y2003f`,
((`exodt`.`Y2004` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2004` / `percap`.`Y2004`) * `md`.`transCap`)) AS `Y2004f`,
((`exodt`.`Y2005` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2005` / `percap`.`Y2005`) * `md`.`transCap`)) AS `Y2005f`,
((`exodt`.`Y2006` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2006` / `percap`.`Y2006`) * `md`.`transCap`)) AS `Y2006f`,
((`exodt`.`Y2007` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2007` / `percap`.`Y2007`) * `md`.`transCap`)) AS `Y2007f`,
((`exodt`.`Y2008` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2008` / `percap`.`Y2008`) * `md`.`transCap`)) AS `Y2008f`,
((`exodt`.`Y2009` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2009` / `percap`.`Y2009`) * `md`.`transCap`)) AS `Y2009f`,
((`exodt`.`Y2010` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2010` / `percap`.`Y2010`) * `md`.`transCap`)) AS `Y2010f`,
((`exodt`.`Y2011` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2011` / `percap`.`Y2011`) * `md`.`transCap`)) AS `Y2011f`,
((`exodt`.`Y2012` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2012` / `percap`.`Y2012`) * `md`.`transCap`)) AS `Y2012f`,
((`exodt`.`Y2013` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2013` / `percap`.`Y2013`) * `md`.`transCap`)) AS `Y2013f`,
((`exodt`.`Y2014` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2014` / `percap`.`Y2014`) * `md`.`transCap`)) AS `Y2014f`,
((`exodt`.`Y2015` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2015` / `percap`.`Y2015`) * `md`.`transCap`)) AS `Y2015f`,
((`exodt`.`Y2016` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2016` / `percap`.`Y2016`) * `md`.`transCap`)) AS `Y2016f`,
((`exodt`.`Y2017` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2017` / `percap`.`Y2017`) * `md`.`transCap`)) AS `Y2017f`,
((`exodt`.`Y2018` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2018` / `percap`.`Y2018`) * `md`.`transCap`)) AS `Y2018f`,
((`exodt`.`Y2019` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2019` / `percap`.`Y2019`) * `md`.`transCap`)) AS `Y2019f`,
((`exodt`.`Y2020` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2020` / `percap`.`Y2020`) * `md`.`transCap`)) AS `Y2020f`,
((`exodt`.`Y2021` * (1 - `md`.`transCap`)) + ((`exodt`.`Y2021` / `percap`.`Y2021`) * `md`.`transCap`)) AS `Y2021f`,

`cpi`.`Y2002` AS `cpi2002`,`cpi`.`Y2003` AS `cpi2003`,`cpi`.`Y2004` AS `cpi2004`,`cpi`.`Y2005` AS `cpi2005`,`cpi`.`Y2006` AS `cpi2006`,`cpi`.`Y2007` AS `cpi2007`,`cpi`.`Y2008` AS `cpi2008`,`cpi`.`Y2009` AS `cpi2009`,`cpi`.`Y2010` AS `cpi2010`,`cpi`.`Y2011` AS `cpi2011`,`cpi`.`Y2012` AS `cpi2012`,`cpi`.`Y2013` AS `cpi2013`,`cpi`.`Y2014` AS `cpi2014`,`cpi`.`Y2015` AS `cpi2015`,`cpi`.`Y2016` AS `cpi2016`,`cpi`.`Y2017` AS `cpi2017`,`cpi`.`Y2018` AS `cpi2018`,`cpi`.`Y2019` AS `cpi2019`,`cpi`.`Y2020` AS `cpi2020`,`cpi`.`Y2021` AS `cpi2021`,

(case when (`exodt`.`indicatorID` = 151) then 1 else 0 end) AS `cpiFlag`,
	(case when (`md`.`transLag` = 'L1') then 10 when (`md`.`transLag` = 'L2') then 20 when (`md`.`transLag` = 'L3') then 30 else 0 end
	) AS `transFlag` 
from (((`DC_scenarioData` `exodt` 
	join `DC_scenarioData` `percap` 
		on(((`exodt`.`scenarioID` = `percap`.`scenarioID`) and (`exodt`.`countryID` = `percap`.`countryID`)))) 
	
	join `DC_scenarioData` `cpi` 
		on(((`exodt`.`scenarioID` = `cpi`.`scenarioID`) and (`exodt`.`countryID` = `cpi`.`countryID`)))) 
	
	join `DC_modelCoefs` `md` 
		on(((`md`.`countryID` = `exodt`.`countryID`) and (`md`.`exoID` = `exodt`.`indicatorID`)))) 

where ((`percap`.`indicatorID` = 153) and (`cpi`.`indicatorID` = 172))
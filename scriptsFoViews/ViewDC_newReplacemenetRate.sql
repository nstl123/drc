CREATE ALGORITHM=UNDEFINED DEFINER=`cFullUserPW`@`%` SQL SECURITY DEFINER VIEW `DC_newReplacementRate` AS 

select `rp0`.`scenarioID` AS `scenarioID`,`rp0`.`countryID` AS `countryID`,`rp0`.`deviceID` AS `deviceID`,
-- rp0.Y2006 as Y2006, rp0.Y2007 as Y2007, rp0.Y2008 as Y2008, rp0.Y2009 as Y2009, rp0.Y2010 as Y2010, rp0.Y2011 as Y2011,
(((1 - `nosh`.`Y2006`) * `rp0`.`Y2006`) + (`nosh`.`Y2006` * ((1 - ifnull((floor(`rp0`.`Y2006`) DIV floor(`rp0`.`Y2006`)),0)) + (ifnull((floor(`rp0`.`Y2006`) DIV floor(`rp0`.`Y2006`)),0) * ((`rp0`.`Y2006` / 2) + (1 / (2 * `rp0`.`Y2006`))))))) AS `Y2006`,
(((1 - `nosh`.`Y2007`) * `rp0`.`Y2007`) + (`nosh`.`Y2007` * ((1 - ifnull((floor(`rp0`.`Y2007`) DIV floor(`rp0`.`Y2007`)),0)) + (ifnull((floor(`rp0`.`Y2007`) DIV floor(`rp0`.`Y2007`)),0) * ((`rp0`.`Y2007` / 2) + (1 / (2 * `rp0`.`Y2007`))))))) AS `Y2007`,
(((1 - `nosh`.`Y2008`) * `rp0`.`Y2008`) + (`nosh`.`Y2008` * ((1 - ifnull((floor(`rp0`.`Y2008`) DIV floor(`rp0`.`Y2008`)),0)) + (ifnull((floor(`rp0`.`Y2008`) DIV floor(`rp0`.`Y2008`)),0) * ((`rp0`.`Y2008` / 2) + (1 / (2 * `rp0`.`Y2008`))))))) AS `Y2008`,
(((1 - `nosh`.`Y2009`) * `rp0`.`Y2009`) + (`nosh`.`Y2009` * ((1 - ifnull((floor(`rp0`.`Y2009`) DIV floor(`rp0`.`Y2009`)),0)) + (ifnull((floor(`rp0`.`Y2009`) DIV floor(`rp0`.`Y2009`)),0) * ((`rp0`.`Y2009` / 2) + (1 / (2 * `rp0`.`Y2009`))))))) AS `Y2009`,
(((1 - `nosh`.`Y2010`) * `rp0`.`Y2010`) + (`nosh`.`Y2010` * ((1 - ifnull((floor(`rp0`.`Y2010`) DIV floor(`rp0`.`Y2010`)),0)) + (ifnull((floor(`rp0`.`Y2010`) DIV floor(`rp0`.`Y2010`)),0) * ((`rp0`.`Y2010` / 2) + (1 / (2 * `rp0`.`Y2010`))))))) AS `Y2010`,
(((1 - `nosh`.`Y2011`) * `rp0`.`Y2011`) + (`nosh`.`Y2011` * ((1 - ifnull((floor(`rp0`.`Y2011`) DIV floor(`rp0`.`Y2011`)),0)) + (ifnull((floor(`rp0`.`Y2011`) DIV floor(`rp0`.`Y2011`)),0) * ((`rp0`.`Y2011` / 2) + (1 / (2 * `rp0`.`Y2011`))))))) AS `Y2011`,
(((1 - `nosh`.`Y2012`) * `rp0`.`Y2012`) + (`nosh`.`Y2012` * ((1 - ifnull((floor(`rp0`.`Y2012`) DIV floor(`rp0`.`Y2012`)),0)) + (ifnull((floor(`rp0`.`Y2012`) DIV floor(`rp0`.`Y2012`)),0) * ((`rp0`.`Y2012` / 2) + (1 / (2 * `rp0`.`Y2012`))))))) AS `Y2012`,
(((1 - `nosh`.`Y2013`) * `rp0`.`Y2013`) + (`nosh`.`Y2013` * ((1 - ifnull((floor(`rp0`.`Y2013`) DIV floor(`rp0`.`Y2013`)),0)) + (ifnull((floor(`rp0`.`Y2013`) DIV floor(`rp0`.`Y2013`)),0) * ((`rp0`.`Y2013` / 2) + (1 / (2 * `rp0`.`Y2013`))))))) AS `Y2013`,
(((1 - `nosh`.`Y2014`) * `rp0`.`Y2014`) + (`nosh`.`Y2014` * ((1 - ifnull((floor(`rp0`.`Y2014`) DIV floor(`rp0`.`Y2014`)),0)) + (ifnull((floor(`rp0`.`Y2014`) DIV floor(`rp0`.`Y2014`)),0) * ((`rp0`.`Y2014` / 2) + (1 / (2 * `rp0`.`Y2014`))))))) AS `Y2014`,
(((1 - `nosh`.`Y2015`) * `rp0`.`Y2015`) + (`nosh`.`Y2015` * ((1 - ifnull((floor(`rp0`.`Y2015`) DIV floor(`rp0`.`Y2015`)),0)) + (ifnull((floor(`rp0`.`Y2015`) DIV floor(`rp0`.`Y2014`)),0) * ((`rp0`.`Y2015` / 2) + (1 / (2 * `rp0`.`Y2015`))))))) AS `Y2015`,
(((1 - `nosh`.`Y2016`) * `rp0`.`Y2016`) + (`nosh`.`Y2016` * ((1 - ifnull((floor(`rp0`.`Y2016`) DIV floor(`rp0`.`Y2016`)),0)) + (ifnull((floor(`rp0`.`Y2016`) DIV floor(`rp0`.`Y2015`)),0) * ((`rp0`.`Y2016` / 2) + (1 / (2 * `rp0`.`Y2016`))))))) AS `Y2016`,
(((1 - `nosh`.`Y2017`) * `rp0`.`Y2017`) + (`nosh`.`Y2017` * ((1 - ifnull((floor(`rp0`.`Y2017`) DIV floor(`rp0`.`Y2017`)),0)) + (ifnull((floor(`rp0`.`Y2017`) DIV floor(`rp0`.`Y2016`)),0) * ((`rp0`.`Y2017` / 2) + (1 / (2 * `rp0`.`Y2017`))))))) AS `Y2017`,
(((1 - `nosh`.`Y2018`) * `rp0`.`Y2018`) + (`nosh`.`Y2018` * ((1 - ifnull((floor(`rp0`.`Y2018`) DIV floor(`rp0`.`Y2018`)),0)) + (ifnull((floor(`rp0`.`Y2018`) DIV floor(`rp0`.`Y2017`)),0) * ((`rp0`.`Y2018` / 2) + (1 / (2 * `rp0`.`Y2018`))))))) AS `Y2018`,
(((1 - `nosh`.`Y2019`) * `rp0`.`Y2019`) + (`nosh`.`Y2019` * ((1 - ifnull((floor(`rp0`.`Y2019`) DIV floor(`rp0`.`Y2019`)),0)) + (ifnull((floor(`rp0`.`Y2019`) DIV floor(`rp0`.`Y2018`)),0) * ((`rp0`.`Y2019` / 2) + (1 / (2 * `rp0`.`Y2019`))))))) AS `Y2019`,
(((1 - `nosh`.`Y2020`) * `rp0`.`Y2020`) + (`nosh`.`Y2020` * ((1 - ifnull((floor(`rp0`.`Y2020`) DIV floor(`rp0`.`Y2020`)),0)) + (ifnull((floor(`rp0`.`Y2020`) DIV floor(`rp0`.`Y2019`)),0) * ((`rp0`.`Y2020` / 2) + (1 / (2 * `rp0`.`Y2020`))))))) AS `Y2020`,
(((1 - `nosh`.`Y2021`) * `rp0`.`Y2021`) + (`nosh`.`Y2021` * ((1 - ifnull((floor(`rp0`.`Y2021`) DIV floor(`rp0`.`Y2021`)),0)) + (ifnull((floor(`rp0`.`Y2021`) DIV floor(`rp0`.`Y2020`)),0) * ((`rp0`.`Y2021` / 2) + (1 / (2 * `rp0`.`Y2021`))))))) AS `Y2021` 

from (`DC_scenarioData` `rp0` 
	join `DC_newSalesShare` `nosh` 
		on(((`rp0`.`scenarioID` = `nosh`.`scenarioID`) and (`rp0`.`countryID` = `nosh`.`countryID`) and (`rp0`.`deviceID` = `nosh`.`deviceID`)))) 
where (`rp0`.`indicatorID` = 207)
CREATE ALGORITHM=UNDEFINED DEFINER=`cFullUserPW`@`%` SQL SECURITY DEFINER VIEW `DC_b` AS 
select `a`.`scenarioID` AS `scenarioID`,`a`.`countryID` AS `countryID`,`a`.`deviceID` AS `deviceID`,`a`.`indicatorID` AS `indicatorID`,`a`.`transCap` AS `transCap`,`a`.`transLog` AS `transLog`,`a`.`transDiff` AS `transDiff`,`a`.`transLag` AS `transLag`,`a`.`transFlag` AS `transFlag`,`a`.`coef` AS `coef`,
(((`a`.`Y2002f` / ((`a`.`cpi2002` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2002f` / ((`a`.`cpi2002` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2002g`,
(((`a`.`Y2003f` / ((`a`.`cpi2003` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2003f` / ((`a`.`cpi2003` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2003g`,
(((`a`.`Y2004f` / ((`a`.`cpi2004` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2004f` / ((`a`.`cpi2004` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2004g`,
(((`a`.`Y2005f` / ((`a`.`cpi2005` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2005f` / ((`a`.`cpi2005` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2005g`,
(((`a`.`Y2006f` / ((`a`.`cpi2006` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2006f` / ((`a`.`cpi2006` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2006g`,
(((`a`.`Y2007f` / ((`a`.`cpi2007` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2007f` / ((`a`.`cpi2007` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2007g`,
(((`a`.`Y2008f` / ((`a`.`cpi2008` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2008f` / ((`a`.`cpi2008` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2008g`,
(((`a`.`Y2009f` / ((`a`.`cpi2009` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2009f` / ((`a`.`cpi2009` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2009g`,
(((`a`.`Y2010f` / ((`a`.`cpi2010` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2010f` / ((`a`.`cpi2010` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2010g`,
(((`a`.`Y2011f` / ((`a`.`cpi2011` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2011f` / ((`a`.`cpi2011` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2011g`,
(((`a`.`Y2012f` / ((`a`.`cpi2012` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2012f` / ((`a`.`cpi2012` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2012g`,
(((`a`.`Y2013f` / ((`a`.`cpi2013` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2013f` / ((`a`.`cpi2013` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2013g`,
(((`a`.`Y2014f` / ((`a`.`cpi2014` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2014f` / ((`a`.`cpi2014` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2014g`,
(((`a`.`Y2015f` / ((`a`.`cpi2015` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2015f` / ((`a`.`cpi2015` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2015g`,
(((`a`.`Y2016f` / ((`a`.`cpi2016` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2016f` / ((`a`.`cpi2016` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2016g`,
(((`a`.`Y2017f` / ((`a`.`cpi2017` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2017f` / ((`a`.`cpi2017` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2017g`,
(((`a`.`Y2018f` / ((`a`.`cpi2018` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2018f` / ((`a`.`cpi2018` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2018g`,
(((`a`.`Y2019f` / ((`a`.`cpi2019` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2019f` / ((`a`.`cpi2019` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2019g`,
(((`a`.`Y2020f` / ((`a`.`cpi2020` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2020f` / ((`a`.`cpi2020` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2020g`,
(((`a`.`Y2021f` / ((`a`.`cpi2021` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`)))) * (1 - `a`.`transLog`)) + (ln((`a`.`Y2021f` / ((`a`.`cpi2021` * `a`.`cpiFlag`) + (1 * (1 - `a`.`cpiFlag`))))) * `a`.`transLog`)) AS `Y2021g` 

from `DC_a` `a`
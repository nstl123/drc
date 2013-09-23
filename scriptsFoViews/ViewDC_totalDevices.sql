SELECT 
scenarioID, countryID, 200 as deviceID, indicatorID,
sum(Y2005) as Y2005, sum(Y2006) as Y2006, sum(Y2007) as Y2007, sum(Y2008) as Y2008, 
sum(Y2009) as Y2009, sum(Y2010) as Y2010, sum(Y2011) as Y2011, sum(Y2012) as Y2012, 
sum(Y2013) as Y2013, sum(Y2014) as Y2014, sum(Y2015) as Y2015, sum(Y2016) as Y2016, 
sum(Y2017) as Y2017, sum(Y2018) as Y2018, sum(Y2019) as Y2019, sum(Y2020) as Y2020, 
sum(Y2021) as Y2021

FROM `Consulting`.`DC_deviceBaseTable`group by scenarioID, countryID

union

SELECT 
dbt.scenarioID, dbt.countryID, 200 as deviceID1, 202 as indicatorID,
sum(dbt.Y2005)/sd.Y2005 as Y2005, sum(dbt.Y2006)/sd.Y2006 as Y2006, sum(dbt.Y2007)/sd.Y2007 as Y2007,
sum(dbt.Y2008)/sd.Y2008 as Y2008, sum(dbt.Y2009)/sd.Y2009 as Y2009, sum(dbt.Y2010)/sd.Y2010 as Y2010, 
sum(dbt.Y2011)/sd.Y2011 as Y2011, sum(dbt.Y2012)/sd.Y2012 as Y2012, sum(dbt.Y2013)/sd.Y2013 as Y2013,
sum(dbt.Y2014)/sd.Y2014 as Y2014, sum(dbt.Y2015)/sd.Y2015 as Y2015, sum(dbt.Y2016)/sd.Y2016 as Y2016, 
sum(dbt.Y2017)/sd.Y2017 as Y2017, sum(dbt.Y2018)/sd.Y2018 as Y2018, sum(dbt.Y2019)/sd.Y2019 as Y2019, 
sum(dbt.Y2020)/sd.Y2020 as Y2020, sum(dbt.Y2021)/sd.Y2021 as Y2021

FROM `Consulting`.`DC_deviceBaseTable` dbt
JOIN Consulting.DC_scenarioData sd    ON sd.scenarioID = dbt.scenarioID and sd.countryID = dbt.countryID    
where sd.indicatorID = 101
group by dbt.scenarioID, dbt.countryID -- , sd.indicatorID, dbt.indicatorID;
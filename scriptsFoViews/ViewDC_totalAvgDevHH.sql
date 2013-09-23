SELECT 
dbt.scenarioID, dbt.countryID, 200 as deviceID1, dbt.indicatorID,
-- Y2006, y2007

sum(dbt.Y2005)/sd.Y2005 as Y2005, sum(dbt.Y2006)/sd.Y2006 as Y2006, sum(dbt.Y2007)/sd.Y2007 as Y2007,
sum(dbt.Y2008)/sd.Y2008 as Y2008, sum(dbt.Y2009)/sd.Y2009 as Y2009, sum(dbt.Y2010)/sd.Y2010 as Y2010, 
sum(dbt.Y2011)/sd.Y2011 as Y2011, sum(dbt.Y2012)/sd.Y2012 as Y2012, sum(dbt.Y2014)/sd.Y2014 as Y2014, 
sum(dbt.Y2015)/sd.Y2015 as Y2015, sum(dbt.Y2016)/sd.Y2016 as Y2016, sum(dbt.Y2017)/sd.Y2017 as Y2017, 
sum(dbt.Y2018)/sd.Y2018 as Y2018, sum(dbt.Y2019)/sd.Y2019 as Y2019, sum(dbt.Y2020)/sd.Y2020 as Y2020, 
sum(dbt.Y2020)/sd.Y2020 as Y2020, sum(dbt.Y2021)/sd.Y2021 as Y2021FROM `Consulting`.`DC_deviceBaseTable` dbt

JOIN Consulting.DC_scenarioData sd
    ON sd.scenarioID = dbt.scenarioID and sd.countryID = dbt.countryID    
where 
    dbt.scenarioID = 10001 and sd.indicatorID = 101

group by dbt.scenarioID, dbt.countryID -- , sd.indicatorID, dbt.indicatorID;
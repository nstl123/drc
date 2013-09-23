-- TOTAL devices

SELECT 
scenarioID, countryID, 200 as deviceID, indicatorID,
sum(Y2005) as Y2005, sum(Y2006) as Y2006, sum(Y2007) as Y2007, sum(Y2008) as Y2008, 
sum(Y2009) as Y2009, sum(Y2010) as Y2010, sum(Y2011) as Y2011, sum(Y2012) as Y2012, 
sum(Y2014) as Y2014, sum(Y2015) as Y2015, sum(Y2016) as Y2016, sum(Y2017) as Y2017, 
sum(Y2018) as Y2018, sum(Y2019) as Y2019, sum(Y2020) as Y2020, sum(Y2005) as Y2020, 
sum(Y2021) as Y2021, sum(Y2022) as Y2022, sum(Y2023) as Y2023, sum(Y2024) as Y2024, sum(Y2025) as Y2025

FROM `Consulting`.`DC_deviceBaseTable`
group by scenarioID, countryID;
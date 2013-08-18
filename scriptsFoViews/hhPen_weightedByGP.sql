SELECT 
wg.scenarioID, wg.countryID, 213 as indicatorID, wg.deviceID, 0 as typeID, 

wg.Y2002*hhp.Y2002 as Y2002, wg.Y2003*hhp.Y2003 as Y2003, wg.Y2004*hhp.Y2004 as Y2004,
wg.Y2005*hhp.Y2005 as Y2005, wg.Y2006*hhp.Y2006 as Y2006, wg.Y2007*hhp.Y2007 as Y2007, wg.Y2008*hhp.Y2008 as Y2008,
wg.Y2009*hhp.Y2009 as Y2009, wg.Y2010*hhp.Y2010 as Y2010, wg.Y2011*hhp.Y2011 as Y2011, wg.Y2012*hhp.Y2012 as Y2012, 
wg.Y2013*hhp.Y2013 as Y2013, wg.Y2014*hhp.Y2014 as Y2014, wg.Y2015*hhp.Y2015 as Y2015, wg.Y2016*hhp.Y2016 as Y2016, 
wg.Y2017*hhp.Y2017 as Y2017, wg.Y2018*hhp.Y2018 as Y2018, wg.Y2019*hhp.Y2019 as Y2019, wg.Y2020*hhp.Y2020 as Y2020, 
wg.Y2021*hhp.Y2021 as Y2021

FROM Consulting.DC_scenarioData wg
	JOIN Consulting.DC_scenarioData hhp
		ON (wg.scenarioID = hhp.scenarioID and wg.countryID = hhp.countryID and wg.deviceID = hhp.deviceID)

where wg.indicatorID = 205 and hhp.indicatorID = 201 and wg.typeID = 105
-- hh pen multiplied by GP share which is type #105 (contains HA and CB included)



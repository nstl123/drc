SELECT wg.scenarioID, wg.countryID, wg.deviceID, 
            6 AS devbTmID, wg.t06*sls.Y2006 AS inter6, wg.t07*sls.Y2006 AS inter7, wg.t08*sls.Y2006 AS inter8, wg.t09*sls.Y2006 AS inter9, wg.t10*sls.Y2006 AS inter10, wg.t11*sls.Y2006 AS inter11, wg.t12*sls.Y2006 AS inter12, wg.t13*sls.Y2006 AS inter13, wg.t14*sls.Y2006 AS inter14, wg.t15*sls.Y2006 AS inter15, wg.t16*sls.Y2006 AS inter16, wg.t17*sls.Y2006 AS inter17, wg.t18*sls.Y2006 AS inter18, wg.t19*sls.Y2006 AS inter19, wg.t20*sls.Y2006 AS inter20, wg.t21*sls.Y2006 AS inter21
        FROM `Consulting`.`DC_depreciationWeights` wg
        JOIN Consulting.DC_salesWTrendTable sls 
                ON (sls.scenarioID = wg.scenarioID AND sls.countryID = wg.countryID AND sls.deviceID = wg.deviceID) 
 UNION 
SELECT wg.scenarioID, wg.countryID, wg.deviceID, 
            7 AS devbTmID, wg.t06*sls.Y2007 AS inter6, wg.t07*sls.Y2007 AS inter7, wg.t08*sls.Y2007 AS inter8, wg.t09*sls.Y2007 AS inter9, wg.t10*sls.Y2007 AS inter10, wg.t11*sls.Y2007 AS inter11, wg.t12*sls.Y2007 AS inter12, wg.t13*sls.Y2007 AS inter13, wg.t14*sls.Y2007 AS inter14, wg.t15*sls.Y2007 AS inter15, wg.t16*sls.Y2007 AS inter16, wg.t17*sls.Y2007 AS inter17, wg.t18*sls.Y2007 AS inter18, wg.t19*sls.Y2007 AS inter19, wg.t20*sls.Y2007 AS inter20, wg.t21*sls.Y2007 AS inter21
        FROM `Consulting`.`DC_depreciationWeights` wg
        JOIN Consulting.DC_salesWTrendTable sls 
                ON (sls.scenarioID = wg.scenarioID AND sls.countryID = wg.countryID AND sls.deviceID = wg.deviceID) 
 UNION 
SELECT wg.scenarioID, wg.countryID, wg.deviceID, 
            8 AS devbTmID, wg.t06*sls.Y2008 AS inter6, wg.t07*sls.Y2008 AS inter7, wg.t08*sls.Y2008 AS inter8, wg.t09*sls.Y2008 AS inter9, wg.t10*sls.Y2008 AS inter10, wg.t11*sls.Y2008 AS inter11, wg.t12*sls.Y2008 AS inter12, wg.t13*sls.Y2008 AS inter13, wg.t14*sls.Y2008 AS inter14, wg.t15*sls.Y2008 AS inter15, wg.t16*sls.Y2008 AS inter16, wg.t17*sls.Y2008 AS inter17, wg.t18*sls.Y2008 AS inter18, wg.t19*sls.Y2008 AS inter19, wg.t20*sls.Y2008 AS inter20, wg.t21*sls.Y2008 AS inter21
        FROM `Consulting`.`DC_depreciationWeights` wg
        JOIN Consulting.DC_salesWTrendTable sls 
                ON (sls.scenarioID = wg.scenarioID AND sls.countryID = wg.countryID AND sls.deviceID = wg.deviceID) 
 UNION 
SELECT wg.scenarioID, wg.countryID, wg.deviceID, 
            9 AS devbTmID, wg.t06*sls.Y2009 AS inter6, wg.t07*sls.Y2009 AS inter7, wg.t08*sls.Y2009 AS inter8, wg.t09*sls.Y2009 AS inter9, wg.t10*sls.Y2009 AS inter10, wg.t11*sls.Y2009 AS inter11, wg.t12*sls.Y2009 AS inter12, wg.t13*sls.Y2009 AS inter13, wg.t14*sls.Y2009 AS inter14, wg.t15*sls.Y2009 AS inter15, wg.t16*sls.Y2009 AS inter16, wg.t17*sls.Y2009 AS inter17, wg.t18*sls.Y2009 AS inter18, wg.t19*sls.Y2009 AS inter19, wg.t20*sls.Y2009 AS inter20, wg.t21*sls.Y2009 AS inter21
        FROM `Consulting`.`DC_depreciationWeights` wg
        JOIN Consulting.DC_salesWTrendTable sls 
                ON (sls.scenarioID = wg.scenarioID AND sls.countryID = wg.countryID AND sls.deviceID = wg.deviceID) 
 UNION 
SELECT wg.scenarioID, wg.countryID, wg.deviceID, 
            10 AS devbTmID, wg.t06*sls.Y2010 AS inter6, wg.t07*sls.Y2010 AS inter7, wg.t08*sls.Y2010 AS inter8, wg.t09*sls.Y2010 AS inter9, wg.t10*sls.Y2010 AS inter10, wg.t11*sls.Y2010 AS inter11, wg.t12*sls.Y2010 AS inter12, wg.t13*sls.Y2010 AS inter13, wg.t14*sls.Y2010 AS inter14, wg.t15*sls.Y2010 AS inter15, wg.t16*sls.Y2010 AS inter16, wg.t17*sls.Y2010 AS inter17, wg.t18*sls.Y2010 AS inter18, wg.t19*sls.Y2010 AS inter19, wg.t20*sls.Y2010 AS inter20, wg.t21*sls.Y2010 AS inter21
        FROM `Consulting`.`DC_depreciationWeights` wg
        JOIN Consulting.DC_salesWTrendTable sls 
                ON (sls.scenarioID = wg.scenarioID AND sls.countryID = wg.countryID AND sls.deviceID = wg.deviceID) 
 UNION 
SELECT wg.scenarioID, wg.countryID, wg.deviceID, 
            11 AS devbTmID, wg.t06*sls.Y2011 AS inter6, wg.t07*sls.Y2011 AS inter7, wg.t08*sls.Y2011 AS inter8, wg.t09*sls.Y2011 AS inter9, wg.t10*sls.Y2011 AS inter10, wg.t11*sls.Y2011 AS inter11, wg.t12*sls.Y2011 AS inter12, wg.t13*sls.Y2011 AS inter13, wg.t14*sls.Y2011 AS inter14, wg.t15*sls.Y2011 AS inter15, wg.t16*sls.Y2011 AS inter16, wg.t17*sls.Y2011 AS inter17, wg.t18*sls.Y2011 AS inter18, wg.t19*sls.Y2011 AS inter19, wg.t20*sls.Y2011 AS inter20, wg.t21*sls.Y2011 AS inter21
        FROM `Consulting`.`DC_depreciationWeights` wg
        JOIN Consulting.DC_salesWTrendTable sls 
                ON (sls.scenarioID = wg.scenarioID AND sls.countryID = wg.countryID AND sls.deviceID = wg.deviceID) 
 UNION 
SELECT wg.scenarioID, wg.countryID, wg.deviceID, 
            12 AS devbTmID, wg.t06*sls.Y2012 AS inter6, wg.t07*sls.Y2012 AS inter7, wg.t08*sls.Y2012 AS inter8, wg.t09*sls.Y2012 AS inter9, wg.t10*sls.Y2012 AS inter10, wg.t11*sls.Y2012 AS inter11, wg.t12*sls.Y2012 AS inter12, wg.t13*sls.Y2012 AS inter13, wg.t14*sls.Y2012 AS inter14, wg.t15*sls.Y2012 AS inter15, wg.t16*sls.Y2012 AS inter16, wg.t17*sls.Y2012 AS inter17, wg.t18*sls.Y2012 AS inter18, wg.t19*sls.Y2012 AS inter19, wg.t20*sls.Y2012 AS inter20, wg.t21*sls.Y2012 AS inter21
        FROM `Consulting`.`DC_depreciationWeights` wg
        JOIN Consulting.DC_salesWTrendTable sls 
                ON (sls.scenarioID = wg.scenarioID AND sls.countryID = wg.countryID AND sls.deviceID = wg.deviceID) 
 UNION 
SELECT wg.scenarioID, wg.countryID, wg.deviceID, 
            13 AS devbTmID, wg.t06*sls.Y2013 AS inter6, wg.t07*sls.Y2013 AS inter7, wg.t08*sls.Y2013 AS inter8, wg.t09*sls.Y2013 AS inter9, wg.t10*sls.Y2013 AS inter10, wg.t11*sls.Y2013 AS inter11, wg.t12*sls.Y2013 AS inter12, wg.t13*sls.Y2013 AS inter13, wg.t14*sls.Y2013 AS inter14, wg.t15*sls.Y2013 AS inter15, wg.t16*sls.Y2013 AS inter16, wg.t17*sls.Y2013 AS inter17, wg.t18*sls.Y2013 AS inter18, wg.t19*sls.Y2013 AS inter19, wg.t20*sls.Y2013 AS inter20, wg.t21*sls.Y2013 AS inter21
        FROM `Consulting`.`DC_depreciationWeights` wg
        JOIN Consulting.DC_salesWTrendTable sls 
                ON (sls.scenarioID = wg.scenarioID AND sls.countryID = wg.countryID AND sls.deviceID = wg.deviceID) 
 UNION 
SELECT wg.scenarioID, wg.countryID, wg.deviceID, 
            14 AS devbTmID, wg.t06*sls.Y2014 AS inter6, wg.t07*sls.Y2014 AS inter7, wg.t08*sls.Y2014 AS inter8, wg.t09*sls.Y2014 AS inter9, wg.t10*sls.Y2014 AS inter10, wg.t11*sls.Y2014 AS inter11, wg.t12*sls.Y2014 AS inter12, wg.t13*sls.Y2014 AS inter13, wg.t14*sls.Y2014 AS inter14, wg.t15*sls.Y2014 AS inter15, wg.t16*sls.Y2014 AS inter16, wg.t17*sls.Y2014 AS inter17, wg.t18*sls.Y2014 AS inter18, wg.t19*sls.Y2014 AS inter19, wg.t20*sls.Y2014 AS inter20, wg.t21*sls.Y2014 AS inter21
        FROM `Consulting`.`DC_depreciationWeights` wg
        JOIN Consulting.DC_salesWTrendTable sls 
                ON (sls.scenarioID = wg.scenarioID AND sls.countryID = wg.countryID AND sls.deviceID = wg.deviceID) 
 UNION 
SELECT wg.scenarioID, wg.countryID, wg.deviceID, 
            15 AS devbTmID, wg.t06*sls.Y2015 AS inter6, wg.t07*sls.Y2015 AS inter7, wg.t08*sls.Y2015 AS inter8, wg.t09*sls.Y2015 AS inter9, wg.t10*sls.Y2015 AS inter10, wg.t11*sls.Y2015 AS inter11, wg.t12*sls.Y2015 AS inter12, wg.t13*sls.Y2015 AS inter13, wg.t14*sls.Y2015 AS inter14, wg.t15*sls.Y2015 AS inter15, wg.t16*sls.Y2015 AS inter16, wg.t17*sls.Y2015 AS inter17, wg.t18*sls.Y2015 AS inter18, wg.t19*sls.Y2015 AS inter19, wg.t20*sls.Y2015 AS inter20, wg.t21*sls.Y2015 AS inter21
        FROM `Consulting`.`DC_depreciationWeights` wg
        JOIN Consulting.DC_salesWTrendTable sls 
                ON (sls.scenarioID = wg.scenarioID AND sls.countryID = wg.countryID AND sls.deviceID = wg.deviceID) 
 UNION 
SELECT wg.scenarioID, wg.countryID, wg.deviceID, 
            16 AS devbTmID, wg.t06*sls.Y2016 AS inter6, wg.t07*sls.Y2016 AS inter7, wg.t08*sls.Y2016 AS inter8, wg.t09*sls.Y2016 AS inter9, wg.t10*sls.Y2016 AS inter10, wg.t11*sls.Y2016 AS inter11, wg.t12*sls.Y2016 AS inter12, wg.t13*sls.Y2016 AS inter13, wg.t14*sls.Y2016 AS inter14, wg.t15*sls.Y2016 AS inter15, wg.t16*sls.Y2016 AS inter16, wg.t17*sls.Y2016 AS inter17, wg.t18*sls.Y2016 AS inter18, wg.t19*sls.Y2016 AS inter19, wg.t20*sls.Y2016 AS inter20, wg.t21*sls.Y2016 AS inter21
        FROM `Consulting`.`DC_depreciationWeights` wg
        JOIN Consulting.DC_salesWTrendTable sls 
                ON (sls.scenarioID = wg.scenarioID AND sls.countryID = wg.countryID AND sls.deviceID = wg.deviceID) 
 UNION 
SELECT wg.scenarioID, wg.countryID, wg.deviceID, 
            17 AS devbTmID, wg.t06*sls.Y2017 AS inter6, wg.t07*sls.Y2017 AS inter7, wg.t08*sls.Y2017 AS inter8, wg.t09*sls.Y2017 AS inter9, wg.t10*sls.Y2017 AS inter10, wg.t11*sls.Y2017 AS inter11, wg.t12*sls.Y2017 AS inter12, wg.t13*sls.Y2017 AS inter13, wg.t14*sls.Y2017 AS inter14, wg.t15*sls.Y2017 AS inter15, wg.t16*sls.Y2017 AS inter16, wg.t17*sls.Y2017 AS inter17, wg.t18*sls.Y2017 AS inter18, wg.t19*sls.Y2017 AS inter19, wg.t20*sls.Y2017 AS inter20, wg.t21*sls.Y2017 AS inter21
        FROM `Consulting`.`DC_depreciationWeights` wg
        JOIN Consulting.DC_salesWTrendTable sls 
                ON (sls.scenarioID = wg.scenarioID AND sls.countryID = wg.countryID AND sls.deviceID = wg.deviceID) 
 UNION 
SELECT wg.scenarioID, wg.countryID, wg.deviceID, 
            18 AS devbTmID, wg.t06*sls.Y2018 AS inter6, wg.t07*sls.Y2018 AS inter7, wg.t08*sls.Y2018 AS inter8, wg.t09*sls.Y2018 AS inter9, wg.t10*sls.Y2018 AS inter10, wg.t11*sls.Y2018 AS inter11, wg.t12*sls.Y2018 AS inter12, wg.t13*sls.Y2018 AS inter13, wg.t14*sls.Y2018 AS inter14, wg.t15*sls.Y2018 AS inter15, wg.t16*sls.Y2018 AS inter16, wg.t17*sls.Y2018 AS inter17, wg.t18*sls.Y2018 AS inter18, wg.t19*sls.Y2018 AS inter19, wg.t20*sls.Y2018 AS inter20, wg.t21*sls.Y2018 AS inter21
        FROM `Consulting`.`DC_depreciationWeights` wg
        JOIN Consulting.DC_salesWTrendTable sls 
                ON (sls.scenarioID = wg.scenarioID AND sls.countryID = wg.countryID AND sls.deviceID = wg.deviceID) 
 UNION 
SELECT wg.scenarioID, wg.countryID, wg.deviceID, 
            19 AS devbTmID, wg.t06*sls.Y2019 AS inter6, wg.t07*sls.Y2019 AS inter7, wg.t08*sls.Y2019 AS inter8, wg.t09*sls.Y2019 AS inter9, wg.t10*sls.Y2019 AS inter10, wg.t11*sls.Y2019 AS inter11, wg.t12*sls.Y2019 AS inter12, wg.t13*sls.Y2019 AS inter13, wg.t14*sls.Y2019 AS inter14, wg.t15*sls.Y2019 AS inter15, wg.t16*sls.Y2019 AS inter16, wg.t17*sls.Y2019 AS inter17, wg.t18*sls.Y2019 AS inter18, wg.t19*sls.Y2019 AS inter19, wg.t20*sls.Y2019 AS inter20, wg.t21*sls.Y2019 AS inter21
        FROM `Consulting`.`DC_depreciationWeights` wg
        JOIN Consulting.DC_salesWTrendTable sls 
                ON (sls.scenarioID = wg.scenarioID AND sls.countryID = wg.countryID AND sls.deviceID = wg.deviceID) 
 UNION 
SELECT wg.scenarioID, wg.countryID, wg.deviceID, 
            20 AS devbTmID, wg.t06*sls.Y2020 AS inter6, wg.t07*sls.Y2020 AS inter7, wg.t08*sls.Y2020 AS inter8, wg.t09*sls.Y2020 AS inter9, wg.t10*sls.Y2020 AS inter10, wg.t11*sls.Y2020 AS inter11, wg.t12*sls.Y2020 AS inter12, wg.t13*sls.Y2020 AS inter13, wg.t14*sls.Y2020 AS inter14, wg.t15*sls.Y2020 AS inter15, wg.t16*sls.Y2020 AS inter16, wg.t17*sls.Y2020 AS inter17, wg.t18*sls.Y2020 AS inter18, wg.t19*sls.Y2020 AS inter19, wg.t20*sls.Y2020 AS inter20, wg.t21*sls.Y2020 AS inter21
        FROM `Consulting`.`DC_depreciationWeights` wg
        JOIN Consulting.DC_salesWTrendTable sls 
                ON (sls.scenarioID = wg.scenarioID AND sls.countryID = wg.countryID AND sls.deviceID = wg.deviceID) 
 UNION 
SELECT wg.scenarioID, wg.countryID, wg.deviceID, 
            21 AS devbTmID, wg.t06*sls.Y2021 AS inter6, wg.t07*sls.Y2021 AS inter7, wg.t08*sls.Y2021 AS inter8, wg.t09*sls.Y2021 AS inter9, wg.t10*sls.Y2021 AS inter10, wg.t11*sls.Y2021 AS inter11, wg.t12*sls.Y2021 AS inter12, wg.t13*sls.Y2021 AS inter13, wg.t14*sls.Y2021 AS inter14, wg.t15*sls.Y2021 AS inter15, wg.t16*sls.Y2021 AS inter16, wg.t17*sls.Y2021 AS inter17, wg.t18*sls.Y2021 AS inter18, wg.t19*sls.Y2021 AS inter19, wg.t20*sls.Y2021 AS inter20, wg.t21*sls.Y2021 AS inter21
        FROM `Consulting`.`DC_depreciationWeights` wg
        JOIN Consulting.DC_salesWTrendTable sls 
                ON (sls.scenarioID = wg.scenarioID AND sls.countryID = wg.countryID AND sls.deviceID = wg.deviceID)
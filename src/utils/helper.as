package utils
{
	import mx.collections.ArrayCollection;

	public class helper
	{
		public function helper()
		{
		}
		
		public function formShockArray(selectedIndi:int, workingScenarioID:int, yrs:int, 
									   val:Number, rawData:ArrayCollection):ArrayCollection {
			var rez:ArrayCollection = new ArrayCollection();
			var mult:Number = 1 + (val/100);
			
			for (var i:int = 0; i < rawData.length; i++) {
				var fin:Object = rawData.getItemAt(i);
				rez.addItem({
					"scenarioID" : workingScenarioID,
					"countryID"  : fin.countryID, "indicatorID" : selectedIndi, 
					//"Y2000":fin.Y2000,
					//"Y2001":fin.Y2001, "Y2002":fin.Y2002, "Y2003":fin.Y2003,					
					"Y2005": (yrs <= 2005) ? (fin.Y2005 * mult) : fin.Y2005,
					"Y2006": (yrs <= 2006) ? (fin.Y2006 * mult) : fin.Y2006,
					"Y2007": (yrs <= 2007) ? (fin.Y2007 * mult) : fin.Y2007,
					"Y2008": (yrs <= 2008) ? (fin.Y2008 * mult) : fin.Y2008,
					"Y2009": (yrs <= 2009) ? (fin.Y2009 * mult) : fin.Y2009,					
					"Y2010": (yrs <= 2010) ? (fin.Y2010 * mult) : fin.Y2010
					/*, "Y2011":fin.Y2011, "Y2012":fin.Y2012,
					/*"Y2013":fin.Y2013, "Y2014":fin.Y2014, "Y2015":fin.Y2015, "Y2016":fin.Y2016,
					"Y2017":fin.Y2017, "Y2017":fin.Y2017, "Y2018":fin.Y2018, "Y2019":fin.Y2019,
					"Y2020":fin.Y2020, "Y2021":fin.Y2021, "Y2022":fin.Y2022, "Y2023":fin.Y2023,
					"Y2024":fin.Y2024, "Y2025":fin.Y2025*/
				});
			
			};
			return rez;
		}
		
		// split is made on ?isOuptutIndicator
		public function splitIndisArray(data:ArrayCollection, partIn:ArrayCollection, partOut:ArrayCollection):void {
			
			partIn.removeAll();
			partOut.removeAll();
			
			for (var i:uint = 0; i < data.length; i++) {
				var z:Object = data.getItemAt(i);
				if (z.isOutputIndicator == 1) {
					partIn.addItem(z);
				} else {
					partOut.addItem(z);
				}			
			};			
		}
		
		//public var yrs:Array = new Array({"", ""});
		
		public function transformArrCol(data:ArrayCollection):ArrayCollection {
			var z :ArrayCollection = new ArrayCollection();
			var newObj:Object = new Object();
			
			for (var j:int = 0;  j < data.length; j++) {
				var obj:Object = data.getItemAt(j); 
				newObj        = ([	  
					{"id" : 1, "yrs": "y2004", "data" : obj.Y2004, "countryID":obj.countryID, "indicatorID":obj.indicatorID, "scenarioID":obj.scenarioID},
					{"id" : 2, "yrs": "y2005", "data" : obj.Y2005, "countryID":obj.countryID, "indicatorID":obj.indicatorID, "scenarioID":obj.scenarioID},			  		
					{"id" : 3, "yrs": "y2006", "data" : obj.Y2006, "countryID":obj.countryID, "indicatorID":obj.indicatorID, "scenarioID":obj.scenarioID},
					{"id" : 4, "yrs": "y2007", "data" : obj.Y2007, "countryID":obj.countryID, "indicatorID":obj.indicatorID, "scenarioID":obj.scenarioID},
					{"id" : 5, "yrs": "y2008", "data" : obj.Y2008, "countryID":obj.countryID, "indicatorID":obj.indicatorID, "scenarioID":obj.scenarioID},
					{"id" : 6, "yrs": "y2009", "data" : obj.Y2009, "countryID":obj.countryID, "indicatorID":obj.indicatorID, "scenarioID":obj.scenarioID},
					{"id" : 7, "yrs": "y2010", "data" : obj.Y2010, "countryID":obj.countryID, "indicatorID":obj.indicatorID, "scenarioID":obj.scenarioID},
					{"id" : 8, "yrs": "y2011", "data" : obj.Y2011, "countryID":obj.countryID, "indicatorID":obj.indicatorID, "scenarioID":obj.scenarioID},
					{"id" : 9, "yrs": "y2012", "data" : obj.Y2012, "countryID":obj.countryID, "indicatorID":obj.indicatorID, "scenarioID":obj.scenarioID},
					{"id" :10, "yrs": "y2013", "data" : obj.Y2013, "countryID":obj.countryID, "indicatorID":obj.indicatorID, "scenarioID":obj.scenarioID},
					{"id" :11, "yrs": "y2014", "data" : obj.Y2014, "countryID":obj.countryID, "indicatorID":obj.indicatorID, "scenarioID":obj.scenarioID},
					{"id" :12, "yrs": "y2015", "data" : obj.Y2015, "countryID":obj.countryID, "indicatorID":obj.indicatorID, "scenarioID":obj.scenarioID}
				]);			
				z.addItem(newObj);
			}		
			return z;
		}	
		
		public function formStringFromIDs(data:Array):Array {
			var list:Array = new Array();
			for (var i:int = 0; i < data.length; i++) {
				list.push(data[i]['id']);
			};		
			return list;	
		}
		
	}
}
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
					
					"Y2004": (yrs <= 2004) ? (fin.Y2004 * mult) : fin.Y2004,										
					"Y2005": (yrs <= 2005) ? (fin.Y2005 * mult) : fin.Y2005,
					"Y2006": (yrs <= 2006) ? (fin.Y2006 * mult) : fin.Y2006,
					"Y2007": (yrs <= 2007) ? (fin.Y2007 * mult) : fin.Y2007,
					"Y2008": (yrs <= 2008) ? (fin.Y2008 * mult) : fin.Y2008,
					"Y2009": (yrs <= 2009) ? (fin.Y2009 * mult) : fin.Y2009,					
					"Y2010": (yrs <= 2010) ? (fin.Y2010 * mult) : fin.Y2010,					
					"Y2011": (yrs <= 2011) ? (fin.Y2011 * mult) : fin.Y2011,										
					"Y2012": (yrs <= 2012) ? (fin.Y2012 * mult) : fin.Y2012,
					"Y2013": (yrs <= 2013) ? (fin.Y2013 * mult) : fin.Y2013,
					"Y2014": (yrs <= 2014) ? (fin.Y2014 * mult) : fin.Y2014,
					"Y2015": (yrs <= 2015) ? (fin.Y2015 * mult) : fin.Y2015,
					"Y2016": (yrs <= 2016) ? (fin.Y2016 * mult) : fin.Y2016,					
					"Y2017": (yrs <= 2017) ? (fin.Y2017 * mult) : fin.Y2017,										
					"Y2018": (yrs <= 2018) ? (fin.Y2018 * mult) : fin.Y2018,
					"Y2019": (yrs <= 2019) ? (fin.Y2019 * mult) : fin.Y2019,
					"Y2020": (yrs <= 2020) ? (fin.Y2020 * mult) : fin.Y2020,					
					"Y2021": (yrs <= 2021) ? (fin.Y2021 * mult) : fin.Y2021
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
				var yr:int = j + 2004;
				var cntryName:String = obj.namen;
				var indiName:String = obj.indicatorID;
				var scenName:String = obj.scenarioID;
				newObj = ([	  
					{"yrs": 2004, "data" : obj.Y2004, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2005, "data" : obj.Y2005, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName},			  		
					{"yrs": 2006, "data" : obj.Y2006, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2007, "data" : obj.Y2007, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2008, "data" : obj.Y2008, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2009, "data" : obj.Y2009, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2010, "data" : obj.Y2010, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2011, "data" : obj.Y2011, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2012, "data" : obj.Y2012, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2013, "data" : obj.Y2013, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2014, "data" : obj.Y2014, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2015, "data" : obj.Y2015, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2016, "data" : obj.Y2016, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2017, "data" : obj.Y2017, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2018, "data" : obj.Y2018, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2019, "data" : obj.Y2019, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2020, "data" : obj.Y2020, "countryID":cntryName, "indicatorID":indiName, "scenarioID":scenName}					
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
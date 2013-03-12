package utils
{
	import mx.collections.ArrayCollection;

	public class helper
	{
		public function helper()
		{
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
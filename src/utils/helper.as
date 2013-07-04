package utils
{
	import flashx.textLayout.formats.Float;
	
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
					/*"Y2006": (yrs <= 2006) ? (fin.Y2006 * mult) : fin.Y2006,
					"Y2007": (yrs <= 2007) ? (fin.Y2007 * mult) : fin.Y2007,
					"Y2008": (yrs <= 2008) ? (fin.Y2008 * mult) : fin.Y2008,
					"Y2009": (yrs <= 2009) ? (fin.Y2009 * mult) : fin.Y2009,					
					"Y2010": (yrs <= 2010) ? (fin.Y2010 * mult) : fin.Y2010,					
					"Y2011": (yrs <= 2011) ? (fin.Y2011 * mult) : fin.Y2011,*/										
					"Y2012": (yrs <= 2012) ? (fin.Y2012 * mult) : fin.Y2012,
					"Y2013": (yrs <= 2013) ? (fin.Y2013 * mult) : fin.Y2013,
					"Y2014": (yrs <= 2014) ? (fin.Y2014 * mult) : fin.Y2014,
					"Y2015": (yrs <= 2015) ? (fin.Y2015 * mult) : fin.Y2015,
					"Y2016": (yrs <= 2016) ? (fin.Y2016 * mult) : fin.Y2016,					
					"Y2017": (yrs <= 2017) ? (fin.Y2017 * mult) : fin.Y2017,										
					"Y2018": (yrs <= 2018) ? (fin.Y2018 * mult) : fin.Y2018,
					"Y2019": (yrs <= 2019) ? (fin.Y2019 * mult) : fin.Y2019,
					"Y2020": (yrs <= 2020) ? (fin.Y2020 * mult) : fin.Y2020,					
					"Y2021": (yrs <= 2021) ? (fin.Y2021 * mult) : (fin.Y2021 ? fin.Y2021 : 0) 
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
				
		public function transformArrCol(data:ArrayCollection, isLevel:Boolean):ArrayCollection {
			var z :ArrayCollection = new ArrayCollection();
			var newObj:Object = new Object();
			
			for (var j:int = 0;  j < data.length; j++) {
				var obj:Object = data.getItemAt(j);
				var yr:int = j + 2004;
				var cntryName:String = obj.countryName;
				var devName:String = obj.deviceName;
				var cntryCode:String = obj.countryID;
				var indiName:String = obj.indicatorID;
				var scenName:String = obj.scenarioID;
				newObj = ([	  
					{"yrs": 2006, "data" : obj.Y2006, "countryCode":cntryCode, "countryName":cntryName, "deviceName":devName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2007, "data" : obj.Y2007, "countryCode":cntryCode, "countryName":cntryName, "deviceName":devName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2008, "data" : obj.Y2008, "countryCode":cntryCode, "countryName":cntryName, "deviceName":devName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2009, "data" : obj.Y2009, "countryCode":cntryCode, "countryName":cntryName, "deviceName":devName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2010, "data" : obj.Y2010, "countryCode":cntryCode, "countryName":cntryName, "deviceName":devName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2011, "data" : obj.Y2011, "countryCode":cntryCode, "countryName":cntryName, "deviceName":devName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2012, "data" : obj.Y2012, "countryCode":cntryCode, "countryName":cntryName, "deviceName":devName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2013, "data" : obj.Y2013, "countryCode":cntryCode, "countryName":cntryName, "deviceName":devName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2014, "data" : obj.Y2014, "countryCode":cntryCode, "countryName":cntryName, "deviceName":devName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2015, "data" : obj.Y2015, "countryCode":cntryCode, "countryName":cntryName, "deviceName":devName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2016, "data" : obj.Y2016, "countryCode":cntryCode, "countryName":cntryName, "deviceName":devName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2017, "data" : obj.Y2017, "countryCode":cntryCode, "countryName":cntryName, "deviceName":devName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2018, "data" : obj.Y2018, "countryCode":cntryCode, "countryName":cntryName, "deviceName":devName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2019, "data" : obj.Y2019, "countryCode":cntryCode, "countryName":cntryName, "deviceName":devName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2020, "data" : obj.Y2020, "countryCode":cntryCode, "countryName":cntryName, "deviceName":devName, "indicatorID":indiName, "scenarioID":scenName},
					{"yrs": 2021, "data" : obj.Y2021, "countryCode":cntryCode, "countryName":cntryName, "deviceName":devName, "indicatorID":indiName, "scenarioID":scenName},
				]);
				if (!isLevel) {
					for (var jj:int = newObj.length - 1; jj > 0 ; jj--) {
						var f:Object;
						(newObj[jj - 1] != 0) ? f = ((newObj[jj].data/newObj[jj-1].data)- 1)*100: f = null;						
						newObj[jj].data = f;
					};				
					newObj[0].data = null;
				};				
				z.addItem(newObj);
			}			

			return z;
		}	
		
		public function transformGridData(data:ArrayCollection, isLevel:Boolean):ArrayCollection {
			var z:ArrayCollection = new ArrayCollection();
			//make a data copy	
			var newObj:Object = new Object();
			if (!isLevel) {		
				for (var i1:int = 0; i1 < data.length; i1++) {
					newObj = ({
					"countryName"  : data[i1].countryName, "scenarioID" : data[i1].scenarioID, 
					"countryID" : data[i1].countryID, "deviceID": data[i1].deviceID,
					"indicatorID" : data[i1].indicatorID,
					"Y2021" : (data[i1].Y2020 != 0) ? ((data[i1].Y2021/data[i1].Y2020)-1)*100 : null,  				
					"Y2020" : (data[i1].Y2019 != 0) ? ((data[i1].Y2020/data[i1].Y2019)-1)*100 : null,
					"Y2019" : (data[i1].Y2018 != 0) ? ((data[i1].Y2019/data[i1].Y2018)-1)*100 : null,
					"Y2018" : (data[i1].Y2017 != 0) ? ((data[i1].Y2018/data[i1].Y2017)-1)*100 : null,
					"Y2017" : (data[i1].Y2016 != 0) ? ((data[i1].Y2017/data[i1].Y2016)-1)*100 : null,
					"Y2016" : (data[i1].Y2015 != 0) ? ((data[i1].Y2016/data[i1].Y2015)-1)*100 : null,
					"Y2015" : (data[i1].Y2014 != 0) ? ((data[i1].Y2015/data[i1].Y2014)-1)*100 : null,
					"Y2014" : (data[i1].Y2013 != 0) ? ((data[i1].Y2014/data[i1].Y2013)-1)*100 : null,
					"Y2013" : (data[i1].Y2012 != 0) ? ((data[i1].Y2013/data[i1].Y2012)-1)*100 : null,
					"Y2012" : (data[i1].Y2011 != 0) ? ((data[i1].Y2012/data[i1].Y2011)-1)*100 : null,
					"Y2011" : (data[i1].Y2010 != 0) ? ((data[i1].Y2011/data[i1].Y2010)-1)*100 : null,
					"Y2010" : (data[i1].Y2009 != 0) ? ((data[i1].Y2010/data[i1].Y2009)-1)*100 : null,
					"Y2009" : (data[i1].Y2008 != 0) ? ((data[i1].Y2009/data[i1].Y2008)-1)*100 : null,
					"Y2008" : (data[i1].Y2007 != 0) ? ((data[i1].Y2008/data[i1].Y2007)-1)*100 : null,
					"Y2007" : (data[i1].Y2006 != 0) ? ((data[i1].Y2007/data[i1].Y2006)-1)*100 : null,				
					"Y2006" : null
					});
					z.addItem(newObj);
				};				
			} else {
				for (i1 = 0; i1 < data.length; i1++) {
					newObj = ({
						"countryName"  : data[i1].countryName, "scenarioID" : data[i1].scenarioID, 
						"countryID" : data[i1].countryID,  "deviceID": data[i1].deviceID, 
						"deviceName": data[i1].deviceName, "indicatorID" : data[i1].indicatorID, 
						Y2021 : data[i1].Y2021, "Y2020" : data[i1].Y2020, "Y2019" : data[i1].Y2019,
						Y2018 : data[i1].Y2018, "Y2017" : data[i1].Y2017, "Y2016" : data[i1].Y2016,
						Y2015 : data[i1].Y2015, "Y2014" : data[i1].Y2014, "Y2013" : data[i1].Y2013,
						Y2012 : data[i1].Y2012, "Y2011" : data[i1].Y2011, "Y2010" : data[i1].Y2010,
						Y2009 : data[i1].Y2009, "Y2008" : data[i1].Y2008, "Y2007" : data[i1].Y2007,				
						Y2006 : data[i1].Y2006
					});
					z.addItem(newObj);
				};				
			};
			return z;
		}
		
		public function formStringFromIDs(data:Array):Array {
			var list:Array = new Array();		
			if (data) {				
				for (var i:int = 0; i < data.length; i++) {
					list.push(data[i]['id']);
				};		
			};
			return list;	
		}
		
		public function formStringFromIDs2(data:Array):String {
			var list:String = "";
			if (data.length > 0) {				
				list = data[0]['id'];
				for (var i:int = 1; i < data.length; i++) {
					list = list + "," + data[i]['id'];
				};		
			};
			return list;	
		}

		
		
	}
}
package controls
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	public class FlowManager
	{
		private var dataList:ArrayCollection;
		private var scenarioCountryList:ArrayCollection;		
		private var dataListReg:ArrayCollection;
		private var indicatorList:ArrayCollection;		
		
		public var baselineScenarioID:int = 10001;
		
		private var stateSpace:Array = new Array(
			{id:0, label:"initState"},
			{id:1, label:"selectCountry"},
			{id:2, label:"selectBQ"},
			{id:3, label:"provideInputs"},
			{id:4, label:"viewResults"}
		);
		
		public function getBaselineScenarioID() : int {
			return baselineScenarioID;				
		}
		
		private var currentStateSpace:int = 0;		
		private var useCluster:Boolean = false;			
		private var tabList:ArrayCollection = new ArrayCollection();		
		private var countSelf:int = 0; 
			
		//this.selDeviceAggLevel = int(this.splitByDevices.selectedValue);			
		//this.devicesActiveFlag = (this.selDeviceAggLevel > 0);
		
		[bindable] public var selDeviceAggLevel:int;
		[bindable] public var selDemandIndi:int;
		[bindable] public var selDeviceNamen:String;
		
		[bindable] public var devicesActiveFlag:Boolean = false;
		[bindable] public var chemTypesActiveFlag:Boolean = false;		
		[bindable] public var pwrTypesActiveFlag:Boolean = false;
		[bindable] public var batTypesActiveFlag:Boolean = false;		
		
		[bindable] public var selBatType:int = 0;
		[bindable] public var selPwrType:int = 0;
		[bindable] public var selChemType:int = 1;
		[bindable] public var selDevice:int = 1;

		public function getSelectedDemandIndi():int {
			return this.selDemandIndi;
		}
		
		public function setPwrTypesActiveFlag (k:Boolean):void {
			this.pwrTypesActiveFlag = k;
		}		

		public function setBatTypesActiveFlag (k:Boolean):void {
			this.batTypesActiveFlag = k;
		}
		
		public function setChemTypesActiveFlag (k:Boolean):void {
			this.chemTypesActiveFlag = k;
		}
		
		public function setSelDevice (k:int):void {
			this.selDevice = k;
		}		
				
		public function setSelDeviceAggLevel (k:int):void {
			this.selDeviceAggLevel = k;
		}
		
		public function setSelDeviceNamen (k:String):void {
			this.selDeviceNamen = k;			
		}
		
		public function setDevicesActiveFlag (k:Boolean):void {
			this.devicesActiveFlag = k;
		}	
				
		public function setSelBatType(k:int):void {
			this.selBatType = k;
		}
		
		public function setSelPwrType(k:int):void {
			this.selPwrType = k;
		}
		
		public function setSelChemType(k:int):void {
			this.selChemType = k;
		}
	
		public function FlowManager()
		{			
			if (this.countSelf < 1) this.countSelf++
			else Alert.show("cannot call contructor twise!");
		}
		
		[bindable] private var selectedIndicatorsList:ArrayCollection; // = new ArrayCollection();
		public function recordSelectedIndicators(arr:ArrayCollection):void {
			this.selectedIndicatorsList = arr;		
		}

		public function getRecordedSelectedIndicators():ArrayCollection {
			return this.selectedIndicatorsList;		
		}
		
		public function setStateSpacePos(nst:int):void {
			this.currentStateSpace = nst;
		}
		
		public function getStateSpacePos():int {
			return this.currentStateSpace;
		}
		
		public function getStateSpaceName():String {
			return this.stateSpace[this.currentStateSpace].label;
		}
		
		public function setDataList(data:ArrayCollection, regData:ArrayCollection, flag:Boolean):void {
			dataList = data;
			dataListReg = regData;
			useCluster = flag;					
			this.notifyAll();			
		}
		
		public function getScenarioCountryListData():ArrayCollection {
			return this.scenarioCountryList;
		}			
		
		public function saveScenarioCountries():void {
			var found:Boolean;
			var newCntry:Object;
			trace("in saveScenarioCOuntries in FlowManager");
			if (!scenarioCountryList) {		
				scenarioCountryList = new ArrayCollection();
				for (var i:int = 0; i < dataList.length; i++) {
					newCntry = dataList.getItemAt(i);
					scenarioCountryList.addItem(newCntry);
				};
			} else {			
				//only add if cntry not there; cannot remove;
				found = true;
				for (var iOut:int = 0; iOut < dataList.length; iOut++) {
					newCntry = dataList.getItemAt(iOut);
					for (var iIn:int = 0; iIn < scenarioCountryList.length; iIn++) {
						found = (newCntry.id == scenarioCountryList.getItemAt(iIn).id);
						if (found) break;
					};
					if ((!found)||(iIn == scenarioCountryList.length)) scenarioCountryList.addItem(newCntry);
				};
			};
		}		
		
		public function resetScenarioCountries():void {
			if (this.scenarioCountryList) {
				scenarioCountryList.removeAll();
			};
			this.notifyAll();
		}
		
		public function setDataList0(data:ArrayCollection):void {
			dataList = data;			
			this.notifyAll();
		}
		
		public function setUseCluster(flag:Boolean):void {
			useCluster = flag;			
		}
		
		public function getUseCluster():Boolean {
			return useCluster;			
		}
		
		public function getDataList():ArrayCollection {
			return dataList;
		}
		
		public function addTab(A:Object, jk:int):void {			
			tabList.addItem(A);
		}
		
		public function removeLastTab(jk:int):void {
			tabList.removeItemAt(jk);
		}
		
	
		private var tmp:Object;
		public function manageUpdate(className:String):void {
			
			switch(className) {				 
			 	case "tabA2":
					tmp = this.tabList[0].getDataList();					
					break;
				case "tabB3":
					tmp = this.tabList[1].getDataList();
					break;
				case "tabC4":
					tmp = this.tabList[2].getDataList();
					break;
				case "tabD5":
					tmp = this.tabList[2].getDataList();
					break;
				case "tabF51": // bat factors
					tmp = this.tabList[4].getDataList();
					break;			
				case "tabE61": // demand view
					tmp = this.tabList[3].getDataList();
					break;				
			};			
			
			this.setDataList0(tmp[0]["res"]);			
			this.notifyAll();
		}
		
		public function notifyAll():void {
			for (var i:int = 0; i < tabList.length; i++) {				
				tabList[i].setDataList(dataList);							
				if (i == 4) {	// output tab			
					tabList[i].setDataListReg(dataListReg);					
					tabList[i].setUseCluster(useCluster);
				} 
			};		
		}		
		
		public function recordIndicatorNames(arr:ArrayCollection):void {		
			indicatorList = arr;
		}

		public function setIndicatorNamesAll():void {
			for (var i:int = 1; i < tabList.length; i++) {	
				indicatorList.filterFunction = null;
				indicatorList.refresh();
				tabList[i].setIndicatorsList(new ArrayCollection(indicatorList.source.slice()));		 
			};
		}		
		
		[bindable] public var selPath:String = "";
		[bindable] private var pathFlags:Array = new Array(); 
		[bindable] private var activeIndi:int;
		
		public function getPathFlags():Array {
			return this.pathFlags;
		}
		
		public function registerPath(np:String, isStart:int):Array {		
			
			this.selPath = np;
			switch (this.selPath) {
				case "A":						
					//          [A, B, C, D, E, F]
					pathFlags = [1, 0, 0, 0, 0, 0];
					activeIndi = 0;
					break;
				case "B":					
					pathFlags = [0, 1, 0, 0, 0, 0];
					activeIndi = 0;
					break;
				case "D":
					pathFlags = [0, 0, 0, 1, 0, 0];
					activeIndi = 0;
					break;				
				case "E1": //batReplacement
					pathFlags = [0, 0, 0, 0, 0, 1];
					activeIndi = 3;
					break;	
				case "E2": //pwrSplit
					pathFlags = [0, 0, 0, 0, 0, 1];
					activeIndi = 1;
					break;
				default:
					pathFlags = [0, 0, 0, 0, 0, 0];
					break;
			};
			if (isStart > 1) this.enableGrids(this.pathFlags);		
			return pathFlags;
		}
		
		[bindable] private var viewingMode:String = "viewDataOnly"; // default
		public function registerViewingMode(s:String):void {
			this.viewingMode = s;
		};
		
		public function isViewingMode():Boolean {
			return (this.viewingMode == "viewDataOnly");
		};
		
		public function enableGrids(arr:Array):void {			
			if (this.tabList.length > 0) {
				for (var i:int = 0; i < tabList.length; i++) {	
					if (arr[i] == 1) {
						this.tabList[i].enableGrid(true, false);					
						//this.tabList[i].setActiveIndis(this.activeIndi);
					} else {
						this.tabList[i].enableGrid(false, false);
					};
				};
			};		
		}	
		
		public function filterDeviceList(item:Object):Boolean {
			var f:Boolean = false;
			if  ( (selDeviceAggLevel < 2) ) // &&(item.id < 100 ) )
				f = true;
			else 
				if  ( (selDeviceAggLevel == 2)&&(item.id > 100)  )
					f = true;
			return f;
		}	
		
	}
}
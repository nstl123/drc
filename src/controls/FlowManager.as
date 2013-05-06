package controls
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	public class FlowManager
	{
		private static var dataList:ArrayCollection;
		private static var dataListReg:ArrayCollection;
		
		private var useCluster:Boolean = false;		
		
		private var tabList:ArrayCollection = new ArrayCollection();
		
		private var countSelf:int = 0; 
			
		public function FlowManager()
		{			
			if (this.countSelf < 1) this.countSelf++
			else Alert.show("cannot call contructor twise!");
		}
		
		public function setDataList(data:ArrayCollection, regData:ArrayCollection, flag:Boolean):void {
			dataList = data;
			dataListReg = regData;
			useCluster = flag;
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
			//tabList.addItemAt(A, jk);
			tabList.addItem(A);
		}
		
		public function removeLastTab(jk:int):void {
			tabList.removeItemAt(jk);
		}
		
	
		private var tmp:Object;
		public function manageUpdate(className:String):void {
			
			switch(className) {
				// what if pass the openState? 
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
			//this.setOpenItems(tmp[0]["openItems"]);
			this.notifyAll();
		}
		
		public function notifyAll():void {
			for (var i:int; i < tabList.length; i++) {				
				tabList[i].setDataList(dataList);	
				if (i == 4) {	// output tab			
					tabList[i].setDataListReg(dataListReg);					
					tabList[i].setUseCluster(useCluster);
				} 
			};		
		}	
		
		[bindable] public var selPath:String = "";
		[bindable] private var pathFlags:Array = new Array(); 
		[bindable] private var activeIndi:int;
		
		public function registerPath(np:String, isStart:int):Array {		
			
			this.selPath = np;
			switch (this.selPath) {
				case "A1":						
					//          [A, B, C, D, E, F]
					pathFlags = [1, 0, 0, 0, 0, 0];
					activeIndi = 0;
					break;
				case "B1":					
					pathFlags = [0, 1, 0, 0, 0, 0];
					activeIndi = 0;
					break;
				case "B2":					
					pathFlags = [0, 1, 0, 0, 0, 0];
					activeIndi = 1;
					break;
				/*case "C":					
					pathFlags = [0, 0, 1, 0, 0, 1];
					break;*/
				case "D1":
					pathFlags = [0, 0, 0, 1, 0, 0];
					activeIndi = 0;
					break;				
				case "A2":
					pathFlags = [1, 0, 0, 0, 0, 1];
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
				case "E3": //per SPlit
					pathFlags = [0, 0, 0, 0, 0, 1];
					activeIndi = 1;
					break;	
				case "E4": //# of bat
					pathFlags = [0, 0, 0, 0, 0, 1];
					activeIndi = 2;
					break;
				case "E5": // size share
					pathFlags = [0, 0, 0, 0, 0, 1];
					activeIndi = 0;
					break;
				default:
					pathFlags = [0, 0, 0, 0, 0, 0];
					break;
			};
			if (isStart > 1) this.enableGrids(this.pathFlags);		
			return pathFlags;
		}
		
		public function enableGrids(arr:Array):void {
			if (this.tabList.length > 0) {
				for (var i:int = 0; i < arr.length; i++) {	
					if (arr[i] == 1) {
						this.tabList[i].enableGrid(true, false);					
						this.tabList[i].setActiveIndis(this.activeIndi);
					};
				};
			};		
		}	
		
	}
}
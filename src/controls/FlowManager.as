package controls
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	public class FlowManager
	{
		private static var dataList:ArrayCollection = new ArrayCollection();
		private var tabList:ArrayCollection = new ArrayCollection();
		
		private var countSelf:int = 0; 
			
		public function FlowManager()
		{			
			if (this.countSelf < 1) this.countSelf++
			else Alert.show("cannot call contructor twise!");
		}
		
		public function setDataList(data:ArrayCollection):void {
			dataList = data;
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
		
		private var tmp:ArrayCollection;
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
					tmp = this.tabList[3].getDataList();
					break;
				case "tabF51": // bat factors
					tmp = this.tabList[5].getDataList();
					break;			
				case "tabE61": // demand view
					tmp = this.tabList[4].getDataList();
					break;
					
			};			
			
			this.setDataList(tmp);			
			this.notifyAll();
		}
		
		public function notifyAll():void {
			for (var i:int; i < tabList.length; i++) {
				//tabList[i].setDataList(dataList);
				tabList[i].setDataListActive(dataList);
			};		
		}	
		
		[bindable] public var selPath:String = "";
		[bindable] private var pathFlags:Array = new Array(); 
		
		public function registerPath(np:String, isStart:int):Array {		
			
			this.selPath = np;
			switch (this.selPath) {
				case "A1":						
					//          [A, B, C, D, E, F]
					pathFlags = [1, 0, 0, 0, 0, 1];
					break;
				case "B":					
					pathFlags = [0, 1, 0, 0, 0, 1];
					break;
				case "C":					
					pathFlags = [0, 0, 1, 0, 0, 1];
					break;
				case "D":
					pathFlags = [0, 0, 0, 1, 1, 1];
					break;				
				case "A2":
					pathFlags = [1, 0, 0, 0, 0, 1];
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
					this.tabList[i].enableGrid(arr[i] == 1, false);				
				};
			};		
		}	
		
	}
}
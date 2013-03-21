package controls
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	
	public class FlowManager
	{
		private static var dataList:ArrayCollection = new ArrayCollection();
		private var tabList:Array = new Array();
		
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
		
		public function addTab(A:Object):void {
			tabList.push(A);		
		}
		
		public function removeLastTab(A:Object):void {
			tabList.pop();		
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
					tmp = this.tabList[2].getDataList();
					break;
				case "tabE6":
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
	}
}
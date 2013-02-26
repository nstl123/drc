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
	}
}
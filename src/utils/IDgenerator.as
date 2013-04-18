package utils
{
	public class IDgenerator
	{
		public function IDgenerator()
		{
		}
		
		public function generateID():Number {
			var sid:String = '';
			var now:Date = new Date();
			var timePart:Number = now.getTime();
			var randomPart:Number = Math.round(Math.random()*10000);
			var rP:String = String(randomPart);
			var i:Number = rP.length;
			
			if (rP.length < 4) {
				for (i = i; i < 4; i++) {
					rP = "0" + rP;
				}
			}
			
			sid = rP;//String(timePart)+rP;
			
			return Number(sid);
		}
		
		public function generateTimeStamp():String {
			var now:Date = new Date();
			var timePart:String = now.getTime().toString();
			
			return timePart;
		}
	}
}
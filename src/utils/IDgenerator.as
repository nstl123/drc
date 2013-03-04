package utils
{
	public class IDgenerator{
	/*
	** Used to generate SessionIDs and ScenarioIDs
	** ID = String(Unix-style timestamp) + String(4 random digits).
	*/
	
		public static function generateID() :Number {
			var sid:String = '';
			var now:Date = new Date();
			var timePart:Number = now.getTime();
			var randomPart:Number = Math.round(Math.random()*1000);
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
	}
}
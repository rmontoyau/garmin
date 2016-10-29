using Toybox.Application as App;
using Toybox.UserProfile as UserProfile;
using Toybox.System as Sys;
class Utils  {
	var info;
	var user ;
	function initialize(dataInfo) {
		info = dataInfo;
		user =  UserProfile.getProfile();
    }
    //clock time
	function clockTime(){
	 	clockTime = Sys.getClockTime();
     	var hour = clockTime.hour > 12 ? clockTime.hour - 12 : clockTime.hour ;
     	return Lang.format("$1$:$2$", [hour, clockTime.min.format("%02d")]);
	}
	//convert teh speed to km
	function speedConverter(speed){
		var curSpeed = 0;
		if (speed != null){
			curSpeed = (speed * 3.6);
		}
		return curSpeed.toNumber();
	}
	 // convert the milisecons to hour
	function milisecondsToHour(miliseconds){
		 var h = 0;
		 var m = 0;
		 var s = 0;
		if(miliseconds != null) {
			h = miliseconds / (60*60*1000);
	    	miliseconds = miliseconds - h*(60*60*1000);
		    m = miliseconds / (60*1000);
		    miliseconds = miliseconds - m*(60*1000);
		    s = miliseconds / 1000;
		    miliseconds = miliseconds - s*1000;
	    }
	    var hour = h ;
	    var min = m <= 9 ? Lang.format("0$1$", [m]): m;
	    var sec = s <= 9 ? Lang.format("0$1$", [s]): s;
	    return  Lang.format("$1$:$2$:$3$", [hour, min, sec]);
	}
	//
	function getSpeed(){
		return speedConverter(info.currentSpeed);
	}
	//get 
	function getRestingHeartRate(){
		var hearRate = 0;
		if (info.currentHeartRate != null){
			hearRate = ((user.restingHeartRate * info.currentHeartRate)/100).toNumber();
		}
		
		return hearRate;
	}
	// get the BPM 
	function getBPM() {
		var hearRate = 0;
		if (info.currentHeartRate != null){
			hearRate = info.currentHeartRate;
		}
		
		return hearRate;
	}
	
}
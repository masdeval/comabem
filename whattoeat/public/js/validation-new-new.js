var v=true;
var s="fast";
function validateForm(){
    v=true;
    $("#form1 input.RQR").each(function(){
         var _v=true;var m="";
        if(this.value.length<=0){
            m=this.title;_v=false;v=false;
        }
        $(this).removeClass("missing").removeClass("RQR").next().find(".missing").text("");
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);
        }
        });

        return v;
    }



function IsValidTime(timeStr) {
// Checks if time is in HH:MM:SS AM/PM format.
// The seconds and AM/PM are optional.

var timePat = /^(\d{1,2}):(\d{2})(:(\d{2}))?(\s?(AM|am|PM|pm))?$/;

var matchArray = timeStr.match(timePat);
if (matchArray == null) {
//alert("Time is not in a valid format.");
return false;
}
hour = matchArray[1];
minute = matchArray[2];
second = matchArray[4];
ampm = matchArray[6];

if (second=="") { second = null; }
if (ampm=="") { ampm = null }

if (hour < 0  || hour > 23) {
//alert("Hour must be between 1 and 12. (or 0 and 23 for military time)");
return false;
}
/*if (hour <= 12 && ampm == null) {
if (
confirm("Please indicate which time format you are using.  OK = Standard Time, CANCEL = Military Time")) {
alert("You must specify AM or PM.");
return false;
   }
}*/
if  (hour > 12 && ampm != null) {
//alert("You can't specify AM or PM for military time.");
return false;
}
if (minute<0 || minute > 59) {
//alert ("Minute must be between 0 and 59.");
return false;
}
if (second != null && (second < 0 || second > 59)) {
//alert ("Second must be between 0 and 59.");
return false;
}
return true;
}
var v=true;
var s="fast";
function validateForm(){
    v=true;$(".required").trigger("validate");return v;
    }
$(document).ready(function(){
    $(".RQR").addClass("required");
    $("select.slesctone").addClass("required");

    $(".RQR").focus(function(){
                             var x=$(this).addClass("focus").removeClass("missing").next();
                             x.find(".missing").hide().text("");x.find(".tip").fadeIn(s);
    });
     $(".UNRQR").focus(function(){
                             var x=$(this).addClass("focus").removeClass("missing").next();
                             x.find(".missing").hide().text("");x.find(".tip").fadeIn(s);
    });
     $("textarea").focus(function(){
                             var x=$(this).addClass("focus").removeClass("missing").next();
                             x.find(".missing").hide().text("");x.find(".tip").fadeIn(s);
    });
    $(".RQR").blur(function(){
        $(this).removeClass("focus").trigger("validate");
        });

    $("select.slesctone").focus(function(){
        $(this).addClass("focus");}).blur(function(){

         var _v=true;var m="";
        if(this.value.length<=0){
            //alert(this.value)
            m=this.title;_v=false;
        }
        $(this).removeClass("missing").removeClass("RQR").next().find(".missing").text("");
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);v=_v;
        }
        });

        $("select.slesctone").bind("validate",function(){
         var _v=true;var m="";
        if(this.value.length<=0){
            //alert(this.value)
            m=this.title;_v=false;
        }
        $(this).removeClass("missing").removeClass("RQR").next().find(".missing").text("");
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);v=_v;
        }
        });

       $(".RQR").bind("validate",function(){
        var _v=true;var m="";
        if(this.value.length<=0){
            m=this.title;_v=false;
        }
         $(this).removeClass("missing").removeClass("RQR").next().find(".missing").text("");
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);v=_v;
        }
       });


    $("#txtEmail").bind("validate",function(){
        var _v=true;var m="";
        if(this.value.length<=0){
            m=this.title;_v=false;
        }
    $(this).removeClass("missing").removeClass("RQR").next().find(".missing").text("");
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);v=_v;
        }
    });


    $("#txtPhone").bind("validate",function(){
        var _v=true;var m="";
        if(this.value.length<=0){
            m=this.title;_v=false;
        }
        else if(this.value.length>this.maxlength)
        {
            m="Please use less than "+this.maxlength+" characters.";_v=false;
        }
        else if(!this.value.match(/^[0-9\s-\(\)]+$/)){
            m="That phone nuber does not appear to be in a valid format.";_v=false;
        }
        $(this).removeClass("missing").removeClass("RQR").next().find(".missing").text("");
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);v=_v;
        }
    });
    $("#txtNumber").bind("validate",function(){
        var _v=true;var m="";
        if(this.value.length<=0){
            m=this.title;_v=false;
        }
        else if(this.value.length>this.maxlength)
        {
            m="Please use less than "+this.maxlength+" characters.";_v=false;
        }
        else if(!this.value.match(/^[0-9]+$/)){
            m="That is not a valid number.";_v=false;
        }
        $(this).removeClass("missing").removeClass("RQR").next().find(".missing").text("");
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);v=_v;
        }
    });
     $("#txtZip").bind("validate",function(){
        var _v=true;var m="";
        if(this.value.length<=0){
            m=this.title;_v=false;
        }
        else if(this.value.length>this.maxlength)
        {
            m="Please use less than "+this.maxlength+" characters.";_v=false;
        }
        else if(!this.value.match(/^\d{5}$|^\d{5}-\d{4}$/)){
            m="That zip code does  not appear to be in a valid format.";_v=false;
        }
        $(this).removeClass("missing").removeClass("RQR").next().find(".missing").text("");
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);v=_v;
        }
    });
     $(".validTime").bind("validate",function(){
        var _v=true;var m="";
        if(this.value.length<=0){
            m=this.title;_v=false;
        }
        else if(!IsValidTime(this.value))
        {
            m="Por favor, indique o tempo valido";_v=false;
        }

        $(this).removeClass("missing").removeClass("RQR").next().find(".missing").text("");
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);v=_v;
        }
    });

    $("#txtEmail").bind("validate",function(){
        var _v=true;var m="";
        if(this.value.length<=0){
            m=this.title;_v=false;
        }
        else if(this.value.length>this.maxlength)
        {
            m="Please use less than "+this.maxlength+" characters.";_v=false;
        }
        else if(!this.value.match(/^[a-zA-Z0-9'\-_]+(?:[\.][a-zA-Z0-9'\-_]+)*@([a-zA-Z0-9]([-]?[a-zA-Z0-9_])*\.)*[a-zA-Z0-9]([-]?[a-zA-Z0-9]){0,61}[a-zA-Z0-9]{0,1}\.[a-zA-Z]{2,6}(\.[a-zA-Z]{2})?$/)){
            m="That email address does not appear to be in a valid format.";_v=false;
        }
        $(this).removeClass("missing").removeClass("RQR").next().find(".missing").text("");
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);v=_v;
        }
    });


    $("#txtName").bind("validate",function(){
        var _v=true;var m="";
        if(this.value.length<=0)
        {
            m=this.title;_v=false;
        }
        else if(this.value.length>this.maxlength)
        {
            m="Please use less than "+this.maxlength+" characters.";_v=false;
        }
        else if(!this.value.match(/^[a-zA-Z\s]+$/)){
            m="Plese use only letters for name.";_v=false;
        }
        $(this).removeClass("missing").removeClass("RQR").next().find(".missing").text("");
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);v=_v;}

    });


    $("#txtUserName,#txtPass").bind("validate",function(){
        var _v=true;var m="";
        if(this.value.length<=0)
        {
            m=this.title;_v=false;
        }
        else if(this.value.length>this.maxlength)
        {
            m="Please use less than "+this.maxlength+" characters.";_v=false;
        }
        else if(this.value.match(/\s/)){
            m="Sorry, we don't allow spaces. How about \"_\" instead?";_v=false;
        }
        $(this).removeClass("missing").removeClass("RQR").next().find(".missing").text("");
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);v=_v;}
        else if(this.id=="txtUserName"){$(this).trigger("check");}
        if(this.id=="txtPass"&&$("#txtPassConfirm")[0].value.length>0)$("#txtPassConfirm").trigger("validate");
    });
    /*$("#txtUserName").bind("check",function(){
        if($(this).attr("test")==1){async("MyAccount_Join.aspx","CheckUsernameAvailability","{'username':'"+this.value+"'}",function(msg){
                if(msg.d){$("#txtUserName").attr("available",1);}
                else{var x=$("#txtUserName").attr("available",0).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text("Sorry, it looks like that username is already taken.").fadeIn(s);v=false;}
                $("#txtUserName").attr("test",0);
            });
        }
        else if($(this).attr("available")==0){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text("Sorry, it looks like that username is already taken.").fadeIn(s);v=false;}
    });*/
    $("#txtPassConfirm").bind("validate",function(){var _v=true;var m="";
        if(this.value.length<=0){m=this.title;_v=false;}
        else if(this.value.length>this.maxlength){m="Please use less than "+this.maxlength+" characters.";_v=false;}
        else if(this.value.length>0&&this.value!=$("#txtPass")[0].value){m="Passwords don't appear to match.";_v=false;}
        $(this).removeClass("missing").removeClass("RQR").next().find(".missing").text("");
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);v=_v;}
    });
    $("#txtUserName").change(function(){if(this.value.length>0){$(this).attr("test",1);}});


   $("#form1").submit(function(){


		var b=this.req_radio.value;
		if(b !='') {
		var d=new Array();
		d=b.split(',');

		for(var i=0;i<d.length;i++){
		status='N';
		n=d[i];

	   m=this[n];

	  for(j=0;j<m.length;j++){
	  f=m[j];

	  if(f.checked==true){

	  status='Y'
	  }

	  }

	  if(status=='N'){

	  nm=n.replace( /[^a-zA-Z 0-9]+/g,'',"");
	  var id='#req'+nm;

	  $(id).show();

	  }
		}
	   if(status=='N'){
	  return false;
	  }
		}
 });
});


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
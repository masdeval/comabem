var v=true;
var s="fast";
function validateForm(id){
    frmid='#'+id;
    v=true;
    $(frmid+" .RQR").each(function(){
        var _v=true;var m="";
        $(this).focus(function(){
            var x=$(this).addClass("focus").removeClass("missing").next();
            x.find(".missing").hide().text("");x.find(".tip").fadeIn(s);

    });
        if(this.value.length<=0){
            m=this.title;_v=false;v=false;
        }
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);$('#errorFor').show();
        }
    });
    $(frmid+" .validEmail").each(function(){
        var _v=true;var m="";
        if(this.value.length<=0){
           /// m=this.title;_v=false;v=false;
        }
        else if(this.value.length>this.maxlength)
        {
            m="Please use less than "+this.maxlength+" characters.";_v=false;v=false;
        }
        else if(!this.value.match(/^[a-zA-Z0-9'\-_]+(?:[\.][a-zA-Z0-9'\-_]+)*@([a-zA-Z0-9]([-]?[a-zA-Z0-9_])*\.)*[a-zA-Z0-9]([-]?[a-zA-Z0-9]){0,61}[a-zA-Z0-9]{0,1}\.[a-zA-Z]{2,6}(\.[a-zA-Z]{2})?$/)){
            m="That email address does not appear to be in a valid format.";_v=false;v=false;
        }
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);
        }
    });
    $(frmid+" .txtPassConfirm").each(function(){
        var _v=true;var m="";
        if(this.value.length<=0){
           m=this.title;_v=false;v=false;
        }
        else if(this.value.length>this.maxlength)
        {
            m="Please use less than "+this.maxlength+" characters.";_v=false;v=false;
        }
        else if(this.value.length>0&&this.value!=$("#txtPass")[0].value){m="Passwords don't appear to match.";_v=false;v=false;}
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);
        }
    });
    $(frmid+" .validNumber").each(function(){
        var _v=true;var m="";
        if(this.value.length<=0){
           //m=this.title;_v=false;v=false;
        }
        else if(this.value.length>this.maxlength)
        {
            m="Please use less than "+this.maxlength+" characters.";_v=false;v=false;
        }
         else if(!this.value.match(/^[0-9]+$/)){
            m="Por favor entre com um número valido.";_v=false;v=false;
        }
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);
        }
    });
    $(frmid+" .validDecimalNumber").each(function(){
        var _v=true;var m="";
        if(this.value.length<=0){
           //m=this.title;_v=false;v=false;
        }
        else if(this.value.length>this.maxlength)
        {
            m="Please use less than "+this.maxlength+" characters.";_v=false;v=false;
        }
         else if(!this.value.match(/^[0-9\.]+$/)){
            m="Por favor entre com um número valido.";_v=false;v=false;
        }
        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);
        }
    });
    $(frmid+" .validTime").each(function(){
        var _v=true;var m="";
        if(this.value.length<=0){
           //m=this.title;_v=false;v=false;
        }
        else if(!IsValidTime(this.value))
        {
            m="Por favor, indique o tempo valido";_v=false;v=false;
        }

        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);
        }
    });
     $(frmid+" .validAlphaNumeric").each(function(){
        var _v=true;var m="";
        if(this.value.length<=0){
           //m=this.title;_v=false;v=false;
        }
        else if(!this.value.match(/^[a-zA-Z0-9_\s]+$/))
        {
            m="Por favor, digite apenas caracteres alfa numéricos ou _ para url";_v=false;v=false;
        }

        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);
        }
    });


     $(frmid+" .compareDate2").each(function(){
        var _v=true;var m="";
         toDate=this.value;
        var yy=$(this).attr('id');
        var xx=yy.replace('to','');
        var formDate=$('#from'+xx).attr('value');
       // alert(toDate)
        //alert(y)
        if(formDate.length<=0){
           //m=this.title;_v=false;v=false;
        }
        else if(!compareDate(formDate,toDate))
        {
            m="Must be grater than Data Inicial";_v=false;v=false;
        }

        if(!_v){var x=$(this).addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);
        }
    });

     var count=0;
     //checkMax esta na tela de produto e serve para verificar se o numero maximo de adicionais esta sendo respeitado

     $(frmid+" .checkMax").each(function(){
        var _v=true;var m="";

        var maxCount=$('#maxAdicionais').val();
        maxCount=parseInt(maxCount);
        //alert(maxCount)
         toDate=this.value;
        if($(this).is(':checked')){
            count++;
            //alert($(this).next().val())
            if($(this).next().val()=='' || $(this).next().val()=='0'){
               _v=false;v=false;
               m='Please enter value';
               var x=$(this).next().addClass("missing").next();x.find(".tip").hide();x.find(".missing").text(m).fadeIn(s);
              // break;
            }
            if(count>maxCount){
                _v=false;v=false;
                $('#maxError').show();
                count=0;
            }
        }

    });

    //ajaxcheck esta na tela empresa e verifica se uma URL ja existe na base de dados
    /*
    if(v==true){
    $(frmid+" .ajaxcheck").each(function(){
        var _v=true;var m="";v=false;
        empID=$(this).attr('id');
        if(this.value.length<=0){
          document.getElementById(id).submit();
        }
        else
        {
           val=this.value;
           reqURL=base_url+'/estabelecimento/empresa/check-Url/url/'+val+'/id/'+empID;

           $.ajax({
           type: "GET",
           url:reqURL,
           success: function(r) {
           r=jQuery.trim(r);
          // alert(r);
           if(r=='F'){
           var msg='URL ja exist.Please usar outro url';
           $('#spanUrl').html(msg);
           $('#spanUrl').show();

       }
       else{
          document.getElementById(id).submit();
       }
        }
      });
        }



    });


    } */


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

function compareDate(dateFrom,dateTo){
from=new Array();
fromdate=new Array();
from=dateFrom.split('/');
fromdate['dd']=from[0];
fromdate['mm']=from[1];
fromdate['yy']=from[2];

to=new Array();
todate=new Array();
to=dateTo.split('/');
todate['dd']=to[0];
todate['mm']=to[1];
todate['yy']=to[2];
//alert(fromdate['dd'])
//alert(todate['dd'])
if(fromdate['yy']>todate['yy']){

return false;
}
else if((fromdate['yy']==todate['yy']) && (fromdate['mm']>todate['mm']) ){

 return false;
}
else if((fromdate['yy']==todate['yy']) && (fromdate['mm']==todate['mm']) && (fromdate['dd']>=todate['dd'])){
 return false;

}
return true;
}
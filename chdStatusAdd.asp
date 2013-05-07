<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<style type="text/css">





img, div, a, input,label { behavior: url(/clms/Templates/Default/scripts/THPNGFix/iepngfix_v2/iepngfix.htc) }

*{
    font-family:Arial, Sans-Serif;
}
#headerCHDMessage{
    height:2.2em;
    position:relative;
	display:block;
    width:33em;
    bottom:.5em;
    right:.5em;
    text-decoration:none;
    font-family: Tahoma, sans-serif;
}

#headerCHDMessage:hover > #chdMessage{
    text-decoration: underline;
}
a.low {
    background: url("/clms/templates/default/images/low_bg.png") #00adef;
    color: #fff;
}
a.low:hover{
    background: url("/clms/templates/default/images/low_bg_hover.png") #00adef;  
}
a.medium{
    background: url("/clms/templates/default/images/med_bg.png") #f2da1f;
    color: #000;
}
a.medium:hover {
    background: url("/clms/templates/default/images/med_bg_hover.png") #f2da1f;
}
a.high{
    background: url("/clms/templates/default/images/high_bg.png") #fb7373;
    color: #000;
}
a.high:hover {
    background: url("/clms/templates/default/images/high_bg_hover.png") #fb7373;
}
#ticketNumber{
position:absolute;
top:.2em;
left:.5em;
font-size:.6em;
text-decoration: underline;
font-weight:bold;
padding: 0;
margin:0;
color: #420;


}
#chdMessage {
display:block;
color:#000;
padding: .5em;
margin:0;
font-size:.9em;

}
#ticketNumber + span {
position:absolute !important;
bottom:.2em !important;
left:.5em !important;
padding:0 !important;
margin:0;
font-size:.9em;
text-indent: .35em;
}


#chdTitle{
text-transform: uppercase; 
display:block;
width:12em;
text-align:center;
font-size:.7em;
font-weight:bold;
color: #420;
padding:0;
margin:0;
position:absolute;
bottom:1.7em;
right:0;
}
#chdTime{
    display:block;
    width:12em;
    text-align:center;
    padding:0;
    margin:0;
    position:absolute;
    bottom:.4em;
    right:0;
    font-size:.7em;
}

#divChange label span{
   position:absolute;
   bottom: .2em;
   width: 100%;
   text-align: center;
   left: 0;
}
#pageWrap{
width:800px;
margin:auto;
}

#divChange label {
   display:block;
   text-align: center;
   position: relative;
   vertical-align:bottom;
   width: 90px;
   height: 125px;
   background-repeat: no-repeat;
   background-position: right 0%;
   float: left;
   color: #8d9293;
   cursor: pointer;
    font-size:1.5em;
}

#divChange input:checked + label {
   color: #000;
    font-weight:bold;

}
#changeTypeCurrent, #changeTypeNew {
position:relative;
left:-200px;
}
#changeTypeNew + label {
   background-image: url("new_status.png");
}
#changeTypeCurrent + label {
   background-image: url("current_status.png");
}
#divChange input + label {
   background-position: 33% 0%;
}
#divChange input + label:active, #divChange input:checked + label:active {
   background-position: 66% 0% !important;

}

#changeTypeNew:checked + label {
    background-color:#E2F7BA;
}
#divChange input + label:hover {
   background-position: right 0%;
}
#divChange input:checked + label {
   background-position: left 0%;
}

#newMessage{
clear:left;
border:none;
border-bottom: 1px solid #C9DCA6;
background: url(fieldset.gif) left top repeat-x;
padding:0;
margin:0;
display:none;
}

#newMessage h2{
display:none;
}
#chdLevel{
float:right;
background:#efefef;
padding-bottom:.4em;
margin:2em;
border:1px solid #dedede;
}
#chdLevel h3{
text-align:center;
padding:0;
margin:0;
font-size:1.5em;

}
#chdLevel input{
position:absolute;
top:-200px;
left:-200px;
}
#chdLevel label{
position:relative;
display:block;
height:60px;
width:180px;

   background-repeat: no-repeat;
   background-position: right 0%;
cursor:pointer;
}
#chdLevel span{
display:none;
}
#chdLevelLow + label {
   background-image: url("button_low.png");
}
#chdLevelMedium + label {
   background-image: url("button_med.png");
}
#chdLevelHigh + label {
   background-image: url("button_high.png");
}

#chdLevel input + label {
   background-position: 33% 0%;
}
#chdLevel input + label:active, #divChange input:checked + label:active {
   background-position: 66% 0% !important;
}
#chdLevel input + label:hover {
   background-position: right 0%;
}
#chdLevel input:checked + label {
   background-position: left 0%;
}
#newMessage > ul, #statusVer > ul{
margin:0;
padding:0;
}
#newMessage ul > li, #statusVer ul > li{
list-style:none;
padding: 5px;

margin:0;
}
#newMessage ul > li label, #statusVer ul > li label{
color:#333;
font-weight:bold;
display: block;
line-height:1.8;
vertical-align: top;
width:150px;
}
#chdBDesc{
width:33.8em;
}
#statusVer{
clear:left;
width:10em;
font-size:1.4em;

}
#statusVer input{
width:15em;
}
#submit{
width:11.5em;
height:3em;
font-size:1.4em;
}

</style>
<script type="text/javascript" src="/clms/templates/default/scripts/tiny_mce/tiny_mce.js"></script>
<!--[if lt IE 8]>
<script src="/clms/Templates/Default/scripts/IE8.js" type="text/javascript"></script>
<script type="text/javascript" src="/clms/Templates/Default/scripts/THPNGFix/iepngfix_v2/iepngfix_tilebg.js"></script>
<![endif]-->
        <script type="text/javascript">
		<!--
			tinyMCE.init({
				mode : "textareas",
				theme : "advanced",
				plugins : "advlink,save,paste",
				
				theme_advanced_buttons1_add_before : "save,separator",
				theme_advanced_buttons1 : "bold,italic,underline,|,justifyleft,justifycenter,justifyright,justifyfull,|,fontselect,fontsizeselect,forecolor,backcolor",
				theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,bullist,numlist,|,undo,redo,|,link,unlink",
				theme_advanced_buttons3 : "",
				theme_advanced_toolbar_location : "top",
				theme_advanced_toolbar_align : "left",
				inline_styles : true
				
			});
		//-->
		</script>
        <script type="text/javascript" src="/clms/templates/default/scripts/jquery-1.2.6.min.js"></script>
    	<script type="text/javascript">
				$(document).ready(function(){
			   		$("#changeTypeNew").click(function(){
						$("#newMessage").slideDown(300);
					});
					$("#changeTypeCurrent").click(function(){

						$("#newMessage").slideUp(300);
					});
					
 				});

    	</script>

</head>

<body>
<div id="pageWrap">
<!--#include virtual="/clms/inc/chdStatus.asp" -->
    <form action="index.asp" method="post">
        <h1>Update Status Message</h1>
        <div id="divChange">
        	<input type="hidden" name="chdID" id="chdID" value="<%Response.Write(chdID)%>"/>
            <h2>Change the current status?</h2>
            <input type="radio" name="changeType" value="current" id="changeTypeCurrent" />
            <label for="changeTypeCurrent">
                <span>Keep</span>
            </label>
            <input type="radio" name="changeType" value="new" id="changeTypeNew" />
            <label for="changeTypeNew">
                <span>New</span>
            </label>
        </div>
        <fieldset id="newMessage">
            <h2>New Status Message:</h2>
            <div id="chdLevel">
                <h3>Status Level</h3>
                <input type="radio" name="chdLevel" value="low" id="chdLevelLow" />
                <label for="chdLevelLow">
                    <span>Low</span>
                </label>
                <input type="radio" name="chdLevel" value="medium" id="chdLevelMedium" />
                <label for="chdLevelMedium">
                    <span>Medium</span>
                </label>
                <input type="radio" name="chdLevel" value="high" id="chdLevelHigh" />
                <label for="chdLevelHigh">
                    <span>High</span>
                </label>
            </div>
            <ul>
            	<li><label for="chdTicket">Ticket #:</label><input type="text" name="chdTicket" id="chdTicket" /></li>
            	<li><label for="chdBDesc">Brief Description:</label><input type="text" name="chdBDesc" id="chdBDesc" /></li>
            	<li><label for="chdDDesc">Detail Description:</label><textarea rows="10" cols="60" id="chdDDesc" name="chdDDesc"></textarea></li>
            </ul>
        </fieldset>
        <fieldset id="statusVer">
        	<ul>
                <li><label for="chdUserID">User ID:</label><input type="text" name="chdUserID" id="chdUserID" /></li>
                <li><label for="chdPW">Password:</label><input type="password" name="chdPW" id="chdPW" /></li>
            </ul>
        </fieldset>
        <p class="submit"><input type="submit" name="submit" value="Submit" id="submit"/></p>
    </form>
</div>
</body>
</html>

<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<!--[if lt IE 8]>
    <script src="/clms/Templates/Default/scripts/IE8.js" type="text/javascript"></script>
<![endif]-->
<style type="text/css">
#headerCHDMessage{
    height:2.2em;
    position:absolute;
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
    background: url("low_bg.png") #00adef;
    color: #fff;
}
a.low:hover{
    background: url("low_bg_hover.png") #00adef;  
}
a.medium{
    background: url("med_bg.png") #f2da1f;
    color: #000;
}
a.medium:hover {
    background: url("med_bg_hover.png") #f2da1f;
}
a.high{
    background: url("high_bg.png") #fb7373;
    color: #000;
}
a.high:hover {
    background: url("high_bg_hover.png") #fb7373;
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
padding: .5em;
line-height: 2.5em;
vertical-align: middle;
margin:0;
font-size:.9em;
height: 100%;

}
#ticketNumber + #chdMessage {
position:absolute;
line-height: 100%;
bottom:.2em;
left:.5em;
padding:0;
margin:0;
font-size:.9em;
height: auto;

text-indent: .35em;
}

#ticketNumber:not(display) + #chdMessage {
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




</style>
</head>

<body>
<%
	
	Dim statusClass, dPostTime, hPostTime, nPostTime, lastPostTime
	Set objConn = Server.CreateObject("ADODB.Connection")
	objConn.Provider = "Microsoft.Jet.OLEDB.4.0"
	objConn.Open Server.MapPath("/clms/resources/chdStatus.mdb")

	SQLQuery = "SELECT tblStatus.ID, tblStatus.ticket, tblStatus.statusLevel, tblStatus.briefDesc, tblStatus.detailDesc, tblStatus.user, tblStatus.startTD, tblStatus.endTD FROM qryLastStartID INNER JOIN tblStatus ON qryLastStartID.MaxOfstartTD = tblStatus.startTD;"
	'Creating a Record Set Object
	Set objRecordSet = Server.CreateObject("ADODB.Recordset")
	objRecordSet.Open SQLQuery, objConn, 0, 4
		statusClass = LCase(objRecordSet.Fields.Item("statusLevel"))

		Response.Write("<p><a id='headerCHDMessage' class='" & statusClass & "' href='#statusID=" & objRecordSet.Fields.Item("ID") & "'>")
		If objRecordSet.Fields.Item("ticket") <> "" Then
			Response.Write("<span id='ticketNumber'>Ticket# <span>" & objRecordSet.Fields.Item("ticket") & "</span></span>")
		End If
			Response.Write("<span id='chdMessage'>" & objRecordSet.Fields.Item("briefDesc") & "</span>")
			If DateDiff("n", objRecordSet.Fields.Item("startTD"),Now()) > 1439 Then
				lastPostTime = DateDiff("n", objRecordSet.Fields.Item("startTD"),Now()) \ 1440
				
				If DateDiff("n", objRecordSet.Fields.Item("startTD"),Now()) Mod 1440 > 1079 Then
					lastPostTime = lastPostTime & "&frac34;"
				ElseIf DateDiff("n", objRecordSet.Fields.Item("startTD"),Now()) Mod 1440 > 719 Then
					lastPostTime = lastPostTime & "&frac12;"
				ElseIf DateDiff("n", objRecordSet.Fields.Item("startTD"),Now()) Mod 1440 > 359 Then
					lastPostTime = lastPostTime & "&frac14;"
				End If
				
				If lastPostTime = "1" Then
					lastPostTime = "(Updated " & lastPostTime & " day ago)"
				Else
					lastPostTime = "(Updated " & lastPostTime & " days ago)"
				End If
			ElseIf DateDiff("n", objRecordSet.Fields.Item("startTD"),Now()) > 59 Then
				lastPostTime = DateDiff("n", objRecordSet.Fields.Item("startTD"),Now()) \ 60
				
				If DateDiff("n", objRecordSet.Fields.Item("startTD"),Now()) Mod 60 > 44 Then
					lastPostTime = lastPostTime & "&frac34;"
				ElseIf DateDiff("n", objRecordSet.Fields.Item("startTD"),Now()) Mod 60 > 29 Then
					lastPostTime = lastPostTime & "&frac12;"
				ElseIf DateDiff("n", objRecordSet.Fields.Item("startTD"),Now()) Mod 60 > 14 Then
					lastPostTime = lastPostTime & "&frac14;"
				End If
				
				If lastPostTime = "1" Then
					lastPostTime = "(Updated " & lastPostTime & " hour ago)"
				Else
					lastPostTime = "(Updated " & lastPostTime & " hours ago)"
				End If
			Else
				lastPostTime = DateDiff("n", objRecordSet.Fields.Item("startTD"),Now())
				
				If lastPostTime = "1" Then
					lastPostTime = "(Updated " & lastPostTime & " minute ago)"
				Else
					lastPostTime = "(Updated " & lastPostTime & " minutes ago)"
				End If
			End If
		Response.Write("<span id='chdTitle'>System Status</span>")
		Response.Write("<span id='chdTime'>" & lastPostTime & "</span>")
		Response.Write("</a></p>")
	objRecordSet.Close
	objConn.Close
%>
</body>
</html>

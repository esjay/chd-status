<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>View CHD Status</title>
<style type="text/css">




	#chdFullStatus{
width:500px;
margin:auto;
}
#CHDTitle{
text-align:center;
padding:0;
margin:0;
display:block;
font-size:1em;
width:100%;
		}
.high #CHDTitle{
background:#FB7373 url(/clms/templates/default/images/high_bg_hover.png) repeat scroll 0 0;
}
.medium #CHDTitle{
background:#F2DA1F url(/clms/templates/default/images/med_bg_hover.png) repeat scroll 0 0;
}
.low #CHDTitle{
background:#00ADEF url(/clms/templates/default/images/low_bg_hover.png) repeat scroll 0 0;
}
#chdFullStatus ul{
width:100%;
padding:0;
list-style:none;
margin:0;
display:block;
}
#chdFullStatus.high ul{
background-color:#FFECEC;
}
#chdFullStatus.medium ul{
background-color:#FCF5C7;
}
#chdFullStatus.low ul{
background-color:#D9F4FF;
}
#chdFullStatus ul li{
padding:.1em 1em;
}
.infoLabel{
font-weight:bold;
padding-right:1em;
}
.low #statusFooter{
background-color:#00ADEF;
}
.medium #statusFooter{
background-color:#F2DA1F;
}
.high #statusFooter{
background-color:#FB7373;
}
#statusFooter{
text-align:center;
width:100%;
display:block;
padding:0;
margin:0;
}



</style>
</head>

<body>
<%
	
	Dim statusClass, dPostTime, hPostTime, nPostTime, lastPostTime, tempID
	Set objConn = Server.CreateObject("ADODB.Connection")
	objConn.Provider = "Microsoft.Jet.OLEDB.4.0"
	objConn.Open Server.MapPath("/clms/resources/chdStatus.mdb")
	Set objRecordSet = Server.CreateObject("ADODB.Recordset")
	If Request.Form("chdUserID") <> "" Then
		SQLQuery = "SELECT password FROM tblUser WHERE userID ='" & Request.Form("chdUserID") & "';"
		objRecordSet.Open SQLQuery, objConn, 0,4
		If objRecordSet.EOF <> True Then tempPW = objRecordSet.Fields.Item("password")
		objRecordSet.Close
		If tempPW = Request.Form("chdPW") Then
			If Request.Form("changeType") = "current" Then
				SQLQuery = "SELECT tblStatus.ID FROM qryLastStartID INNER JOIN tblStatus ON qryLastStartID.MaxOfstartTD = tblStatus.startTD;"
				objRecordSet.Open SQLQuery, objConn, 0, 4
				tempID = objRecordset.Fields.Item("ID")
				objRecordSet.Close
				SQLQuery = "UPDATE tblStatus SET startTD = '" & Now() & "' WHERE ID = " & tempID & ";"
				objRecordSet.Open SQLQuery, objConn, 0, 4
			ElseIf Request.Form("changeType") = "new" Then
				SQLQuery = "SELECT * FROM tblStatus WHERE 0=1;"
				objRecordset.Open SQLQuery, objConn, 1, 2, "&H0001"
				objRecordset.AddNew
					objRecordset.Fields.Item("statusLevel") = Request.Form("chdLevel")
					objRecordset.Fields.Item("ticket") = Request.Form("chdTicket")
					objRecordset.Fields.Item("briefDesc") = Request.Form("chdBDesc")
					objRecordset.Fields.Item("detailDesc") = Request.Form("chdDDesc")
					objRecordset.Fields.Item("user") = Request.Form("chdUserID")
					objRecordset.Fields.Item("startTD") = Now()
		
				objRecordset.Update
				objRecordset.Close
			End If
		Else
			Response.Write("<p>Invalid UserID/Password</p>")
		End IF
	End If
	SQLQuery = "SELECT tblStatus.ID, tblStatus.ticket, tblStatus.statusLevel, tblStatus.briefDesc, tblStatus.detailDesc, tblStatus.user, tblStatus.startTD, tblStatus.endTD FROM qryLastStartID INNER JOIN tblStatus ON qryLastStartID.MaxOfstartTD = tblStatus.startTD;"
	'Creating a Record Set Object
	objRecordSet.Open SQLQuery, objConn, 0, 4
	
		statusLevel = objRecordSet.Fields.Item("statusLevel")
		ticketNum = objRecordSet.Fields.Item("ticket")
		bDesc = objRecordSet.Fields.Item("briefDesc")
		dDesc = objRecordSet.Fields.Item("detailDesc")
		author = objRecordSet.Fields.Item("user")
		dateTime = objRecordSet.Fields.Item("startTD")
	Response.Write("<div id='chdFullStatus' class='" & statusLevel & "'>")	
	Response.Write("<h1 id='CHDTitle'>Claims Help Desk Status</h1>")
	Response.Write("<ul>")
	If ticketNum <> "" Then
		Response.Write("<li id='ticketNum'><span class='infoLabel'>Ticket Number:</span>" & ticketNum & "</li>")
	End If
	Response.Write("<li id='bDesc'>" & bDesc & "</li>")
	If dDesc <> "" Then 
		Response.Write("<li id='dDesc'><span class='infoLabel'>Detailed Description:</span>" & dDesc & "</li>")
	End If
	Response.Write("</ul>")
	Response.Write("<p id='statusFooter'>Updated By: " & author & " @ " & dateTime & " EST</p>")
	Response.Write("</div>")
	
	
	objRecordSet.Close
	objConn.Close
%>
</body>
</html>
<%
  Public Function sqlencode(sText)
  	If IsNumeric(sText) Then
		sqlencode = sText
	Else
		sqlencode = Replace(sText,"'","''") 
	End If
    
  End Function 
   
  Public Function SqlEncodeWNull(sText) 
    If IsNull(sText) Then 
      SqlEncodeWNull = "NULL" 
    ElseIf sText = "" Then 
      SqlEncodeWNull = "NULL" 
    Else 
      SqlEncodeWNull = sqlencode(sText) 
    End If 
  End Function 
%>
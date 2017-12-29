<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search for Bill here</title>
<SCRIPT>
function validate(){
	var billn = document.forms[0].billnum.value;
	if (billn==""){
		alert("Please enter a valid Bill Number");
		document.forms[0].billnum.focus();
		return false;
	}
	
}

function loading()
{
	document.forms[0].billnum.focus();
}
</SCRIPT>
<Style>
.textstyle{
	width:200px;
	height:20px;
	vertical-align:center;
	border:1px #000000 solid;
	background-color:#404040;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:13px;
}	
.textstyle2{
	width:180px;
	height:21px;
	vertical-align:center;
	border:0px #000000 solid;
	background-color:#404040;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:13px;
}	
.labelstyle{
	width:100px;
	text-align: left;
	vertical-align:center;
	height:21px;
	border:0px #000000 solid;
	background-color:#0D3468;
	color:#FFFF00;
	font-family:Verdana;
	font-size:13px;
	

}
.labelstyle2{
	width:600px;
	text-align: right;
	vertical-align:center;
	height:30px;
	border:0px #000000 solid;
	background-color:#0D3468;
	color:#FFFF00;
	font-family:Verdana;
	font-size:13px;
	

}
.labelstyle3{
	width:100px;
	text-align: left;
	vertical-align:center;
	height:30px;
	border:0px #000000 solid;
	background-color:##134b98;
	color:#FFFF00;
	font-family:Verdana;
	font-size:13px;
	

}
.tablebodystyle{
	border:1px #134b98 solid;
	background-color:#0D3468;
}

.btn { 
      width:94px;
	  height:25px;
	  color:#FFFFFF; 
	  font: bold 84% 'Arial Bold',helvetica,sans-serif; 
	  font-size:13px;
	  background-color:#404040; 
	  border:1px solid; 
	  border-color: #FFFFFF; 
	} 
	
.btnplus { 
      width:20px;
	  height:20px;
	  color:#FFFFFF; 
	  font: bold 84% 'Arial Bold',helvetica,sans-serif; 
	  font-size:13px;
	  background-color:#404040; 
	  border:1px solid; 
	  border-color: #FFFFFF; 
	} 
	
</Style>

</head>
<body bgcolor="#134b98" TOPMARGIN='0' LEFTMARGIN='0' onload="loading()">

<form  method="post" action="/LMS/searchbn.do" target="updateframe" onsubmit="return validate()">
	<Table border="0">
	 <TR>	 	
	 	<TD class="labelstyle3"  align="left">
	 		Bill Number
	 	</TD>
	 	<TD align="left" >
	 		<input type="text" name="billnum" class="textstyle2" tabindex=1/>
	 	</TD>
	 	<TD align="left" >
	 		<input type="submit" value="Search" class="btn" tabindex=2/>
	 	</TD>
	</TR>
	 </Table>
	 
	 </form>
</body>
</html>
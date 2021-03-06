<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Bill</title>
<Script>
function validate(){
	var billn = document.forms[0].billnum.value;
	var custn = document.forms[0].customername.value;
	var billd = document.forms[0].billdate.value;
	
	if ((billn=="")&&(custn=="")&&(billd=="")){
		alert("Please enter a valid search criteria");
		document.forms[0].billnum.focus();
		return false;
	}
}

function loading()
{
	document.forms[0].billnum.focus();
}

</Script>
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
	width:100px;
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
	width:120px;
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
	
.selectstylesmall{
	width:50px;
	height:21px;
	vertical-align:center;
	border:0px #000000 solid;
	background-color:#404040;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:13px;
} 
	
</Style>
</head>
	<body bgcolor="#134b98" TOPMARGIN='0' LEFTMARGIN='0' onload="loading()">
		<form action="/LMS/search.do" method="post" target="searchresultframe" onsubmit="return validate()">
			<table width="1000">
				<tr>
					<td class="labelstyle3"  align="right">
						Bill Number:
					</td>
					<td align="left">
						<input type="text" name="billnum" class="textstyle2" tabindex=1/>
					</td>
					<td class="labelstyle3" align="right"> 
						 Customer Name:
					</td>
					<td align="left">
						<input type="text" name="customername" class="textstyle2" tabindex=2/>
					</td>
					<td class="labelstyle3" align="right">
						Bill Date(dd-mm-yyyy):
					</td>
					<td align="left">
						<input type="text" name="billdate" class="textstyle2" tabindex=3/>
					</td>
					<td class="labelstyle3"  align="right">
						Home Deliv.:
					</td>
					<td   align="left">
						<select class="selectstylesmall"  name="homedeli">
						<option value=""></option>
						<option value="Y">Yes</option>
						<option value="N">No</option>
						</select>
					</td>
					<td align="right">
					<input type="submit" value="Search Bills" class="btn" tabindex=4/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.lms.app.vo.AdminUpdateMultiBillsCriteriaVo,java.util.StringTokenizer,com.lms.app.vo.LoginVo"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin - Paid Date Search Criteria</title>
<script src="js/commonFunctions.js" type="text/javascript"></script>
<script 
language="javascript" >
<%!
String strServiceTypeMaster = null;
%>
<%
strServiceTypeMaster = (String)session.getAttribute("servicetypemasterlist");
System.out.println("strServiceTypeMaster of report-->"+strServiceTypeMaster);
%>

///////////////////////
// Declaring valid date character, minimum year and maximum year
var dtCh= "-";
var minYear=1900;
var maxYear=2100;

function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

function stripCharsInBag(s, bag){
	var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function daysInFebruary (year){
	// February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   } 
   return this
}

function activatebillnum(){
	
	
}

function isDate(dtStr){
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strDay=dtStr.substring(0,pos1)
	var strMonth=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("The date format should be : dd-mm-yyyy")
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Please enter a valid month")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Please enter a valid day")
		return false
	}
	if (strYear.length != 4 || year==0 || year<minYear || year>maxYear){
		alert("Please enter a valid 4 digit year between "+minYear+" and "+maxYear)
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Please enter a valid date");
		return false
	}
return true
}

///////////////////////

function validate(){
	var frombilldate = document.forms[0].frombilldate.value;
	var tobilldate = document.forms[0].tobilldate.value;
	var frombillnum = document.forms[0].frombillnum.value;
	var tobillnum = document.forms[0].tobillnum.value;
	var paystatus = document.forms[0].paystatus.value;
	var billlist = document.forms[0].billlist.value;
	if ((billlist=="")&&(tobillnum=="")&&(frombilldate=="")&&(tobilldate=="")&&(paystatus==""))
	{
		alert("Please enter a valid search criteria");
		document.forms[0].frombilldate.focus();
		return false;
	}
	if(frombilldate!="" || tobilldate!="")
	{
	if (isDate(frombilldate)==false){
		alert("Please enter a valid From bill date");
		document.forms[0].frombilldate.focus();
		return false
	}
		
	if (isDate(tobilldate)==false){
		alert("Please enter a valid To bill Date");
		document.forms[0].tobilldate.focus();
		return false
	}
	
	if(new Date(frombilldate)> new Date(tobilldate))
	{
		alert("From Bill Date cannot be greater than To Bill Date");
		return false;	
	}
	}
	
	if(frombillnum!="" || tobillnum!="")
	{
	if (frombillnum==""){
		alert("Please enter a valid From Bill Number");
		document.forms[0].frombillnum.focus();
		return false
	}
		
	if (tobillnum==""){
		alert("Please enter a valid To Bill Number");
		document.forms[0].tobillnum.focus();
		return false
	}
	}
	
	
}
function loading()
{
	document.forms[0].frombilldate.focus();
}

function activatebillnum(){
	if(document.forms[0].billnumselection[0].checked){
		document.forms[0].billlist.readOnly=false;
		document.forms[0].frombillnum.value="";
		document.forms[0].tobillnum.value ="";
		document.forms[0].frombillnum.readOnly=true;
		document.forms[0].tobillnum.readOnly =true;
	}
	else{
		document.forms[0].billlist.readOnly=true;
		document.forms[0].billlist.value="";
		document.forms[0].frombillnum.readOnly=false;
		document.forms[0].tobillnum.readOnly=false;
	}
}


</script>
<Style>
.textstyle{
	width:200px;
	height:21px;
	vertical-align:center;
	border:1px #000000 solid;
	background-color:#404040;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:13px;
}	
.textstyle2{
	width:150px;
	height:18px;
	vertical-align:center;
	border:0px #000000 solid;
	background-color:#404040;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:13px;
}	
.textstyle3{
	width:75px;
	height:18px;
	vertical-align:center;
	border:0px #000000 solid;
	background-color:#404040;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:13px;
}
.textstylelong{
	width:600px;
	height:21px;
	vertical-align:center;
	border:1px #000000 solid;
	background-color:#404040;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:13px;
}	
.selectstyle2{
	width:175px;
	height:21px;
	vertical-align:center;
	border:0px #000000 solid;
	background-color:#404040;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:13px;
}	
.labelstyle{
	width:50px;
	text-align: left;
	vertical-align:center;
	height:18px;
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
	width:150px;
	text-align: left;
	vertical-align:center;
	height:18px;
	border:0px #000000 solid;
	background-color:#0D3468;
	color:#FFFF00;
	font-family:Verdana;
	font-size:13px;
	

}
.labelstyle3sp{
	width:150px;
	text-align: left;
	vertical-align:center;
	height:18px;
	border:0px #000000 solid;
	background-color:#0D3468;
	color:#FFFF00;
	font-family:Verdana;
	font-size:10px;
	

}
.labelstyle4{
	width:100px;
	text-align: left;
	vertical-align:center;
	height:30px;
	border:0px #000000 solid;
	background-color:#0D3468;
	color:#FFFF00;
	font-family:Verdana;
	font-size:13px;
	

}
.tablebodystyle{
	border:1px #134b98 solid;
	background-color:#0D3468;
}

.btn { 
      width:120px;
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
.labelstyle5{
	width:500px;
	text-align: left;
	vertical-align:center;
	height:30px;
	border:0px #000000 solid;
	background-color:#134b98;
	color:#FFFF00;
	font-family:Verdana;
	font-size:13px;
}
.resultstyle2{
	width: 500px;
	border:0px #000000 solid;
	background-color:#134b98;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:13px;	
}
	
</Style>
</head>
<body bgcolor="#134b98" bgcolor="#134b98" TOPMARGIN='0' LEFTMARGIN='0' onload="loading()">
<%
LoginVo logindtls = (LoginVo)session.getAttribute("user"); 
if (!"Administrator".equalsIgnoreCase(logindtls.getRolename())){
%>
<CENTER><FONT COLOR="RED">YOU ARE NOT AUTHORIZED TO VIEW THIS PAGE.</FONT></CENTER>
<%return;} %>
<form action="/LMS/admin_update_bill.do" method="post" target="resultframe" onsubmit="return validate()">
			<table>
				<tr>
					<td class="labelstyle3" align="right"> 
						 Bill Date(dd-mm-yyyy)
					</td>
					<td class="labelstyle" align="right"> 
						 From:
					</td>
					<td align="left">
						<input type="text" name="frombilldate" class="textstyle"/>
					</td>
					<td class="labelstyle" align="right">
						To:
					</td>
					<td align="left">
						<input type="text" name="tobilldate" class="textstyle"/>
					</td>
				</tr>
				<tr>
				    <td class="labelstyle3" align="right"> 
				    	<input type="radio" name="billnumselection" onclick="activatebillnum()"/>List of Bill number
					</td>
					<td align="left" colspan="4">
						<input type="text" name="billlist" class="textstylelong" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td class="labelstyle3" align="right"> 
				    	<input type="radio" name="billnumselection" onclick="activatebillnum()"/>Bill Number
					</td>
					<td class="labelstyle" align="right"> 
						 From:
					</td>
					<td align="left">
						<input type="text" name="frombillnum" class="textstyle" readonly="readonly"/>
					</td>
					<td class="labelstyle" align="right">
						To:
					</td>
					<td align="left">
						<input type="text" name="tobillnum" class="textstyle" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td class="labelstyle3" align="right"> 
						 Payment Status:
					</td>
					<td align="left">
						<select name="paystatus" id="paystatus" class="selectstyle2">
							<option value="">Select Payment Status</option>
							<option value='Y'>Paid</option>
							<option value='N'>UnPaid</option>
						</select>
					</td>
				</tr>
			</table>
			<table border="0" width="675px">				
				<tr>	
					<td align="right"> 
					<input type="submit" value="Submit" class="btn" />
					
					</td>
				</tr>
			</table>
		</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.lms.app.vo.ReportResultsVo,java.util.ArrayList,com.lms.app.util.LMSUtility"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="application/vnd.ms-excel; charset=ISO-8859-1">
<title>Admin Paid Date Results</title>

<script language="JavaScript">

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
   return this;
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


function updatePaidDt(cnt)
{
	var chkbox = document.getElementById('updatechk'+cnt);
	//alert(chkbox);
	var paiddate =document.getElementById('paiddate'+cnt);
	if(chkbox.checked==true)
	{
		
		if(paiddate.value=="Not-Paid")
		paiddate.value="";
		else
			alert("Please be aware!!!!!! You are changing a paid bill.");
		paiddate.disabled = false;
	}
	else
	{
		if((paiddate.value==""))
			paiddate.value="Not-Paid";
		paiddate.disabled = true;
	}			
}

function applyDate(){
	//alert("");
	var newDate = document.getElementById("globaldate");
	if(!isDate(newDate.value)){
		return;
	}
	//alert(newDate.value);
	var tcnt = document.getElementById("totalcount");
	//alert(tcnt.value);
	var cntValue=tcnt.value;
	var oneChk = false;
	for (var i=1; i<cntValue;i++){
		//alert(i);
		var chkbox = document.getElementById('updatechk'+i);
		if(chkbox.checked==true)
		{
			oneChk = true;
			var paiddate =document.getElementById('paiddate'+i);
			paiddate.value=newDate.value;
		}
	}
	if (oneChk==false){
		alert("Select bills to update date");
	}
	
}


function isIE() // Function to Determine IE or Not
{
 return /msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent);
}

function validate() //to validate date format of all checked bills
{
	var tcnt = document.getElementById("totalcount");
	var cntValue=tcnt.value;
	var oneChk = false;
	for (var i=1; i<cntValue;i++){
		var chkbox = document.getElementById('updatechk'+i);
		if(chkbox.checked==true)
		{
			oneChk = true;
			var paiddate =document.getElementById('paiddate'+i);
			if(isDate(paiddate.value)){
				continue;
			}
			else{
				alert("Wrong paid date entered for Bill No: "+chkbox.value);
				return false;
			}
		}
	}
	if (oneChk==false){
		alert("Select bills to update date");
		return false;
	}
	return document.forms[0].submit();
} 






</SCRIPT>
<Style>
.disabledtextstyle{
	width:30px;
	height:15px;
	vertical-align:center;
	border:0px #000000 solid;
	background-color:#404040;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:9px;
}	
.textstyle{
	width:30px;
	height:15px;
	vertical-align:center;
	border:0px #000000 solid;
	background-color:#404040;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:9px;
}	
.textstyle2{
	width:40px;
	height:21px;
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
	background-color:#FFFFFF;
	color:#000000;
	font-family:Verdana;
	font-size:13px;
}	

.labelstyle{
	width:100px;
	text-align: left;
	vertical-align:center;
	height:50px;
	border:0px #000000 solid;
	background-color:#0D3468;
	color:#FFFF00;
	font-family:Verdana;
	font-size:13px;
}
.resultstyle{
	width: 70px;
	text-align: left;
	vertical-align:center;
	border:1px #000000 solid;
	background-color:#0D3468;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:9px;
}
.resultstyle2{
	width: 150px;
	text-align: left;
	vertical-align:center;
	border:1px #000000 solid;
	background-color:#0D3468;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:9px;
}
.errorstyle{
	width:800px;
	text-align: center;
	vertical-align:center;
	height:30px;
	border:0px #000000 solid;
	background-color:#0D3468;
	color:#FE0000;
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
<body bgcolor="#134b98" TOPMARGIN='0' LEFTMARGIN='0'>
<form action="/LMS/admin_update_paid_date.do" method="post" target="_top">

    <TABLE>
    	<TR>
    	<TD>
		<div style="overflow:auto; height:200px; width:720px;" class="tablebodystyle">
		<Table id="billdetails" border="1" width="96%">
			<TR>
		        <TD NOWRAP class="textstyle">
		        	Select
		        </TD>
		        <TD NOWRAP class="textstyle">
		        	Bill Date
		        </TD>
		        <TD class="textstyle">
		        	Bill Number
		        </TD>
		        <TD  class="textstyle"> 
		        	Customer Name
		        </TD>
		        <TD  class="textstyle">
		        	Bill Description
		        </TD>
		        <TD  class="textstyle">
		        	Total Count
		        </TD>
		        <TD  class="textstyle">
		        	Total Bill Amount
		        </TD>
		        <TD  class="textstyle">
		        	Bill Paid Amount
		        </TD>
		        <TD  class="textstyle">
		        	Bill Paid Date
		        </TD>
	        </TR>
	        <%! ArrayList<ReportResultsVo> searchResults = new ArrayList<ReportResultsVo>();
			%>
	        <%
	        searchResults = (ArrayList<ReportResultsVo>)request.getAttribute("searchresults");
	        session.setAttribute("searchresults",searchResults);
	        
				if (searchResults.size()==0){
			%>	
				<TR>
				<TD colspan="6" width="100%" class="errorstyle">
						No Results found, Please enter different search criteria
				</TD>
				</TR>	
			<%}else{
		  			int count=1;
					for(ReportResultsVo srvo : searchResults){
			%>
				<TR>
				<TD class="resultstyle">
				<input type="checkbox" name="updatechk<%=count %>" id="updatechk<%=count %>" value="<%=srvo.getBillnumber()%>" onclick="updatePaidDt(<%=count %>)"></input>
				</TD>
				<TD NOWRAP class="resultstyle" >
					<%=srvo.getBilldate()%>
				</TD>
				<TD class="resultstyle" >
					<%=srvo.getBillnumber()%>
				</TD>				
				<TD class="resultstyle" >
					<%=srvo.getCustomername()%>
				</TD>
				<TD class="resultstyle2" >
					<%=srvo.getBilldesc()%>
				</TD>
				<TD class="resultstyle">
					<%=srvo.getTotalCount()%>
				</TD>
				
				<TD class="resultstyle" >
					<%=srvo.getBillamount()%>
					<input type="hidden" value="<%=srvo.getBillamount()%>" name="billpaid<%=count%>" id="billpaid<%=count%>"/>	
				</TD>
				<TD class="resultstyle" >
					<%=srvo.getBillpaidamount()%>
				</TD>
				<TD class="resultstyle" >
				<input type="text"  class="textstyle3" name="paiddate<%=count%>" disabled value=<%=srvo.getBillPaidDate()==null?"Not-Paid":srvo.getBillPaidDate()%>></input>
				</TD>
				</TR>		
			 <%
				 count++;
				}%>
				<input type="hidden" value="<%=count%>" name="totalcount" id="totalcount"/>	
			 <%}%> 
			 </Table>
			</div>
			</TD>
			<TD>
			<div style="overflow:auto; height:200px; width:300px; top:10px; " bgcolor="#134b98">
			<Font color="White">Enter Paid Date for bulk update</Font>
			<BR>
			<BR>
			<input type="text"  maxlength="10"  name="globaldate" value=""  ></input>
			<Br>
			<BR>
			&nbsp;&nbsp;&nbsp;<Input type="button" name="applydate" class="btn" value="Apply Date" onclick="javascript:applyDate();"/>
			</div>
			</TD>
			</TR>
			</TABLE>
			 &nbsp;
			 &nbsp;
			 <Table align="center" name="addDtls" id="addDtls">
				 <TR>
					<TD><Input type="button" name="Update" class="btn" value="Update" onclick="validate()"/>
				 </TD>
				 </TR>
			 </Table>
		</form>

	        
</body>
</html>
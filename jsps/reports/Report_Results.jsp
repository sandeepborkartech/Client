<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.lms.app.vo.ReportResultsVo,java.util.ArrayList,com.lms.app.util.LMSUtility"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="application/vnd.ms-excel; charset=ISO-8859-1">
<title>Report Results</title>

<script language="JavaScript">

function submitclicked(){
	window.print();
	//alert("Report printed");
	//setTimeout("document.forms[0].submit()",6000);
}

function isIE() // Function to Determine IE or Not
{
 return /msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent);
}

function exportToExcel() // Function to Export the Table Data to Excel.
{
var isIEBrowser = isIE();
if(isIEBrowser== false)
{
alert('Please use Internet Explorer for Excel Export Functionality.');
return false;
}
else
{
var strTableID = "billdetails"; // It's the Table ID of Table in Webpart
var detailsTable = document.getElementById(strTableID);
var objExcel = new ActiveXObject("Excel.Application");
var objWorkBook = objExcel.Workbooks.Add;
var objWorkSheet = objWorkBook.Worksheets(1);
//alert(objWorkSheet);

for (var intRowIndex=0;intRowIndex<detailsTable.rows.length;intRowIndex++)
{
	//alert("rowIndex-->"+intRowIndex);
for (var intColumnIndex=0;intColumnIndex<detailsTable.rows(intRowIndex).cells.length;intColumnIndex++)
 {
	//alert("colIndex-->"+intColumnIndex);
 // if(intColumnIndex != 3)
	//alert("11->"+detailsTable.rows(intRowIndex).cells(intColumnIndex).innerText);
	  objWorkSheet.Cells(intRowIndex+1,intColumnIndex+1) = detailsTable.rows(intRowIndex).cells(intColumnIndex).innerText;
 } 
}
objExcel.Visible = true;
objExcel.UserControl = true;
}
}
</SCRIPT>
<Style>
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
<form action="/LMS/printreport.do" method="post" target="_blank">
 
    <input type="hidden" name="billnumber"/>
		<div style="overflow:auto; height:200px; width:720px;" class="tablebodystyle">
		<Table id="billdetails" border="1" width="96%">
			<TR>
		        
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
	        	//ArrayList<ReportResultsVo> searchResults = new ArrayList<ReportResultsVo>();
				
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
						System.out.println("Values of count****"+srvo.getTotalCount());
						System.out.println("Values of desc****"+srvo.getBilldesc());
			%>
				<TR>
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
				</TD>
				<TD class="resultstyle" >
					<%=srvo.getBillpaidamount()%>
				</TD>
				<TD class="resultstyle" >
					<%=srvo.getBillPaidDate()==null?"":srvo.getBillPaidDate()%>
				</TD>
				</TR>		
			 <%
				 count++;
				}
			 } %> 
			 </Table>
			</div>
			 &nbsp;
			 &nbsp;
			 <Table align="center" name="addDtls" id="addDtls">
				 <TR>
					<TD><Input type="button" name="Excel" class="btn" value="Export Report to Excel" onClick="exportToExcel()"/>
				 &nbsp;&nbsp;
				 <Input type="submit" name="Print" class="btn" value="Print Report" />
				 </TD>
				 </TR>
			 </Table>
		</form>

	        
</body>
</html>
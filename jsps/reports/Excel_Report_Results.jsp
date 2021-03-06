<%@ page language="java" contentType="application/vnd.ms-excel" pageEncoding="UTF-8" import="com.lms.app.vo.ReportResultsVo,java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Results</title>
<script>
function submitfordetails(billnum){
	document.forms[0].billnumber.value=billnum;
	document.forms[0].submit();
}
</script>
<Style>
.textstyle{
	width:100px;
	height:21px;
	vertical-align:center;
	border:1px #000000 solid;
	background-color:#404040;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:13px;
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
	width: 100px;
	text-align: center;
	vertical-align:center;
	border:1px #000000 solid;
	background-color:#0D3468;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:13px;
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
 <div style="overflow:auto; height:400px; width:800px;" class="tablebodystyle">
 <form action="/LMS/searchbn.do" method="post" >
    <input type="hidden" name="billnumber"/>
		<Table id="billdetails" border="1" width="96%">
			<TR>
		        <TD class="textstyle">
		        	Sr.No.
		        </TD>
		        <TD NOWRAP class="textstyle">
		        	Bill Date
		        </TD>
		        <TD class="textstyle">
		        	Bill Number
		        </TD>
		        <TD NOWRAP class="textstyle"> 
		        	Customer Name
		        </TD>
		        <TD NOWRAP class="textstyle">
		        	Bill Description
		        </TD>
		        <TD NOWRAP class="textstyle">
		        	Total Count
		        </TD>
		        <TD NOWRAP class="textstyle">
		        	Total Bill Amount
		        </TD>
		        <TD NOWRAP class="textstyle">
		        	Bill Paid Amount
		        </TD>
		        <TD NOWRAP class="textstyle">
		        	Bill Paid Date
		        </TD>
	        </TR>
	        <%
	        	ArrayList<ReportResultsVo> searchResults = new ArrayList<ReportResultsVo>();
				searchResults = (ArrayList<ReportResultsVo>)request.getAttribute("searchresults");
				System.out.println("Vaule of searchresults<<<---->"+searchResults);
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
					<%=count%>
				</TD>
				<TD class="resultstyle">
					<%=srvo.getBilldate()%>
				</TD>
				<TD class="resultstyle">
					<a href="javascript:submitfordetails('<%=srvo.getBillnumber()%>');"><font color="#FFFFFF"><%=srvo.getBillnumber()%></a>
				</TD>				
				<TD class="resultstyle">
					<%=srvo.getCustomername()%>
				</TD>
				<TD class="resultstyle">
					<%=srvo.getBilldesc()%>
				</TD>
				<TD class="resultstyle">
					<%=srvo.getTotalCount()%>
				</TD>
				
				<TD class="resultstyle">
					<%=srvo.getBillamount()%>
				</TD>
				<TD class="resultstyle">
					<%=srvo.getBillpaidamount()%>
				</TD>
				<TD class="resultstyle">
					<%=srvo.getBillPaidDate()%>
				</TD>
				</TR>		
				
			 <%
				 count++;
				}
			 } %> 
			 </Table>
			 </form>

	        
</body>
</html>
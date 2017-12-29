<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.lms.app.vo.BillVo,com.lms.app.vo.BillDetailsVo,java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Print</title>
<script language="JavaScript">
DA = (document.all) ? 1 : 0

function HandleError()
{
alert("\nNothing was printed. \n\nIf you do want to print this page, then\nclick on the printer icon in the toolbar above.")
return true;
}
function submitclicked(){
	window.print();
	setTimeout("document.forms[0].submit()",4000);
}
</SCRIPT>


<script language="VBScript">

Sub window_onunload()
On Error Resume Next
Set WB = nothing
On Error Goto 0
End Sub

Sub Print()
OLECMDID_PRINT = 6
OLECMDEXECOPT_DONTPROMPTUSER = 2
OLECMDEXECOPT_PROMPTUSER = 1


On Error Resume Next

If DA Then
call WB.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER,1)

Else
call WB.IOleCommandTarget.Exec(OLECMDID_PRINT ,OLECMDEXECOPT_DONTPROMPTUSER,"","","")

End If

If Err.Number <> 0 Then
If DA Then 
Alert("Nothing Printed :" & err.number & " : " & err.description)
Else
HandleError()
End if
End If
On Error Goto 0
End Sub

If DA Then
wbvers="8856F961-340A-11D0-A96B-00C04FD705A2"
Else
wbvers="EAB22AC3-30C1-11CF-A7EB-0000C05BAE0B"
End If

document.write "<object ID=""WB"" WIDTH=0 HEIGHT=0 CLASSID=""CLSID:"
document.write wbvers & """> </object>"
</script>
<style>
.tableheaderstyle{
	width:10cm;
	height:1.3cm;
	vertical-align:center;
	border:0px #000000 solid;
}
.tabletitlestyle{
	width:10cm;
	height:0.5cm;
	vertical-align:center;
	border:0px #000000 solid;
}
.tablefooterstyle{
	width:10cm;
	height:2cm;
	vertical-align:center;
	border:0px #000000 solid;
}	
.namestyle{
	width:0.92cm;
	height:0.5cm;
	vertical-align:center;
	border:0px #000000 solid;
}
.namevaluestyle{
	width:2.2cm;
	height:0.5cm;
	vertical-align:center;
	border:0px #000000 solid;
}
.billnostyle{
	width:0.5cm;
	height:0.5cm;
	vertical-align:center;
	border:0px #000000 solid;
}
.billnovaluestyle{
	width:3cm;
	height:0.5cm;
	vertical-align:center;
	border:0px #000000 solid;
}
.billdatestyle{
	width:0.65cm;
	height:0.5cm;
	vertical-align:center;
	border:0px #000000 solid;
}
.billdatevaluestyle{
	width:2.4cm;
	height:0.5cm;
	vertical-align:center;
	border:0px #000000 solid;
}			
.contentstyle{
	width:10cm;
	height:4.0cm;
	vertical-align:center;
	border:0px #000000 solid;
}	
.summarystyle{
	width:10cm;
	height:0.5cm;
	vertical-align:center;
	border:0px #000000 solid;
}	
.pagenumstyle{
	width:10cm;
	height:0.5cm;
	vertical-align:center;
	border:0px #000000 solid;
}					
</style>
</head>
<body>
<%
	BillVo billvo = (BillVo)request.getAttribute("bill");
%>
<form action="/LMS/postprint.do" >
<FONT size="2px" face="draft">
	<% 
		int pagesize = 7;
		int pagenum=1;
		ArrayList<BillDetailsVo> arrBD = billvo.getArrBillDetails();
		int arrSize = arrBD.size();
		int totalPageCount = arrSize/pagesize;
		if (arrSize%pagesize>0){
			totalPageCount++;
		}
		int startIndex=0;
		int endIndex=(pagesize>arrSize)?arrSize:pagesize;
		for (int newpage=1;newpage<=totalPageCount;newpage++ ){ %>
		<Table  class="tableheaderstyle">
			<TR>
				<TD width="100%">
				&nbsp;
				</TD>
			</TR>
		</Table>				
		<Table class="tabletitlestyle"> 		
		 <TR>   
		 	<TD class="namestyle">
		 	</TD>
		 	<TD class="namevaluestyle">
		 		<%=billvo.getCustomerName()==null?"":billvo.getCustomerName()%>	
		 	</TD>
		 	<TD class="billnostyle">
		 	</TD>
		 	<TD class="billnovaluestyle">
		 		<%=billvo.getBillnumber()==null?"":billvo.getBillnumber()%>
		 	</TD>
		    <TD  class="billdatestyle">
			</TD>
			<TD class="billdatevaluestyle">
			 		<%=billvo.getBilldate()==null?"":billvo.getBilldate()%>
			</TD>
		 </TR>
		</Table>
		 <Table class="contentstyle">	     
				<TR>
		   		<TD>
		   		 CLTH.
		   		</TD>
		   		<TD>
		   		SRVC.
		   		</TD>  								
		   		<TD>
		   		 QTY.
		   		</TD>
		   		<TD>
		   		 T.PRC.
		   		</TD>
		   		<TD >
		   		 CMTS.
		   		</TD>
		   	</TR>
<%	for (;startIndex<endIndex;startIndex++){ 
	BillDetailsVo bd =	arrBD.get(startIndex);
%>
<TR>
				   		<TD >
				   		 <%=bd.getClothdesc() %>
				   		</TD >
				   		<TD >
				   		 <%=bd.getServiceshortdesc() %>
				   		</TD>  								
				   		<TD >
				   		 <%=bd.getQuanity()%>
				   		</TD>
				   		<TD >
				   		 <%=bd.getTotalprice() %>
				   		</TD>
				   		<TD >
				   		 <%=bd.getComments()==null?"":bd.getComments()%>
				   		</TD>
</TR> 
<%} 
startIndex = endIndex;
endIndex=(endIndex+pagesize>arrSize)?arrSize:(endIndex+pagesize);
%>
</Table>
<% 
if (newpage==totalPageCount){
%>
<Table class="summarystyle">
					<TR align="right">
					<TD width="5%"/>
					<TD width="10%">
					<% if(billvo.getAdvPay()>0){ %>
					Advance payment:<%=billvo.getAdvPay()%>
					<%} %>
					</TD>
					
					<TD width="10%">
					Quantity:<%=billvo.getTotalCount()%>
					</TD>
					<TD width="10%">
						Total:<%=billvo.getBillamount()%>
					</TD>
					<% if (billvo.getBillpaidamount()>0){
					%>
					<TD width="10%">
						Paid:<%=billvo.getBillpaidamount()%>
					</TD>
					<%} %>
					
					</TR>
					<TR>
					<TD width="40%" align="center"><br>
					<%=billvo.getSplcomments() %>
					</TD>
					<TD width="40%" align="right"><br>
						<%if (!"1".equals(billvo.getServiceType())){%>
						   <B><%=billvo.getBillcrtime()%></B>
						<%}%>
					</TD>
					</TR>
</Table>
<%} %>			
<Table class="pagenumstyle">
					<TR align="right">
						<TD width="100%" >
							Page <%=newpage%>
						</TD>
					</TR>
				</Table>	

<Table class="tablefooterstyle">
		<TR>
			<TD width="100%">
			&nbsp;
			</TD>
		</TR>
</Table>	
<%}%>
</FONT>
<script>
submitclicked();
</script>
</form>	
</body>
</html>
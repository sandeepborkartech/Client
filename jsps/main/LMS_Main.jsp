<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" 
	import="com.lms.app.vo.LoginVo"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard | Laundry Management System</title>
<Script language="JavaScript">
function submitclicked(actionname){
//alert(actionname);	
document.forms[0].actioncalled.value=actionname;
//alert(document.forms[0].actioncalled.value);
}
</Script>
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
.labelstyle{
	width:200px;
	text-align:justify;
	vertical-align:center;
	height:10px;
	border:0px #000000 solid;
	background-color:#0D3468;
	color:#FFFF00;
	font-family:Verdana;
	font-size:13px;
}
.labelstylebold{
	width:200px;
	text-align:justify;
	vertical-align:center;
	height:10px;
	border:0px #000000 solid;
	background-color:#0D3468;
	color:#FFFF00;
	font-family:Verdana;
	font-weight:bold;
	font-size:13px;
}
.tablebodystyle{
	width:400px;
	height:150px;
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
.console { 
      width:800px;
	  height:50px;
	  color:#FFFFFF; 
	  text-align:center;
	  font: bold 84% 'Arial Bold',helvetica,sans-serif; 
	  font-size:16px;
	  background-color:#404040; 
	  border:1px solid; 
	  border-color: #FFFFFF; 
	} 
.labelstyle5{
	width:500px;
	text-align: left;
	vertical-align:center;
	height:21px;
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
.style1 {
	text-align: center;
}
</Style>
</head>

<body bgcolor="#134b98" TOPMARGIN='0' LEFTMARGIN='0'>
<img src="images/Main_Title.jpg" valign="top" width="1000">
<%LoginVo logindtls = (LoginVo)session.getAttribute("user"); %>
<Table width="1000" border="0">
<TR>
<TD class="labelstyle5">
Welcome <%=logindtls.getFname()%>
</TD>
<TD align="right">
<a href="/LMS/logout.do" class="resultstyle2">Logout</a>
</TD>
</TR>
</Table>
<%if(session.getAttribute("UpdateMessage")!=null){
%>

<font color="white">Update Message:<%=(String)session.getAttribute("UpdateMessage")%></font>
<%
session.removeAttribute("UpdateMessage");
}%>
<html:form action="linkto" >
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

  <table style="width: 803px" border="1" align="center">
	  <TR>
	  <input type="hidden" name="actioncalled" id="actioncalled">
	  <TD class="console" colspan="4">
	  		LAUNDRY CONTROL PANEL
	  </TD>
	  </TR>  
      <tr>
       <TD style="vertical-align:top ">
       <table width="96%">
	  	<tr >
	     <td colspan="2" class="labelstylebold">
	     <center>&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="label.BillingSystem"/></center>
	     </td>
	   </tr>
	     <tr class="labelstyle5">
	     <td>
			<html:submit onclick="submitclicked('c')" styleClass="btn">Create Bill</html:submit>	
	     </td>
	     <td>
			<html:submit onclick="submitclicked('u')" styleClass="btn">Update Bill</html:submit>
	     </td>
	  </tr>
	  </table>
	
	
	<TD class="style1" style="width: 201px" style="vertical-align:top ">
	<Table>
	  <tr>
	     <td class="labelstylebold" colspan="2" style="width: 201px" >
			<center><bean:message key="label.SearchSystem"/></center>
		</td>
		</tr>
		<tr>
	     <td colspan="2" style="width: 170px">
			<center><html:submit onclick="submitclicked('s')" styleClass="btn">Search Bill</html:submit></center>
	     </td>
	  </tr>
	</table>
	</TD>
	<TD class="style1" style="width: 107px" style="vertical-align:top ">
	<table style="width: 196px">
      
      <tr>
           <td class="labelstylebold" colspan="2" style="width: 175px" >
			<center><bean:message key="label.ReportsSystem"/></center>
			</td>
	  </tr>
	  <tr>
	     <td style="width: 175px">
			<center><html:submit onclick="submitclicked('r')" styleClass="btn">Generate Report</html:submit></center>
			
	     </td>
	  </tr>
	</table>
	</TD>
	<%
	 if ("Administrator".equalsIgnoreCase(logindtls.getRolename())){ %>
	<TD style="width: 237px" class="style1" style="vertical-align:top ">
	<table style="width: 196px">
      <tr>
            <td class="labelstylebold" colspan="2" style="width:178px" >
			<center><bean:message key="label.AdminSystem"/></center>
			</td>
	  </tr>
	  <tr>
	     <td>
			<center><html:submit onclick="submitclicked('a')" styleClass="btn">Update &gt;1 Bills</html:submit></center>
			
	     </td>
	  </tr>
	</table>
	</TD>
	<%} %>
	</tr>
	</table>
</html:form>	
</body>
</html>



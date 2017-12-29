<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<html>
<head>
	<title>Laundry Management System</title>
	<link href="globalcss.css" type=text/css rel=stylesheet/>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<script language="javascript">
function onLoad()
{
	//alert('1');
	//name of form is to be home
	document.forms[0].userName.focus();		
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
.labelstyle{
	width:100px;
	text-align: right;
	vertical-align:center;
	height:50px;
	border:0px #000000 solid;
	background-color:#0D3468;
	color:#FFFF00;
	font-family:Verdana;
	font-size:13px;
	

}
.tablebodystyle{
	width:400px;
	height:150px;
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
	
</Style>
</head>
<body bgcolor="#134b98" TOPMARGIN='0' LEFTMARGIN='0' onload='onLoad()'>

<img src="images/Main_Title.jpg" border='0' width="1000"/> 

<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>

<html:form action="login">
<center><font color="red">
<logic:messagesPresent message="true">
		<html:messages id="errors" message="true">             
			<bean:write name="errors" />        
		</html:messages>     
</logic:messagesPresent> 
</font></center>
<table align="center"  class="tablebodystyle">
  <tbody>
  <tr align="center" >
    <td class="labelstyle"><bean:message key="label.username"></bean:message></td>
    <td>
    <input type="text" name="userName" class="textstyle" tabindex=1/>
   </td>
   </tr>
  <tr align="center">
    <td class="labelstyle"><bean:message key="label.password"></bean:message></td>
    	<td><input type="password" name="password" class="textstyle" tabindex=2/>
   	</td>
  </tr>
  <tr>
  <TD>
  </TD>
    <td>
    	<html:submit styleClass="btn">LOGIN</html:submit> 
    	<html:reset  styleClass="btn">CLEAR</html:reset> 
    </td>
  </tr>
</tbody>
</table>
</html:form>
</p>
</body>
</html>

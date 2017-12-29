<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Console</title>
<script>
function submitclicked(actionname){
//alert(actionname);	
document.forms[0].actioncalled.value=actionname;
//alert(document.forms[0].actioncalled.value);
}
</script>
<Style>
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
</Style>
</head>
<body bgcolor="#134b98" TOPMARGIN='0' LEFTMARGIN='0'>
<form action="/LMS/adminlinkto.do" target="adminpages">
<input type="hidden" name="actioncalled" value=""/>
<table border="0" width="100px">				
<tr>
<td>
<center><font color="white" face="verdana" size="2"><b>Admin Console</b></font></center>
</td>
</tr>
<br>
<br>
<tr>	
	<td align="right"> 
		<input type="submit" value="Multi Bill Update" class="btn" onclick="submitclicked('b')"/>
		<input type="submit" value="Change password" class="btn" onclick="submitclicked('p')"/>
		<input type="submit" value="Manage Users" class="btn" onclick="submitclicked('u')"/>
		<input type="submit" value="Manage Master" class="btn" onclick="submitclicked('m')"/>
	</td>
</tr>
</table>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.lms.app.vo.LoginVo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin - Console</title>
</head>
<%
LoginVo logindtls = (LoginVo)session.getAttribute("user"); 
if ("Administrator".equalsIgnoreCase(logindtls.getRolename())){
%>
<FRAMESET rows="40%,60%">
      <FRAME name="header" src="jsps/admin/Admin_PayStatus_Criteria.jsp" noresize="noresize" frameborder="0" scrolling="no"/>
      <FRAME name="resultframe" noresize="noresize" frameborder="0" scrolling="no"/>
</FRAMESET>
<%}else{%>
<FRAMESET rows="33%,70%">
  <FRAME name="header" src="jsps/admin/header3.jsp" noresize="noresize" frameborder="0" scrolling="no">
  <FRAME name="criteriaframe" src="jsps/error/Not_Authorized.jsp" noresize="noresize" frameborder="0" scrolling="no">
</FRAMESET>
<%} %>

</html>
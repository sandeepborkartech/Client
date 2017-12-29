<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.lms.app.vo.LoginVo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<SCRIPT>
function submitclicked(actionname){
document.forms[0].actioncalled.value=actionname;
//alert(document.forms[0].actioncalled.value);
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
	width:180px;
	height:21px;
	vertical-align:center;
	border:0px #000000 solid;
	background-color:#404040;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:13px;
}	
.textstyle3{
	width:800px;
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
.labelstyle2{
	width:1000px;
	text-align: center;
	vertical-align:center;
	height:30px;
	border:0px #000000 solid;
	background-color:#0D3468;
	color:#FFFF00;
	font: bold 84%;
	font-family:Verdana;
	font-size:13px;
	

}
.tablebodystyle{
	border:1px #134b98 solid;
	background-color:#0D3468;
}

.btn { 
      width:150px;
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
	</STYLE>
</head>
<body bgcolor="#134b98" bgcolor="#134b98" TOPMARGIN='0' LEFTMARGIN='0'>
<img src="/LMS/images/Main_Title.jpg" width="1020"/>
<%LoginVo logindtls = (LoginVo)session.getAttribute("user"); %>
<Table border="0"  width = "1000">
<TR>
<TD class="labelstyle5">
Welcome <%=logindtls.getFname()%>
</TD>
<TD align="right">
<a href="/LMS/logout.do" class="resultstyle2" target="_top">Logout</a>
</TD>
</TR>
</Table>
<form name= "back" action="/LMS/linkto.do" method="post" target="_top">
		<TABLE border="0" width ="1020px" topmargin="0">
			<TR>
				<TD class="textstyle2"  align="left">
					<B>Update Bill Module</B>
					<input type="hidden" name="actioncalled"/>
				</TD>
				<TD width="20%" class="labelstyle2" align="center">
					<input type="submit" class="btn" name="Cancel" value= "Go to Dashboard" onclick="javascript:submitclicked('m')"/>					
				</TD>
			</TR>
		</TABLE>
</form>
</body>
</html>
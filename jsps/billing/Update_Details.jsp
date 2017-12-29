<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.lms.app.vo.*,java.util.ArrayList,com.lms.app.util.LMSUtility"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Bill</title>
<SCRIPT>
function changepaidamount(){
	var counter1 = document.forms[0].counter.value;
	//alert(counter1);
	var billpaidamount = 0;
	/*if(cnt!=-1)
	{
		var hiddenpaidText = document.getElementById('hiddenpaid'+cnt);
		alert(hiddenpaidText);
		alert(hiddenpaidText.value);
		var checkelement = document.getElementById('paid'+cnt);
		alert(checkelement.checked);
		hiddenpaidText.value = checkelement.checked==true?"Y":"N";
		alert(hiddenpaidText.value);
	}*/
		
	for (var i=0; i< counter1; i++){
		var paidBox = 'paid'+i;
		var totaltext = 'totalprice'+i;
		var checkelement = document.getElementById(paidBox);
		var tpelement = document.getElementById(totaltext);

		var hiddenpaidText = document.getElementById('hiddenpaid'+i);
		//alert(hiddenpaidText.value);
				
		if (checkelement.checked==true){
			billpaidamount = Number(billpaidamount) + Number(tpelement.value);
			if(checkelement.disabled==false)
			{
				hiddenpaidText.value = "Y";
			}
		}else{
			var paidallcheck = document.getElementById('paidall');
			paidallcheck.checked = false;
			if(checkelement.disabled==false)
			{
				hiddenpaidText.value = "N";
			}
		}
		//alert(checkelement.checked);
		//alert(hiddenpaidText.value);
	}
	document.forms[0].billamount.value = billpaidamount;	
}

function checkAllPaid(){
	var counter1 = document.forms[0].counter.value;
	//alert(counter1);
	var paidallcheck = document.getElementById('paidall');
	for (var i=0; i< counter1; i++){
		var paidBox = 'paid'+i;
		var checkelement = document.getElementById(paidBox);
		if(checkelement.disabled==true)
		{
			//alert("Do nothing-->"+checkelement.disabled);
		}
		else
		{	
			if (paidallcheck.checked==true){
				checkelement.setAttribute("checked", "true");
			}else{
				checkelement.setAttribute("checked", "");
			}
		}
	}
	 changepaidamount();
}

function checkAllDeliver(){
	var counter1 = document.forms[0].counter.value;
	//alert(counter1);
	var deliverallcheck = document.getElementById('deliverall');
	for (var i=0; i< counter1; i++){
		var deliverBox = 'deliver'+i;
		var checkelement = document.getElementById(deliverBox);
		if (deliverallcheck.checked==true){
			checkelement.setAttribute("checked", "true");
		}else{
			checkelement.setAttribute("checked", "");
		}
	}
	checkDeliver();
}

function checkDeliver(){
	var counter1 = document.forms[0].counter.value;
	//alert(counter1);
	var deliverallcheck = document.getElementById('deliverall');
	for (var i=0; i< counter1; i++){
		var deliverBox = 'deliver'+i;
		var checkelement = document.getElementById(deliverBox);
		
		var hiddendeliverText = document.getElementById('hiddendeliver'+i);
		//alert(hiddendeliverText.value);
		
		if (checkelement.checked==true){
			if(checkelement.disabled==false)
			{
				hiddendeliverText.value = "Y";
			}
			
		}else{
			deliverallcheck.setAttribute("checked", "");
			if(checkelement.disabled==false)
			{
				hiddendeliverText.value = "N";
			}
			//alert(checkelement.checked);
			//alert(hiddendeliverText.value);
		}
	}
}

function upp(){
	
	document.forms[0].printaction.value="yes";
	document.forms[0].submit();	
}
function print()
{
	document.forms[0].isUpdateReq.value="N";
	document.forms[0].submit();	
}


</SCRIPT>
<Style>
.colortextstyle{
	width:100px;
	height:21px;
	vertical-align:center;
	border:1px #000000 solid;
	background-color:#404040;
	color:#CC0000;
	font-family:Verdana;
	font-size:13px;
	font-weight: bold;
}	

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
.textstyle3{
	width:75px;
	height:21px;
	vertical-align:center;
	border:0px #000000 solid;
	background-color:#404040;
	color:#FFFFFF;
	font-family:Verdana;
	font-size:13px;
}
.textstyle4{
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
	text-align: left;
	vertical-align:center;
	height:50px;
	border:0px #000000 solid;
	background-color:#0D3468;
	color:#FFFF00;
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
.labelstyle3{
	width:200px;
	text-align: left;
	vertical-align:center;
	height:30px;
	border:0px #000000 solid;
	background-color:#0D3468;
	color:#FFFF00;
	font-family:Verdana;
	font-size:13px;
	

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
      width:94px;
	  height:25px;
	  color:#FFFFFF; 
	  font: bold 84% 'Arial Bold',helvetica,sans-serif; 
	  font-size:13px;
	  background-color:#404040; 
	  border:1px solid; 
	  border-color: #FFFFFF; 
	} 
	
	.btn2 { 
      width:100px;
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

<%
	BillVo billvo = (BillVo)request.getAttribute("billvo");
	System.out.println("billvo.getServiceType*******>"+billvo.getBilldate());
%>
<form method="post" action="./update.do">
	 <input type="hidden" name="servtype" id="servtype" value="<%=billvo.getServiceType()%>"/>
	 <input type="hidden" name="isUpdateReq" id="isUpdateReq" value="Y"/>
	 <input type="hidden" name="homedel" id="homedel" value="<%=billvo.getHomedeli()==null?"N":billvo.getHomedeli().equalsIgnoreCase("")?"N":billvo.getHomedeli()%>"/>
	 <input type="hidden" name="billcrtime" id="billcrtime" value="<%=billvo.getBillcrtime()==null?"12:00:00":billvo.getBillcrtime().equalsIgnoreCase("null")?"12:00:00":billvo.getBillcrtime().equalsIgnoreCase("")?"12:00:00":billvo.getBillcrtime()%>"/>
	 <Table border="0" width="800" class="tablebodystyle" cellpadding="0">
	 <TR>   
	 	<TD class="labelstyle">
	 		Name
	 	</TD>
	 	<TD >
	 		<Input class="textstyle" type="text" name="customername" readonly="yes" value="<%=billvo.getCustomerName()==null?"":billvo.getCustomerName()%>"/>	
	 	</TD>
	 	<TD class="labelstyle">
	 		 Bill Number
	 	</TD>
	 	<TD>
	 		<Input class="textstyle" type="text" name="bill_number" readonly="yes" value="<%=billvo.getBillnumber()==null?"":billvo.getBillnumber()%>"/>
	 	</TD>
	 	<TD class="labelstyle">
	 		 Bill Date
	 	</TD>
	 	<TD>
	 		<Input class="textstyle" type="text" name="billdate" readonly="yes" value="<%=billvo.getBilldate()==null?"":billvo.getBilldate()%>"/>
	 	</TD>
	 	<% 
	 	    System.out.println("Partial-->"+billvo.getBillDelivered()+"Total-->"+billvo.getBillpaidamount());
	 	    if(billvo.getBillamount().equals(billvo.getBillpaidamount()) && "Y".equalsIgnoreCase(billvo.getBillDelivered()))
	 	    {
		%>
		<TD class="labelstyle">
	 		 Bill Paid Date
	 	</TD>
	 	<TD>
			<Input class="colortextstyle" type="text" name="billpaiddate" readonly="yes" value="<%=billvo.getBillPaidDate()==null?"":billvo.getBillPaidDate()%>"/>
		<%
			}
		%>
		</TD>
	 </TR>
</Table>
	 
	 <div style="overflow:auto; height:200px; width:800px;" class="tablebodystyle">
			<Table id="billdetails" border="1" width="96%">
			<TR>
		        <TD class="textstyle">
		        	Sr.No.
		        </TD>
		        <TD class="textstyle">
		        	Cloth
		        </TD>
		        <TD class="textstyle">
		        	Service
		        </TD >
		        <TD class="textstyle" width="30">
		        	Quantity
		        </TD >
		        <TD class="textstyle">
		        	Price
		        </TD>
		        <TD class="textstyle">
		        	Total Price
		        </TD>
		        <TD class="textstyle">
		        	Paid
		        	<input type="checkbox" id="paidall" onclick="javascript:checkAllPaid()"/>
		        </TD>
		        <TD class="textstyle">
		        	Delivered
		        	<input type="checkbox" id="deliverall" onclick="javascript:checkAllDeliver()"/>
		        </TD>
		        <TD class="textstyle">
		        	Comments
		        </TD>
	        </TR>
			<% ArrayList<BillDetailsVo> arrBD = billvo.getArrBillDetails();
			  	if ((arrBD!=null)&&(arrBD.size()==0)){ 
		     %> <TR  >
		     	 <TD colspan="9" width="100%" class="errorstyle">
		        	No Records found for the Bill Number
		        </TD>  
		        </TR>	
		     <%}else{
		     int count = 0;
			   String[] inputType = new String[]{"text","text","text","text","text","text","checkbox","checkbox","text"};
			   String[] fields = new String[]{"srno","cloth","service","quantity","price","totalprice","paid","deliver","comments"};
			   String[] read   = new String[]{"yes","yes","yes","yes","yes","yes","","",""};
			   String strpaidchecked="";
			   String strdeliverychecked="";
			   for(BillDetailsVo bd : arrBD){
				   strpaidchecked="";
				   strdeliverychecked="";
					   	if ("Y".equalsIgnoreCase(bd.getItempaid())){
					   		strpaidchecked="checked";   
					   	}
					   	else{
					   		strpaidchecked="";
					   	}
				   
					   if ("Y".equalsIgnoreCase(bd.getItemdelivered())){
						   strdeliverychecked="checked";   
					   	}
					   	else{
					   		strdeliverychecked="";
					   	}
			%>
			        <TR>
			        <TD>
			   			<input type="text" name="srno<%=count%>" readonly="yes" 
			   										value="<%=bd.getSerialno() %>" size="2"/>
			   		</TD>
			   		
			   		<TD>
			   		 <input type="text" name="clothdesc<%=count%>" readonly="yes"
			   		 								value="<%=bd.getClothdesc() %>" size="10"/>
					<input type="hidden" name="cloth<%=count%>" readonly="yes"
			   		 								value="<%=bd.getClothid() %>" />  
			   		</TD>
			   		<TD>
			   		 <input type="text" name="servicedesc<%=count%>" readonly="yes" 
			   		 									value="<%=bd.getServicedesc() %>" size="20"/>
			   		 <input type="hidden" name="service<%=count%>" readonly="yes"
			   		 								value="<%=bd.getServiceid() %>" />
			   		</TD>  								
			   		 <TD>
			   		 <input type="text" name="quantity<%=count%>" readonly="yes"
			   		  								value="<%=bd.getQuanity()%>" size="5"/>
			   		 </TD>
			   		 <TD>
			   		 <input type="text" name="price<%=count%>" readonly="yes"
			   		  								value="<%=LMSUtility.UIAmountFormat(bd.getPrice())%>" size="5"/>
			   		 </TD>
			   		 <TD>
			   		 <input type="text" name="totalprice<%=count%>" readonly="yes>"
			   		 		 						value="<%=LMSUtility.UIAmountFormat(bd.getTotalprice())%>" size="5"/>
			   		 </TD>
			   		 <TD>
			   		 <%
			   		 if("checked".equalsIgnoreCase(strpaidchecked))
			   		 {
			   		 %>
			   		 <input type="checkbox" name="paid<%=count%>" 
			   		 		<%=strpaidchecked%> value="Y" disabled/>
			   		 <input type="hidden" id="hiddenpaid<%=count%>" name="hiddenpaid<%=count%>" value="<%=bd.getItempaid()%>"/>		
			   		 <%
			   		 }
			   		 else
			   		 {
			   		 %>
			   		 <input type="checkbox" name="paid<%=count%>" 
			   		 		<%=strpaidchecked%> value="Y" onClick="changepaidamount()"/>
			   		 <input type="hidden" id="hiddenpaid<%=count%>" name="hiddenpaid<%=count%>" value="<%=bd.getItempaid()%>"/>		
			   		 <%} %>
			   		 </TD>
			   		 <TD>
			   		 <% 
			   		 if("checked".equalsIgnoreCase(strdeliverychecked))
			   		 {
			   		 %>
			   		 <input type="checkbox" name="deliver<%=count%>" 
			   		 			<%=strdeliverychecked%> value="Y" disabled/>
			   		 <input type="hidden" id="hiddendeliver<%=count%>" name="hiddendeliver<%=count%>" value="<%=bd.getItemdelivered()%>"/>
			   		 <%}
			   		 else
			   		 {%>
			   		 <input type="checkbox" name="deliver<%=count%>" 
			   		 			<%=strdeliverychecked%> value="Y" onClick="checkDeliver()"/>
			   		 <input type="hidden" id="hiddendeliver<%=count%>" name="hiddendeliver<%=count%>" value="<%=bd.getItemdelivered()%>"/>
			   		 <%} %>
			   		 </TD>
			   		  <TD>
			   		 <input type="text" name="comments<%=count%>" value="<%=bd.getComments()%>" size="20"/>
			   		 </TD>
			   		</TR> 
		    <%
			count++;	   
		    	}  
			%>
	 		</Table>
	 		</div>
	 		<TABLE border="1" width ="800px">
	 			<TR>
	 				<TD class="labelstyle4" >
						Spl Comments:
					</TD>
	 				<TD class="labelstyle3" >
	 					<textarea id="splcomments" name="splcomments" rows="2" class="textstyle4"><%= billvo.getSplcomments()%></textarea>
	 				</TD>	 
	 				<%System.out.println("Value of AdvPay-->"+billvo.getServiceType()); 
	 				if (billvo.getServiceType().equalsIgnoreCase("3"))
	 				{
	 				%>
	 				<TD class="labelstyle4">
					Advance Payment:
					</TD>
					<TD class="labelstyle3" >
					<input type="text" name="advpay" id="advpay" readonly="yes" value="<%=LMSUtility.UIAmountFormat(billvo.getAdvPay())%>"class="textstyle3"/>
					</TD>
	 				<%
	 				}
	 				else
	 				{
	 					System.out.println("Dont show field**");
	 				}
	 				%>
	 				<TD  class="labelstyle3">
	 					<input type="hidden" name="counter" value="<%=count%>" />
	 					Total Amount
	 					<input class="textstyle2" type="text" name="totalamount" readonly="yes" value="<%=LMSUtility.UIAmountFormat(billvo.getBillamount()) %>" size="5"/>
	 					<BR>Billed Amount
	 					<input class="textstyle2" type="text" name="billamount" readonly="yes" value=<%=LMSUtility.UIAmountFormat(billvo.getBillpaidamount()) %> size="5"/>
	 				</TD>
	 				<TD>
	 				    <Input type="hidden" name="printaction" value="no"/>
	 				    <% 
	 				    System.out.println("Partial-->"+billvo.getBillDelivered()+"Total-->"+billvo.getBillpaidamount());
	 				    if(billvo.getBillamount().equals(billvo.getBillpaidamount()) && "Y".equalsIgnoreCase(billvo.getBillDelivered()))
	 				    {
	 				    %>
	 				    <Input type="button" name="Print" class="btn" value="Print" onClick="print()"/>
	 				    <%
	 				    } 
	 				    else
	 				    {
	 				    %>
	 					<Input type="submit" name="Update" class="btn" value="Update"/>
	 					<Input type="button" name="UpdateP" class="btn" value="Update & Print" onClick="upp()"/>
	 					<%
	 					} 
	 					%>
	 				</TD>
	 			</TR>
	 		</Table>
	 		<%} %>		
</form>
</body>
</html>
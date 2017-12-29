<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.lms.app.vo.LoginVo,java.util.StringTokenizer,com.lms.app.util.LMSUtility"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Bill</title>
<script type="text/javascript">
    <jsp:include page="Create_Bill.js" />
</script>
<script 
language="javascript" >

<%!
	String strClothMaster=null;
	String strServiceMaster=null;
	String strDate = null;
	String strBillNumber = null;
	String strServiceTypeMaster = null;
%>
<%
	//strClothMaster = "'"+(String)session.getAttribute("clothmasterlist")+"'";
	strClothMaster = (String)session.getAttribute("clothmasterlist");
	//System.out.println("strClothMaster-->"+strClothMaster);
	
	//strServiceMaster = "'"+(String)session.getAttribute("servicemasterlist")+"'";
	strServiceMaster = (String)session.getAttribute("servicemasterlist");
	//System.out.println("strServiceMaster-->"+strServiceMaster);
	
	//strServiceTypeMaster = "'"+(String)session.getAttribute("servicetypemasterlist")+"'";
	strServiceTypeMaster = (String)session.getAttribute("servicetypemasterlist");
	//System.out.println("strServiceTypeMaster-->"+strServiceTypeMaster);
	strDate = (String)request.getAttribute("billdate");

%>


var blnAdvPayCreated ="N";
function saveStatics(){
	document.forms[1].customername.focus();
	document.forms[1].clothmegalist.value='<%=strClothMaster%>';
	document.forms[1].servicemegalist.value='<%=strServiceMaster%>';
	document.forms[1].servicetypemegalist.value='<%=strServiceTypeMaster%>';
}

function removerow(){
	var count = document.forms[1].counter.value;
	if(count!="0")
	{
	document.forms[1].counter.value = --count;
	var table = document.getElementById("billdetails");
	table.deleteRow(count+1);
	}
}

function addhomedeli(){
	var hd = document.forms[1].homedeli[0].checked;
	//alert(hd);
	if(hd)
	{
	 document.forms[1].customername.value = "HD ";
	 document.forms[1].homedelival.value="Y";
	}else{
		document.forms[1].homedelival.value="N";	
	}
	//alert(document.forms[1].homedelival.value);
	document.forms[1].homedeli[0].disabled="true";
	document.forms[1].homedeli[1].disabled="true";
}

function datechange(){
var servicetypeval = document.getElementById('servicetype'); 

if(servicetypeval.selectedIndex==1)
	{
	   var billdatetime = new Date();
	   //alert(billdatetime);
	   var day = billdatetime.getDay();
	   //alert(day);
	   if(day!=1){
		   
		   var billhour = billdatetime.getHours();
		   //alert(billhour);
		   if(billhour>=16){
			   if(day==0){
				   billdatetime.setDate(billdatetime.getDate() + 2);  
			   }else{
			   billdatetime.setDate(billdatetime.getDate() + 1);
			   }
			   if (billdatetime.getDate()<10){
				  myDate = "0"+billdatetime.getDate(); 
			   }
			   else{
				   myDate =  billdatetime.getDate();
			   }
			   if (billdatetime.getDate()<10){
				   myDate = "0"+billdatetime.getDate(); 
			   }
			   else{
					myDate = billdatetime.getDate();
			   }
			   
			   if(billdatetime.getMonth()<10){
				   myMonth =   "0"+(billdatetime.getMonth()+1);
//alert(myMonth );
			   }else{
				   myMonth =   (billdatetime.getMonth()+1);
			   }
			   
			   var billdatechange = document.getElementById("billdate");
			   billdatechange.value = myDate+"-"+myMonth+"-"+billdatetime.getFullYear();
		   }
	   }

	   
	}

      addrow();

}

function addrow(){

	
	//Create an input type dynamically.
   var count = document.forms[1].counter.value==""?0:document.forms[1].counter.value;
   var servicetypeval = document.getElementById('servicetype'); 
   if(servicetypeval.selectedIndex==0){
	   alert("Please select service type");
	   servicetypeval.focus();
	   return null;
   }
   
	if(servicetypeval.selectedIndex==3)
	{
		if(blnAdvPayCreated=="N")
		{
		var addtable = document.getElementById("addDtls");
		myrow       = addtable.getElementsByTagName("tr")[0];
		myceltext       = myrow.getElementsByTagName("td")[2];
		myceltext.innerHTML="Advance Payment:";
		mycelfield       = myrow.getElementsByTagName("td")[3];
		var element = document.createElement("input"); 
		element.setAttribute("type", type); 
		element.setAttribute("id","advpay");
		element.setAttribute("name", "advpay");
		element.setAttribute("maxLength",12);
		element.setAttribute("className","textstyle3");
		mycelfield.appendChild(element);
		blnAdvPayCreated="Y";
		}
	}
   var table = document.getElementById("billdetails");
  
   var fields = ["srno","cloth","service","quantity","price","totalprice","comments"];
   var read   = ["yes","no","no","no","no","yes","no"];
   var value   = ["","","","","","",""];
   var size   = ["2","25","25","5","5","5","25"];
   var type   = ["text","select","select","text","text","text","text"];
   var func   = ["no","no","no","yes","yes","no","no"];
   var maxlength =["4","","","4","8","","200"];
   
   var rowcount = table.rows.length;
   value[0] = rowcount;
   var row = table.insertRow(rowcount);
   for(var col=0;col<fields.length; col++){
	   var cell = row.insertCell(col);
	   if (type[col]!="select"){
	   var element = createtextelement(fields[col],count,read[col],size[col],value[col],func[col],type[col],maxlength[col]);
	   }else{
	   var element = createcomboelement(fields[col],count);
	   var selhiddenid;
	   var selhidden = document.createElement('input');
	   if (fields[col]=='cloth'){
		selhiddenid="clthidden";
		}else{
			selhiddenid="srvhidden";
		}
	   selhidden.setAttribute("type", "hidden");
	   selhidden.setAttribute('name', selhiddenid + count);
	   selhidden.setAttribute('id', selhiddenid + count);
	   cell.appendChild(selhidden);
	   }
	   cell.appendChild(element);
   }
   var cell = row.insertCell(col);
   var element = createbuttonelement(count);
   cell.appendChild(element);
   
   document.forms[1].counter.value = ++count;
   	
   //document.forms[1].totalCount.value = count;
}

function createbuttonelement(count){
	var element = document.createElement("input");
	element.setAttribute("type", "button");
	element.setAttribute("class", "btnplus"); 
	element.setAttribute("value", "+"); 
	element.setAttribute("id", "add"+count);
	element.setAttribute("name", "add"+count);
	element.attachEvent("onclick", function(event){addrow()});
	return element;
	
}

function createtextelement(id,count,readval,sizeval,value,func,type,maxlen){
	var element = document.createElement("input"); 
	//Assign different attributes to the element. 
	element.setAttribute("type", type); 
	element.setAttribute("value", value); 
	element.setAttribute("id", id+count);
	element.setAttribute("name", id+count);
	element.setAttribute("size", sizeval);
	element.setAttribute("maxLength",maxlen);
	if (readval=="yes")
	element.setAttribute("readOnly", "yes");
	
	if ((id=="price")&&(func=="yes")){
		element.attachEvent("onchange", function(event){calculatetotal(eval(count))});
		
	}
	if ((id=="quantity")&&(func=="yes")){
		element.attachEvent("onchange", function(event){calculatetotal2(eval(count))});
		
	}
	return element;
}

function calculatetotal(cnt){
		var qty = 'quantity'+cnt;
		var prc = 'price'+cnt;
		var tp = 'totalprice'+cnt;
		var quantityText = document.getElementById(qty);
		var priceText = document.getElementById(prc);
		var totalPriceText = document.getElementById(tp);
		if (isNaN(quantityText.value)){
			alert("Please enter a valid number***");
			quantityText.text="";
			quantityText.focus();	
			return false;
		}
		else if(isNaN(priceText.value))
		{
			alert("Please enter a valid number+++");
			priceText.text="";
			priceText.focus();
			return false;
		}
		else{
		    totalPriceText.value = (Number(quantityText.value)*Number(priceText.value)).toFixed(2);
		}
		var totalamt=0;
		var totalamount = document.getElementById("ta");
		var countervalue = document.getElementById("counter");
		for (var i=0;i<Number(countervalue.value);i++){
			var tpr = 'totalprice'+i;
			var totalPriceval = document.getElementById(tpr);
			totalamt =  totalamt + Number(totalPriceval.value);
		}
		totalamount.value = totalamt.toFixed(2);
		
}

function calculatetotal2(cnt){
	var prc = 'price'+cnt;
	var priceText = document.getElementById(prc);
	if(priceText.value!=""){
		calculatetotal(cnt);
	}
	else{
		return null;
	}
	
	
}

function createcomboelement(id,count){
		var arrList = new Array();
		var cloth;
		var service;
		
		
		if (id=='cloth'){
			cloth = document.forms[1].clothmegalist.value;
			arrList = cloth.split(',');
			selhiddenid="clthidden";
		}else{
			service = document.forms[1].servicemegalist.value;
			arrList = service.split(',');
			selhiddenid="srvhidden";
		}		
		
		var combo = document.createElement('Select');
		combo.setAttribute('name', id + count);
		combo.setAttribute('id', id + count);
		var servicetypeval="";
		var selectedservice="";
		if(id=='service'){
			var objOption = document.createElement('Option');
			objOption.text = "Select a Service";
		    objOption.value = "";
		    combo.add(objOption);
			servicetypeval = document.getElementById('servicetype');
			//alert("id<-->"+servicetypeval.value);	
			if(servicetypeval.disabled!="true")
			{
				servtypeval = servicetypeval.options[servicetypeval.selectedIndex].value;
				document.getElementById('servtype').value = servtypeval;
				//alert("Value-->"+document.getElementById('servtype').value);
				//servtypeval=selectedservice;
				servicetypeval.disabled="true";
				if(servicetypeval.value==3)
				{
				var table = document.getElementById("addDtls");
				row = table.insertRow();
				var cell = row.insertCell();
			    //cell.appendChild(AdvP);
				}
			}		
		}
		if(id=='cloth')
		{
			var objOption = document.createElement('Option');
			objOption.text = "Select a Cloth Type";
		    objOption.value = "";
		    combo.add(objOption);
		}
			for(var i=0; i<arrList.length;i++){
	    	var objOption = document.createElement('Option');
		    var arrCombooption = arrList[i].split(':');
			//alert("arrCombooption"+arrCombooption);
		    if(id=='service'){
		    	var objService = arrCombooption[1];
		    	var arrservicetype = objService.split("+++");
		    	if ( servtypeval== arrservicetype[1]){
		    		objOption.text = arrservicetype[0];
				    objOption.value = arrCombooption[0];
				    combo.add(objOption);
		    	}
		    }else{
		    	objOption.text = arrCombooption[1];
			    objOption.value = arrCombooption[0];
			    combo.add(objOption);
		    }
		    
		    
		}
		return combo;
}


function submitclicked(actionname){
document.forms[0].actioncalled.value=actionname;
//alert(document.forms[0].actioncalled.value);
}

function validate(){
	//alert("Inside validate");
	var custn = document.forms[1].customername.value;
	var qty = "";
	var prc = "";
	var clt = "";
	var srv = "";
	var servicetypeval = document.getElementById('servicetype');
	if (document.forms[1].homedelival.value=="A"){
		alert("Please select Home delivery value");
		document.forms[1].homedeli[0].focus();
		return false;
	}
	if (custn==""){
		alert("Please enter Customer Name");
		document.forms[1].customername.text="";
		document.forms[1].customername.focus();
		return false;
	}
	if(servicetypeval.selectedIndex==0){
	   alert("Please select Service Type");
	   servicetypeval.focus();
	   return false;
   }
		var totalcount = document.forms[1].counter.value;
		if(totalcount==0)
		{
			alert("Please enter atleast one item");
			document.forms[1].plusbtn.focus();
			return false;
		}
		for (var i=0;i<Number(totalcount);i++){
			qty = 'quantity'+i;
			prc = 'price'+i;
			clt = 'cloth'+i;
			srv = 'service'+i;
			var quantityText = document.getElementById(qty);
			var priceText = document.getElementById(prc);
			var cltText = document.getElementById(clt);
			var srvText = document.getElementById(srv);
			if(cltText.selectedIndex==0){
				alert("Please select Cloth Type");
				cltText.focus();
				return false;
			}
			var cltdesc = document.getElementById("clthidden"+i);
			cltdesc.value=cltText.options[cltText.selectedIndex].text;
			if(srvText.selectedIndex==0){
				alert("Please select Service");
				srvText.focus();
				return false;
			}
			if (quantityText.value==""){	
				alert("Please enter Quantity");
				quantityText.text="";
				quantityText.focus();
				return false;
			}
			if(priceText.value==""){
				alert("Please enter Price");
				priceText.text="";
				priceText.focus();
				return false;
				
			}
			
			var srvdesc = document.getElementById("srvhidden"+i);
			srvdesc.value=srvText.options[srvText.selectedIndex].text;
			var result = calculatetotal(i);
			if(result==false)
				return false;
			}
		if(servicetypeval.selectedIndex==3)
		{
			var advancePay = document.forms[1].advpay.value;
			var totalAmt = document.forms[1].totalamount.value;
			if (isNaN(advancePay)){
				alert("Advance Payment value is not a number");
				document.forms[1].advpay.value.text="";
				document.forms[1].advpay.value.focus();	
				return false;
				
			}
			if(Number(advancePay)>Number(totalAmt))
			{
				alert("Advance Payment cannot be greater than Bill Amount");
				document.forms[1].advpay.text="";
				document.forms[1].advpay.focus();
				return false;
			}
		
		}
	return document.forms[1].submit();
	
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
	width:120px;
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
.selectstyle2{
	width:140px;
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
	
</Style>
</head>
<body onload="javascript:saveStatics()" bgcolor="#134b98" bgcolor="#134b98" TOPMARGIN='0' LEFTMARGIN='0'>
<img src="images/Main_Title.jpg" width="1000">
<%LoginVo logindtls = (LoginVo)session.getAttribute("user"); %>
<Table width = "1000">
<TR>
<TD class="labelstyle5">
Welcome <%=logindtls.getFname()%>
</TD>
<TD align="right">
<a href="/LMS/logout.do" class="resultstyle2">Logout</a>
</TD>
</TR>
</Table>
<div BOTTOMMARGIN='0'>
<form name= "back" action="linkto.do" method="post">
		<TABLE border="0" width ="800px">
			<TR>
				<TD class="textstyle" width="20%" align="left">
					<input type="hidden" name="actioncalled"/>
					<!-- <input type="hidden" name="totalCount"/>-->
					<B>Create Bill Module</B>
				</TD>
				<TD width="80%" class="labelstyle2" align="center">
					<input type="submit" class="btn" name="Cancel" value= "Go to Dashboard" onclick="javascript:submitclicked('m')"/>					
				</TD>
			</TR>
		</TABLE>
</form>
</div>
<form action="create.do" method="post" name="bill" >
<input type="hidden" name="counter"/>
<input type="hidden" name="clothmegalist"/>
<input type="hidden" name="servicemegalist"/>
<input type="hidden" name="servicetypemegalist"/>
				<Table id="billheader" border="0" width="800" class="tablebodystyle" cellpadding="0" >
				     <TR>
				     	<TD class="labelstyle">	
							Home Deli.
					 	</TD>
					 	<TD>
					 		<input type="Radio" id="homedeli" name="homedeli" value="Y" onclick="javascript:addhomedeli();"/><font size="2" color="#FFFF00" face="verdana">Yes</font>
					 	</TD>
					 	<TD>
					 	    <input type="Radio" id="homedeli" name="homedeli" value="N" onclick="javascript:addhomedeli();" CHECKED/><font size="2" color="#FFFF00" face="verdana">No&nbsp;&nbsp;</font>
					 	    <input type="hidden" id="homedelival" name="homedelival" value="N"/>
					 	</TD>
				     	<TD class="labelstyle">	
							Name:
					 	</TD>
					 	<TD>
					 		<input class="textstyle2" type="text" name="customername" maxlength="10"/>
					 	</TD>
					 	<TD class="labelstyle">	
							Bill date:
					 	</TD>
					 	<TD>
					 		<input class="textstyle2" type="text" name="billdate" readonly="yes" value="<%=strDate%>"/>
					 	</TD>
					 	<TD class="labelstyle">	
							Service Type:
					 	</TD>
					 	<TD>
					 		<select name="servicetype" id="servicetype" class="selectstyle2">
					 		<option value="">Select a Service Type</option>
					 		<%
					 		StringTokenizer st1 = new StringTokenizer(strServiceTypeMaster, ",");
					 		String id = null;
					 		String value = null;
					 		while(st1.hasMoreTokens())
					 		{
					 			System.out.println();
					 			StringTokenizer st2 = new StringTokenizer(st1.nextToken(), ":");
					 			while(st2.hasMoreTokens())
					 			{
					 				id = st2.nextToken();
					 				value = st2.nextToken();
					 		%>
					 		<option value="<%=id%>"><%=value%></option>
					 		<%
					 		}
					 		}
					 		%>
					 		</select>
					 		<input type="hidden" name="servtype" id="servtype"/>
					 	</TD>
					 	<TD>
					 		<input type="button" name="plusbtn" value="+" onclick="javascript:datechange()" class="btnplus"/>
					 	</TD>
					 	<TD>
					 		<input type="button" value="-" onclick="javascript:removerow()" class="btnplus"/>
					 	</TD>
					 </TR>
				</Table>
			<TD>				
		</Table>
		<div style="overflow:auto; height:275px; width:800px;" class="tablebodystyle">
			<Table id="billdetails" border="1" width="96%">
				<TR>
					<TD class="textstyle">
						Sr.No.
					</TD>
					<TD class="textstyle">
						Cloth Type
					</TD>
					<TD class="textstyle">
						Service
					</TD>
					<TD class="textstyle">
						Quantity
					</TD>
					<TD class="textstyle">
						Price
					</TD>
					<TD class="textstyle">
						Total Price
					</TD>
					<TD class="textstyle">
						Comments
					</TD>
				</TR>
			</Table>
		</div>
		<TABLE border="1" width ="800px" id="addDtls">
			<TR>
				<TD class="labelstyle4">
					Spl Comments:
				</TD>
				<TD class="labelstyle3" maxlength="200">
					<textarea name="splcomments" rows='2' class="textstyle"></textarea>
				</TD>
				<TD class="labelstyle4"></TD>
				<TD class="labelstyle3"></TD>
				<TD class="labelstyle4">
					Total Amount:
				</TD>
				<TD class="labelstyle3">
					<input type="text" name="totalamount" id="ta" readonly="yes" class="textstyle3"/>
				</TD>
				<TD>	
					<input type="button" value="Save & Print" class="btn" onclick="validate();">
					
				</TD>
			</TR>
		</TABLE>
</form>
</body>
</html>
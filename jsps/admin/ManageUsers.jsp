<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin - ManageUsers</title>

 
<link rel="stylesheet" type="text/css" media="screen" href="css/ui-lightness/jquery-ui-1.8.14.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
 
<script src="js/jquery-1.5.2.min.js" type="text/javascript"></script>
<script src="js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="gridJS/jquery.jqGrid.min.js" type="text/javascript"></script>  
<link href="css/ui-lightness/jquery-ui-1.8.14.custom.css" rel="stylesheet" type="text/css" />  
<link href="css/ui.jqgrid.css" rel="stylesheet" type="text/css" />  
<link href="js/ui.multiselect.css" rel="stylesheet" type="text/css" />  
 
<script type="text/javascript"> 
function fillGridOnEvent(){   
jQuery("#userList").jqGrid({
   	url:"<%=request.getContextPath()%>/getusers.do?action=read",
   	mtype: "GET",
	datatype: "xml",
   	colNames:['id','Userid','Password','FirstName', 'Lastname', 'Role'],
   	colModel:[
		{name:'id',index:'id', width:75,editable:true,editoptions:{readonly:true,size:5}},
   		{name:'userid',index:'userid', width:75,editable:true,editoptions:{size:10}},
   		{name:'Password',index:'password', width:80, align:"right", sortable:false,editable:true,editoptions:{size:10}},
   		{name:'FirstName',index:'firstname', width:90,editable:true,editoptions:{size:10}},
   		{name:'LastName',index:'lastname', width:100,editable:true,editoptions:{size:10}},
   		{name:'Role',index:'role', width:80, align:"right",editable:true,editoptions:{readonly:true,size:10}},				
   	],
   	rowNum:10,
   	autowidth: true,
   	pager: jQuery('#pager1'),
   	sortname: 'userid',
    viewrecords: true,
    sortorder: "desc",
    caption:"Manage Users"
});jQuery("#userList").jqGrid(
		'navGrid','#pager1',     
		{edit:false,add:false,del:false,search:true},     
		{ },           { },           { },      
		{          
			sopt:['eq', 'ne', 'lt', 'gt', 'cn', 'bw', 'ew'],
			closeOnEscape: true,              
			multipleSearch: true,               
			closeAfterSearch: true 
		});
		jQuery("#userList").navButtonAdd
		('#pager1',     
		{  caption:"Add",       
		   buttonicon:"ui-icon-plus",       
		   onClickButton: addRow,      
		   position: "last",       
		   title:"",       
		   cursor: "pointer"    
		   }    );       
		jQuery("#userList").navButtonAdd('#pager1',     
		{  caption:"Edit",       
			buttonicon:"ui-icon-pencil",       
			onClickButton: editRow,      
			position: "last",       
			title:"",       
			cursor: "pointer"    
			}    );       
		jQuery("#userList").navButtonAdd('#pager1',    
		{  caption:"Delete",      
			buttonicon:"ui-icon-trash",      
			onClickButton: deleteRow,     
			position: "last",      
			title:"",      
			cursor: "pointer"   
			}    ); 
	 
}
</script>

<script type="text/javascript"> 
  
function addRow() { 
	alert("Inside add row");
} 
  
function editRow() {
	 // Get the currently selected row
	 var row = jQuery("#userList").jqGrid('getGridParam','selrow');
	  
	 if( row != null ) 
		 jQuery("#userList").jqGrid('editGridRow',row,
	   { url:"<%=request.getContextPath()%>/getusers.do?action=edit", 
	    editData: {
	          },
	          recreateForm: true,
	          beforeShowForm: function(form) {
	          },
	    closeAfterEdit: true,
	    reloadAfterSubmit:false,
	    afterSubmit : function(response, postdata) 
	    { 
	              var result = eval('(' + response.responseText + ')');
	     var errors = "";
	      
	              if (result.success == false) {
	      for (var i = 0; i < result.message.length; i++) {
	       errors +=  result.message[i] + "";
	      }
	              }  else {
	            	  jQuery("#dialog").text('Entry has been edited successfully');
	               jQuery("#dialog").dialog( 
	        { title: 'Success',
	         modal: true,
	         buttons: {"Ok": function()  {
	        	 jQuery(this).dialog("close");} 
	         }
	        });
	       }
	     return [result.success, errors, null];
	    }
	   });
	 //else jQuery( "#dialogSelectRow" ).dialog();
	}
  
function deleteRow() { 
	alert("Inside delete row");
} 
  
</script>

</head>
<body onload="fillGridOnEvent();" bgcolor="#134b98" TOPMARGIN='0' LEFTMARGIN='0'>
<div id="jqgrid">  
	<table id="userList"></table>  
<div id="pager1">
</div> 
</div> 
<div id="dialog" title="Feature not supported" style="display:none">
 <p>That feature is not supported.</p>
</div>
 
<div id="dialogSelectRow" title="Warning" style="display:none">
 <p>Please select row</p>
</div>
</body>
</html>
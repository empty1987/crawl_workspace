<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fn.tld" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/fmt.tld" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tlds/base64.tld" prefix="myfn"%>
<%@ taglib uri="/WEB-INF/tlds/myfunc.tld" prefix="myfunc"%>
<link type='text/css'
			href="${pageContext.request.contextPath}/ui/kendoui/examples/shared/styles/examples.css"
			rel="stylesheet" />
		<link type='text/css'
			href="${pageContext.request.contextPath}/ui/kendoui/source/styles/kendo.common.css"
			rel="stylesheet" />
		<link type='text/css'
			href="${pageContext.request.contextPath}/ui/kendoui/source/styles/kendo.default.css"
			rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/css/index/list.css"	rel="stylesheet" type='text/css' />
			
			
		<script
			src="${pageContext.request.contextPath}/ui/kendoui/source/js/jquery.min.js">
</script>
		<script
			src="${pageContext.request.contextPath}/ui/kendoui/source/js/kendo.core.js">
</script>
		<script
			src="${pageContext.request.contextPath}/ui/kendoui/source/js/kendo.data.js">
</script>
		<script
			src="${pageContext.request.contextPath}/ui/kendoui/source/js/kendo.grid.js">
</script>
		<script language="javascript"
			src="${pageContext.request.contextPath}/ui/My97DatePicker/WdatePicker.js">
</script>
<script language="javascript"
	src="${pageContext.request.contextPath}/js/jquery.form.js">
</script>
<script language="javascript"
	src="${pageContext.request.contextPath}/js/validate.js">
</script>

		<!-- Load jQuery, SimpleModal and Basic JS files -->
		<script type='text/javascript'
			src='${pageContext.request.contextPath}/ui/simplemodal/basic/js/jquery.simplemodal.js'>
</script>
		<script type='text/javascript'
			src='${pageContext.request.contextPath}/ui/simplemodal/basic/js/basic.js'>
</script>
		<!-- Page styles -->
		<link type='text/css'
			href='${pageContext.request.contextPath}/ui/simplemodal/basic/css/demo.css'
			rel='stylesheet' media='screen' />

		<!-- Contact Form CSS files -->
		<link type='text/css'
			href='${pageContext.request.contextPath}/ui/simplemodal/basic/css/basic.css'
			rel='stylesheet' media='screen' />


		<style type="text/css">
#site_content_kendoui {
	width: 95%;
	overflow: hidden;
	margin: 0 auto 0 auto;
	padding: 0 20px 20px 40px;
	background: #FFF;
	border-left: 1px solid #ECECE0;
	border-right: 1px solid #ECECE0;
}

#content_kendoui {
	text-align: left;
	padding: 0;
}

body {
	font: normal .80em 'trebuchet ms', arial, sans-serif;
	background: #F4F4EE;
	color: #5D5D5D;
}

.logininput {
	height: 15px;
	width: 100px;
	_width: 237px;
	margin-bottom: 15px;
	padding: 3px;
	font: 16px 'Lucida Grande', arial, sans-serif;
}
</style>
<script type="text/javascript">
<!--
  $.ajaxSetup({cache:false});
  var servletPath = '${pageContext.request.contextPath}';
   function showRequest(formData, jqForm, options) { 
   			 if(Validator.Validate(form2,3)){ 
		      return true;
		     }else return false;
   			 
	}  
	  function showResponse(responseText, statusText)  {  
	 	if(statusText == "success"){ 
	 		   if(responseText.tips == 'success'){ 
		 	   window.location.reload();
		 	   $.modal.close();
		 	   return;
		 	   }
	 	} 
	 	 
	 	   
	} 
	 
	 function submitForm(url,formId){  
	 
	 url = servletPath +url; 
	 var submitForm = document.getElementById(formId);
	 
	//ajaxForm
	 var options = {  
	        beforeSubmit:  function(formData, jqForm, options){
	        					
					        	 if(Validator.Validate(submitForm,3)){ 
							      return true;
							     }else return false;
	        },   
	        success:       function(responseText, statusText){
						        if(statusText == "success"){ 
						 		   if(responseText.tips == 'success'){ 
						 		   alert("操作成功");
							 	   window.location.reload();
							 	   $.modal.close();
							 	   return;
							 	   }
							 	   
						 	} 
						 	alert(responseText.tips);   
	        },  
	        url:       url,         
	        dataType:  "json",   
	        timeout:   3000 
	    };  
	    
	    $('#'+formId).ajaxSubmit(options); //options  
	    
    	return false;  
	 }
	 
	 function updatex(id,url,title){ 
	 		
	  		url = servletPath +url; 
			var params = "id="+id;  
			$("#title").html(title);
			$.getJSON(url, params,function(result){ 
			var model = result.model;
			try{
				fillForm(model);
			}catch(e){
				alert("找不到fillForm函数！");
				return ;
			} 
			 openWindow(); 
			});
	 }    	
	  
	function addx(formId,title){
		 $('#'+formId).clearForm(); 
		 $("#title").html(title);  
		 openWindow();
	}
	function deletex(id,url){
			 
			if(!window.confirm("确定要删除该数据？"))return;
	 		url = servletPath +url; 
			 var params = "id="+id;  
			 
			 $.getJSON(url, params,function(result){ 
			  	window.location.reload(); 
			});
	}
	function openWindow(){ 
			$('#basic-modal-content').modal(); 
	}
	function killErrors() {
	return true;
	}
	

<%--	window.onerror = killErrors;--%>
//-->
</script>

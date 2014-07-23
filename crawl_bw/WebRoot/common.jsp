<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/fn.tld" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/fmt.tld" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tlds/base64.tld" prefix="myfn"%>
<%@ taglib uri="/WEB-INF/tlds/myfunc.tld" prefix="myfunc"%>
<link rel="STYLESHEET" type="text/css"
	href="${pageContext.request.contextPath}/css/css.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/ui/button/button.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/ui/button/icon.css">
<style type="text/css">
h3 {
	padding: 1;
	margin: 1;
}

/* Overlay */
#simplemodal-overlay {
	background-color: #d6ebeb;
	cursor: default;
}

/* Container */
#simplemodal-container {
	height: 300;
	width: 550;
	color: #dddddd;
	background-color: #ffffff;
	border: 4px solid #83C1F1;
	padding: 5px;
}
</style>
<script language="javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js">
</script>
<script language="javascript"
	src="${pageContext.request.contextPath}/js/validate.js">
</script>
<script language="javascript"
	src="${pageContext.request.contextPath}/ui/button/pico-button.js">
</script>
<script language="javascript"
	src="${pageContext.request.contextPath}/ui/simplemodal/jquery.simplemodal-1.3.3.js">
</script>
<script language="javascript"
	src="${pageContext.request.contextPath}/js/jquery.form.js">
</script>
<script language="javascript"
	src="${pageContext.request.contextPath}/js/common.js">
</script>
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
							 	   	parent.leftFrame.location.reload();
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

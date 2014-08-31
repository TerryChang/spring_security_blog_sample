<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
<jsp:include page="/WEB-INF/views/include/jsInclude.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function (){
	
	$("#admin_ajax_test").click(function(){
		
		var title = "타이틀";
		var content = "컨텐츠";
		
		$.ajax({
			url : "${ctx}/admin/ajaxTest.do",
			data : {title : title, content : content},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "POST",
			dataType : "json",
			beforeSend: function (xhr) {
            	xhr.setRequestHeader("X-Ajax-call", "true");
          	},
          	success:function(data, textStatus, jqXHR){
          		if(data.result == "OK"){
          			alert("ok");
          		}else{
          			alert("fail");
          		}
        	},
        	error:function(jqXHR, textStatus, errorThrown){
        		if(jqXHR.status == 403){
        			var response = $.parseJSON(jqXHR.responseText);
        			alert("result : " + response.result + "\nmessage : " + response.message);
        		}else{
        			alert(errorThrown);	
        		}
        		
        	}
		});
		
	});
		
});
</script> 
</head>
<body>
<div style="display:inline-block;">
    <jsp:include page="/WEB-INF/views/include/leftmenu.jsp"></jsp:include> 
    <div style="float:right;">
        메인화면 컨텐츠<br/>
        <sec:authorize access="isAuthenticated()">
		<a id="admin_ajax_test">어드민 ajax test</a>
		</sec:authorize>        
    </div>
</div>
</body>
</html>

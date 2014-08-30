<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title></title>
<jsp:include page="/WEB-INF/views/include/jsInclude.jsp"></jsp:include> 
<script type="text/javascript">
$(document).ready(function (){
	
	$("#loginbtn").click(function(){
		if($("#loginid").val() == ""){
			alert("로그인 아이디를 입력해주세요");
			$("#loginid").focus();
		}else if($("#loginpwd").val() == ""){
			alert("로그인 비밀번호를 입력해주세요");
			$("#loginpwd").focus();
		}else{
			var loginid = $("#loginid").val();
			var loginpwd = $("#loginpwd").val();
			
			$.ajax({
				url : "${ctx}/j_spring_security_check",
				data : {loginid : loginid, loginpwd : loginpwd},
				type : "POST",
				beforeSend: function (xhr) {
	            	xhr.setRequestHeader("X-Ajax-call", "true");
	          	},
	          	success:function(data, textStatus, jqXHR){
	          		if(data == "OK"){
	          			opener.location.reload();
	          			self.close();
	          		}else{
	          			var msg = "";
	          			msg += "Your login attempt was not successful, try again.<BR><BR>\n";
	    				msg += "Reason: " + data;
	    				$("#showMessage").html(msg);
	          		}
	        	},
	        	error:function(jqXHR, textStatus, errorThrown){
	        		alert("로그인을 수행할 수 없습니다");
	        	}
			});
		}
	});
		
});
</script>    
</head>
<body>
<div style="display:inline-block;">
    로그인 화면
    <table>
    	<tr>
    		<td>아이디</td>
    		<td>
    			<input type="text" id="loginid" name="loginid" value="${loginid}" />
    		</td>
    		<td rowspan="2">
    			<input type="button" id="loginbtn" value="확인" />
    		</td>
    	</tr>
    	<tr>
    		<td>비밀번호</td>
    		<td>
    			<input type="text" id="loginpwd" name="loginpwd" value="${loginpwd}" />
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
				<font color="red" id="showMessage">
				
				</font>
    		</td>
    	</tr>
    </table>
</div>
</body>
</html>

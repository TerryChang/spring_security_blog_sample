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
			$("#loginfrm").attr("action", "<c:url value='/j_spring_security_check'/>");
			$("#loginfrm").submit();
		}
	});
		
});
</script>    
</head>
<body>
<div style="display:inline-block;">
    로그인 화면
    <form id="loginfrm" name="loginfrm" action="<c:url value='${ctx}/j_spring_security_check'/>" method="POST">
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
    	<c:if test="${not empty securityexceptionmsg}">
    	<tr>
    		<td colspan="2">
				<font color="red">
				<p>Your login attempt was not successful, try again.</p>
				<p>${securityexceptionmsg}</p>
				</font>
    		</td>
    	</tr>
    	</c:if>
    </table>
    <input type="hidden" name="loginRedirect" value="${loginRedirect}" />
    </form>
</div>
</body>
</html>

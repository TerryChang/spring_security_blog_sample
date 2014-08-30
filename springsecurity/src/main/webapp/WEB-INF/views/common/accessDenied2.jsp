<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true"%>
<html>
<head>
<title></title>
<style>
table{
	width:800px;
}
table, th, td
{
	border-collapse:collapse; 
	border:1px solid gray;
}
</style>
<jsp:include page="/WEB-INF/views/include/jsInclude.jsp"></jsp:include> 
<script type="text/javascript">
$(document).ready(function () {
	
});
</script>    
</head>
<body>
<div style="display:inline-block;">
    <jsp:include page="/WEB-INF/views/include/leftmenu.jsp"></jsp:include> 
    <div style="float:right;">
    	접근권한이 없습니다.<br> 담당자에게 문의하여 주시기 바랍니다. <br>
		${errormsg}					
		<br>
		<c:if test="${not empty username}">
			${username}<br/>
		</c:if>
		<a href="<c:url value='/main.do'/>">확인</a>	
    </div>
</div>
</body>
</html>

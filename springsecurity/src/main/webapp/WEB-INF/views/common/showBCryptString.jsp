<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="frmPassword" method="POST">
문자열 : <input type="text" id="targetStr" name="targetStr" value="${targetStr}"/>
<input type="submit" value="변환" />
</form>
<c:if test="${not empty bCryptString}">
BCrypt 인코딩 문자열 : ${bCryptString}
</c:if>
</body>
</html>
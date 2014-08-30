<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="com.terry.springsecurity.vo.MemberInfo" %>
<%
Authentication auth = SecurityContextHolder.getContext().getAuthentication();

Object principal = auth.getPrincipal();	// 로그인 하지 않았을 경우 anonymousUser 란 String 객체가 리턴된다(로그인 했으면 MemberInfo 객체)
String name = "";
if(principal != null && principal instanceof MemberInfo){
	name = ((MemberInfo)principal).getName();
}

// 아래 코드는 Spring Security를 통해서 인증 정보를 꺼내오는 것이 아니라 HttpServetRequest 객체에서 인증정보를 꺼내오는 것이다
// 위의 Spring Security를 통해서 인증 정보를 꺼내오는 부분과는 차이가 있는데..
// 로그인을 하지 않은 경우, 즉 AnonymousUser 인 경우 Spring Security에서는 AnonymousUser Principal이 들어있는 Authentication을 return 하지만
// HttpServletRequest의 경우 Anonymous인 경우 null을 리턴한다. 이 부분에 대한 처리를 별도로 해주도록 한다
// 그러나 전반적으로 Spring Security 전용 태그도 쓰는 마당에 Spring Security에서 제공하는 방법이 아닌 HttpServletRequest를 사용해야 할 필요성을
// 느끼지 못하기 때문에 이 부분은 참고용으로만 알아두자
/*
Authentication auth = (Authentication)request.getUserPrincipal();
String name = "";
if(auth == null){
	
}else{
	Object principal = auth.getPrincipal();
	if(principal != null && principal instanceof MemberInfo){
		name = ((MemberInfo)principal).getName();
	}
}
*/
%>
<div style="width:200px;float:left;">
	<sec:authorize access="isAnonymous()">
	<form id="loginfrm" name="loginfrm" method="POST" action="${ctx}/j_spring_security_check">
	<table>
		<tr>
			<td style="width:50px;">id</td>
			<td style="width:150px;">
				<input style="width:145px;" type="text" id="loginid" name="loginid" value="" />
			</td>
			
		</tr>
		<tr>
			<td>pwd</td>
			<td>
				<input style="width:145px;" type="text" id="loginpwd" name="loginpwd" value="" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" id="loginbtn" value="로그인" />
			</td>
		</tr>
	</table>
	</form>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
	<%=name%>님 반갑습니다<br/>
	<a href="${ctx}/j_spring_security_logout">로그아웃</a>
	</sec:authorize>
	<ul>
    	<sec:authorize access="hasRole('ROLE_ADMIN')">
        <li>관리자 화면</li>
        </sec:authorize>
        <sec:authorize access="permitAll">
        <li>비회원 게시판</li>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
        <li>준회원 게시판</li>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_MEMBER2', 'ROLE_ADMIN')">
        <li>정회원 게시판</li>
        </sec:authorize>
    </ul>
</div>

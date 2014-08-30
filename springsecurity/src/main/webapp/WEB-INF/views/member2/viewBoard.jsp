<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
	$("#btnReply").click(function(){
		var pidx = $("#idx").val();
		location.href="insertBoard.do?pidx=" + pidx;
	});
	
	$("#btnUpdate").click(function(){
		location.href="updateBoard.do?idx=${result.idx}";
	});
	
	$("#btnDelete").click(function(){
		if(confirm("현재 글을 삭제하시겠습니까?")){
			var delidx = $("#idx").val();
			
			// 배열처리를 한다(multiple 삭제와 호환이 되도록 함이다)
			var checkedItemsArray = new Array();
			checkedItemsArray.push(parseInt(delidx, 10));
			
			$.ajax({
	        	url : "/member2/deleteBoard.do",
	        	data : {idx : checkedItemsArray},
	        	dataType : "json",
	        	type : "POST",
	        	success:function(data, textStatus, jqXHR){
	        		var result = data;
	        		if(result.code == "0000"){
	    	    		alert("삭제되었습니다");
	    	    		location.href="getBoard.do";
	    	    	}else{
	    	    		var message = result.message;
	    	    		alert(message);
	    	    	}
	        	},
	        	error:function(jqXHR, textStatus, errorThrown){
	        		alert("삭제 오류입니다");
	        	}
			});
		}
	});
	
	$("#btnList").click(function(){
		history.go(-1);
	});
});


</script>    
</head>
<body>
<div style="display:inline-block;">
    <jsp:include page="/WEB-INF/views/include/leftmenu.jsp"></jsp:include> 
    <div style="float:right;">
    	정회원 상세보기
        <div>
	        <table>
	        	<colgroup>
	        		<col width="10%" />
	        		<col />
	        	</colgroup>
	        	<tbody>
					<tr>
						<td>제목</td>
						<td>
							${result.title}
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							${fn:replace(result.content, lf, "<br />")}
						</td>
					</tr>
	        	</tbody>
	        </table>
	        <input type="hidden" id="idx" value="${result.idx}"/>
        </div>
		<div align="center">
			<input type="button" id="btnReply" value="답변" />
			<input type="button" id="btnUpdate" value="수정" />
			<input type="button" id="btnDelete" value="삭제" />
			<input type="button" id="btnList" value="목록" />
		</div>
    </div>
</div>
<!-- 
<div>
	메시지 테스트1 : <spring:message code="ErrorCheck.testmsg" />
</div>
-->
</body>
</html>

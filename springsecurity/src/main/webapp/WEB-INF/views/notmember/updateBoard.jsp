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
	$("#btnReg").click(function(){
		if(validate()){
			// $("#regfrm").submit();
			var title = $("#title").val();
			var content = $("#content").val();
			var idx = $("#idx").val();
			
			$.ajax({
	        	url : "/notmember/updateBoard.do",
	        	data : {title : title, content : content, idx : idx},
	        	dataType : "json",
	        	type : "POST",
	        	success:function(data, textStatus, jqXHR){
	        		var result = data.result;
	        		if(result.code == "0000"){
	    	    		alert("수정되었습니다");
	    	    	}else{
	    	    		if(result.code == "4000"){
	    	    			var fieldValidateMap = result.fieldValidateMap;
	    	    			$.each(fieldValidateMap, function(key, value){
	    	    				if(key == "title"){
	    	    					$("#errorTitle").html(value);
	    	    				}
	    	    				
	    	    				if(key == "content"){
	    	    					$("#content").parent().append("<br>" + value);
	    	    					$("#errorContent").html(value);
	    	    				}
	    	    			});
	    	    		}else{
	    	    			var message = result.message;
	    	    			alert(message);
	    	    		}
	    	    	}
	        	},
	        	error:function(jqXHR, textStatus, errorThrown){
	        		alert("수정 오류입니다");
	        	}
	        	
	        });
		}	
	});
});

function validate(){
	
	if($("#title").val() == ""){
		alert("제목을 입력해주세요");
		$("#title").focus();
		return false;
	}
	
	if(!utf8Check($("#title").val(), "제목이 지정된 크기인 ", 100)){
		$("#title").focus();
		return false;
	}
	
	if($("#content").val() == ""){
		alert("내용을 입력해주세요");
		$("#content").focus();
		return false;
	}
	
	return true;
}


function utf8Check(val, msg, limitsize){
	var result = true;
	
   	var byte=0;
	var one_char="";
	for(var x=0; x<val.length; x++){
		one_char=val.charAt(x);
	    //utf-8이므로 3자를 더함, euc-kr이면 2를 더함
	    if(escape(one_char).length > 4)
	    	byte=byte+3;
	    else
	        byte++;
	}
	
	if(byte > limitsize){
		// alert(msg + " ( " + byte + "/" + limitsize + " )");
		alert(msg + limitsize + " byte보다 큽니다(현재 크기 : " + byte + " byte)");
		result = false;
	}else{
		result = true;
	}
	
	return result;
}
</script>    
</head>
<body>
<div style="display:inline-block;">
    <jsp:include page="/WEB-INF/views/include/leftmenu.jsp"></jsp:include> 
    <div style="float:right;">
    	비회원 글수정
    	<form id="regfrm" name="regfrm" method="POST">
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
							<input type="text" id="title" value="${result.title}" size="40" />
							<br/><span id="errorTitle"></span>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea id="content" rows="20" cols="80">${result.content}</textarea>
							<br/><span id="errorContent"></span>
						</td>
					</tr>
	        	</tbody>
	        </table>
	        <input type="hidden" id="idx" value="${result.idx}"/>
	        <input type="hidden" id="pidx" value="${result.pidx}" />
        </div>
		<div align="center">
			<input type="button" id="btnReg" value="수정" />
			<input type="reset" id="btnReset" value="재작성" />
		</div>
		</form>
    </div>
</div>
<!-- 
<div>
	메시지 테스트1 : <spring:message code="ErrorCheck.testmsg" />
</div>
-->
</body>
</html>

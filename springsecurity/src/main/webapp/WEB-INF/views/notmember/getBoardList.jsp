<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title></title>
<jsp:include page="/WEB-INF/views/include/jsInclude.jsp"></jsp:include> 
<script type="text/javascript">
$(document).ready(function () {

	$("#allchk").click(function(){
		$("input[name='delchk']").prop("checked", $("#allchk").is(":checked"));
	});
	
	$("#delBoard").click(function(){
		var checkeditems = $("input[name='delchk']:checked");
		var checkeditemslength = checkeditems.length;
		
		if(checkeditemslength == 0){
			alert("삭제할 항목을 선택해주세요");
		}else{
			if(confirm("선택된 글들을 삭제하시겠습니까")){
				var checkedItemsArray = new Array();
				$(checkeditems).each(function(){
					checkedItemsArray.push(parseInt($(this).val(), 10));
				});
					
				
				$.ajax({
		        	url : "${ctx}/notmember/deleteBoard.do",
		        	data : {idx : checkedItemsArray},
		        	dataType : "json",
		        	type : "POST",
		        	success:function(data, textStatus, jqXHR){
		        		var result = data;
		        		if(result.code == "0000"){
		    	    		alert("삭제되었습니다");
		    	    		location.href="${ctx}/notmember/getBoardList.do";
		    	    	}else{
		    	    		var message = result.message;
		    	    		alert(message);
		    	    	}
		        	},
		        	error:function(jqXHR, textStatus, errorThrown){
		        		alert("삭제에 실패했습니다");
		        	}
		        	
		        });
			}
		}
	});
	
	$("#searchtype").val("${search.searchtype}");
	
	$("#searchbtn").click(function(){
		if($("#vsearchtype").val() == 0){
			alert("검색 타입을 지정해주세요");
			$("#vsearchtype").focus();
		}else if(($("#vsearchtype").val() != 0) && ($("#vsearchword").val() == "")){
			alert("검색어를 입력해주세요");
			$("#vsearchword").focus();
		}else{
			$("#searchtype").val($("#vsearchtype").val());
			$("#searchword").val($("#vsearchword").val());
			$("#page_no").val("1");
			$("#searchfrm").submit();
		}
	});
});

function go_page(page_no){
	$("#page_no").val(page_no);
	$("#searchfrm").submit();
}

</script>
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
</head>
<body>
<div style="display:inline-block;">
    <jsp:include page="/WEB-INF/views/include/leftmenu.jsp"></jsp:include> 
    <div style="float:right;">
    	<div>
    		비회원 글목록
    		<form id="searchfrm">
    		<table>
    			<colgroup>
	        		<col width="10%" />
	        		<col width="20%" />
	        		<col width="10%" />
	        		<col />
	        		<col width="5%">
	        	</colgroup>
	        	<tbody>
	        		<tr>
	        			<td>검색종류</td>
	        			<td>
	        				<select id="vsearchtype" name="vsearchtype">
	        					<option value="0" <c:if test='${search.searchtype == 0}'>selected</c:if>>선택해주세요</option>
	        					<option value="1" <c:if test='${search.searchtype == 1}'>selected</c:if>>제목</option>
	        					<option value="2" <c:if test='${search.searchtype == 2}'>selected</c:if>>내용</option>
	        					<option value="3" <c:if test='${search.searchtype == 3}'>selected</c:if>>제목 + 내용</option>
	        				</select>
	        			</td>
	        			<td>검색어</td>
	        			<td>
	        				<input type="text" id="vsearchword" name="vsearchword" value="${search.searchword}" />
	        			</td>
	        			<td>
	        				<input type="button" id="searchbtn" name="searchbtn" value="검색" />
	        			</td>
	        		</tr>
	        	</tbody>
    		</table>
    		<input type="hidden" id="searchtype" name="searchtype" value="${search.searchtype}" />
    		<input type="hidden" id="searchword" name="searchword" value="${search.searchword}" />
    		<input type="hidden" id="page_no" name="page_no" value="${search.page_no}" />
    		<input type="hidden" id="page_size" name="page_size" value="${search.page_size}" />
    		</form>
	        <table>
	        	<colgroup>
	        		<col width="5%" />
	        		<col width="10%" />
	        		<col />
	        		<col width="15%" />
	        	</colgroup>
	        	<thead>
	        		<tr>
	        			<th><input type="checkbox" id="allchk" name="allchk" value="" /></th>
	        			<th>아이디</th>
	        			<th>제목</th>
	        			<th>등록일자</th>
	        		</tr>
	        	</thead>
	        	<tbody>
	        		<c:choose>
						<c:when test="${boardResult.total_cnt == 0}">			
						<tr style="text-align:center;">
							<td colspan="4" align="center">검색된 결과가 없습니다</td>
						</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="result" items="${boardResult.result}" varStatus="status">
								<tr>
									<td style="text-align:center">
										<input type="checkbox" name="delchk" value="<c:out value="${result.idx}"/>" />
									</td>
									<td style="text-align:center"><c:out value="${result.memid}"/></td>
									<td style="text-align:left">
										<c:forEach begin="2" end="${result.lvl}" step="1">
											&nbsp;&nbsp;
										</c:forEach>
										<c:if test="${result.lvl > 1}">
											[reicon]
										</c:if>
										<a href="viewBoard.do?idx=${result.idx}">
											<c:out value="${result.title}"/>
										</a>
									</td>
									<td style="text-align:center">${fn:substring(result.reg_date, 0, 10)}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
	        	</tbody>
	        </table>
        </div>
        <div align="center">
        	
        </div>
        <div align="right">
        	<a href="<c:url value="/notmember/insertBoard.do" />">등록</a>
        	<a href="#" id="delBoard">삭제</a>
        </div>
    </div>
</div>
</body>
</html>

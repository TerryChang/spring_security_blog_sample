var ctx = "";		// context path
/*
현재 보는 페이지의 URL을 로그인 페이지에 인자값으로 던져서 로그인 페이지를 보여주도록 한다
 */
function showLogin(){
	var showPath = location.pathname;
	var showSearch = location.search;
	var showUrl = "";
	
	if(showSearch == ""){
		showUrl = showPath;
	}else{
		showUrl = showPath = "?" + showSearch;
	}
	
	showUrl = encodeURIComponent(showUrl);
	
	location.href = ctx + "/login.do?loginRedirect=" + showUrl; 
}

/*
현재 보는 페이지의 URL을 로그인 페이지에 인자값으로 던져서 로그인 페이지를 보여주도록 한다
 */
function popupLogin(){
	var popUrl = ctx + "/loginPopup.do";	 //팝업창에 출력될 페이지 URL
	var popOption = "width=400, height=400, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
	window.open(popUrl,"",popOption);
}
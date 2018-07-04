<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap core CSS -->
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
    <link href="../resources/css/dashboard.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>MyBlog</title>
</head>
<body>
<script>
/* // Logout Timer 객체 정의
var LogOutTimer = function() {
  var S = {
            timer : null,
            limit : 1000 * 60 * 0.1,
            fnc   : function() {},
            start : function() {
                      S.timer = window.setTimeout(S.fnc, S.limit);
                    },
            reset : function() {
                      window.clearTimeout(S.timer);
                      S.start();
                    }
          };
  
document.onmousemove = function() { S.reset(); };
  
  return S;
}();

// 로그아웃 체크시간 설정
LogOutTimer.limit = 1000 * 60 * 0.1;

// 로그아웃 함수 설정
LogOutTimer.fnc = function() {
  alert("세션이 만료되어 자동 로그아웃처리 되었습니다.");
  location.href = "${pageContext.request.contextPath}/page/logoutPro?search="+search;
  
}

// 로그아웃 타이머 실행
LogOutTimer.start(); */

function Enter_Check(element) {
	console.log(element);
	
    // 엔터키의 코드는 13입니다.
	if(event.keyCode == 13) {
		console.log(element.value);
		var search = element.value
		if(search == ""){
			alert("검색 할 내용을 입력해 주세요.")
		}else{
		location.href = "${pageContext.request.contextPath}/page/searchPage?search="+search;
		//"location.href='${pageContext.request.contextPath}/page/mainImage'";  // 실행할 이벤트
		}
	}
}
    
$(document).ready(function() {
    $(".dropdown-toggle").dropdown();
});

</script>
<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
	<div class="collapse navbar-collapse" id="navbarColor03">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	    	<a class="nav-link" href="${pageContext.request.contextPath}/page/main">Home <span class="sr-only">(current)</span></a> 
	      </li>
	   <!--    <li class="nav-item">
	        <a class="nav-link" href="#">mypage</a>
	      </li> -->
	    </ul>
	     
	  <!--  <a class="nav-link" href="#">mypage</a> -->
	   <input class="form-control w-100 col-sm-3 col-md-2 mr-0"  type="text" name="search" onkeydown="Enter_Check(this);" placeholder="Search" aria-label="Search">
	  <a class="nav-link" href="${pageContext.request.contextPath}/page/logoutPro">Logout</a>	
	</div>
</nav>

 <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky padding-left px-4">
	            <ul class="nav flex-column">
		          	<div class="border-bottom m-4 text-center">
				         <!--  <img class="rounded-circle" src="../resources/imgs/3댕댕.jpg" alt="Generic placeholder image" width="140" height="140"> -->
				         <c:if test="${empty profile}">
				                <img class="rounded-circle" src="${pageContext.servletContext.contextPath}/resources/imgs/x.png" width="150" height="150">
				         </c:if>
				             
				              <c:if test="${not empty profile}">
				                <img src="${pageContext.servletContext.contextPath}/fileSave/${profile}" style="width:100%; max-height: 200px;">
				             </c:if>
				          <h3><a class="nav-link" href="#">${name}</a></h3>
				          <!-- <p>오늘도 파이팅!</p> -->
				          <!-- <a class="nav-link">Mypage</a> -->
			          </div>
			          
				<!-- 게시판 목록 -->
					<li class="nav-item">
		  	        	<a class="nav-link active">
					    	<span data-feather="layers"></span>
					       	목록 <span class="sr-only">(current)</span>
						</a>
					</li>
					<c:if test="${fn:length(boardList) > 0}">	
						<c:forEach var="li" items="${boardList}" varStatus="loop">
				            <li class="nav-item">
						    	<a class="nav-link" href="${pageContext.request.contextPath}/board/board1?num=${li.board_num}">
						        	<span data-feather="file-text"></span>
						            	${li.board_name}
						        </a>
						    </li>
						</c:forEach>
					</c:if>       
	
					<li class="nav-item dropdown">
					    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
					 	    <span data-feather="home"></span>관리</a>
						<div class="dropdown-menu">
					      <a class="dropdown-item small" href="${pageContext.request.contextPath}/board/mgPage" style="color: black;">카테고리 관리</a>
					      <div class="dropdown-divider"></div>
						  <a class="dropdown-item small" href="${pageContext.request.contextPath}/member/myPage" style="color: black;">계정 관리</a>	<!-- dropdown-item-text >> 링크 -->
						</div>
					</li>
			  
			  		<li>
<!--   <div class="search-container">
    <form action="/action_page.php">
      <input type="text" placeholder="Search.." name="search">
      <button type="submit"><i class="fa fa-search" style="font-size:18px"></i></button>
    </form>
  </div> -->
					</li>
				</ul>
  			</div>
		</nav>
	</div>
</div>
    

 <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
</body>
</html>


 <!-- <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
      <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Company name</a>
      <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="#">Sign out</a>
        </li>
      </ul>
    </nav>
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 	<!-- Bootstrap core CSS -->
   <!--  <link href="../resources/css/bootstrap.min.css" rel="stylesheet"> -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
     <!-- Custom styles for this template -->
    <link href="../resources/css/blog_post.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
	<div class="collapse navbar-collapse" id="navbarColor03">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="${pageContext.request.contextPath}/page/main">Home <span class="sr-only">(current)</span></a>
	      </li>
	    </ul>
	     <input class="form-control w-100 col-sm-3 col-md-2 mr-0"  type="text" name="search" onkeydown="Enter_Check(this);" placeholder="Search" aria-label="Search">
	    <a class="nav-link" href="${pageContext.request.contextPath}/page/logoutPro">Logout</a>	
	</div>
</nav>

<!-- <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center border-bottom m-4">
        	 <h1 class="h2">---</h1> 
</div> -->

<div class="container">
	<form class="form-horizontal" action="writePostPro" method="post">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center border-bottom m-3">
			<strong>제목</strong> <input class="form-control" name= "subject" placeholder="title">
			<input type="hidden" class="form-control" name="board_num" value="${board_num}">
			<input type="hidden" class="form-control" name="writer" value="${email}">
		</div>
		 <div class="form-group">
		 	<div class="col-sm-12">
				<textarea id="summernote" name="content"></textarea>
				<!-- <textarea name="content" id="content" class="summernote"></textarea> -->
		    </div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
		 		<button type="button" class="btn btn-light" onclick="window.location='../board/board1?num=${board_num}'">이전</button>
		        <button type="submit" class="btn btn-warning" onclick="contentDB()">등록</button>
		       <!--  <button type="button" class="btn btn-warning" onclick="contentDB()">dd등록</button> -->
			</div>
		</div>
	</form>
</div>

<div id="test">
</div>

<script type="text/javascript">
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

    $('#summernote').summernote({
      placeholder: '내용을 입력해 주세요.',
      height: 500,          // 기본 높이값
      minHeight: null,      // 최소 높이값(null은 제한 없음)
      maxHeight: null,      // 최대 높이값(null은 제한 없음)
      /* focus: true,          // 페이지가 열릴때 포커스를 지정함 */
      lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
    });
    
    function contentDB(){
    	var content = $('#summernote').summernote('code');
    	$('#summernote').html(content);
    	
    	console.log(content);
    }
    
</script>
    
</body>
</html>

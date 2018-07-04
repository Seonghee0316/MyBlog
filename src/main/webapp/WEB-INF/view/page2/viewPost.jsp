<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <!-- Bootstrap core CSS -->
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../resources/css/blog_post.css" rel="stylesheet">
</head>
<body>
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
</script>
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
    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-12">
			<div class="mt-4">> <strong><a style="color: #4777A9;" href="board1?num=${article.board_num}">${article.board_name}</a></strong></div>
          <!-- Title -->
          <h2 class="mt-1"><strong>${article.subject}</strong></h2>
		
          <!-- Author -->
          <div class="lead font-italic">             
            by ${name} <!-- 닉네임 or 이메일 -->
            <!-- <a href="#">Start Bootstrap</a> -->
          </div>

	<div align="right" class="font-italic">
		Posted on ${article.regdate}
	</div>
          <hr>

          <!-- Post Content -->
          ${article.content}
 <hr>
        </div>
<div>
<ul class="nav justify-content-center" style="margin-bottom: 1rem;">
  <li class="nav-item">
    <a class="nav-link" href="board1?num=${article.board_num}">목록</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="updatePost?posts_num=${article.posts_num}">수정</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#" data-toggle="modal" data-target="#deleteModal">삭제</a>
  </li>
</ul>
</div>

</div>
    </div>
    <!-- /.container -->
<!-- 글 삭제 modal-->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">		<!-- modal-dialog-centered 추가하면 modal 가운데로 떨어짐 -->
    <div class="modal-content" align="center">
      <div class="modal-body">
       <form action="deletePost" method="post">
          <div class="form-group">
          	<input type="hidden" name="board_num" value="${article.board_num}" required>
          	<input type="hidden" name="posts_num" value="${article.posts_num}" required>
         			 글을 삭제하시겠습니까?
          </div>
          <button  class="btn btn-danger" class="close" data-dismiss="modal">No</button>
          <button  type="submit" class="btn btn-warning">Yes</button>
		</form>
      </div>
    </div>
  </div>
</div>


    <!-- Bootstrap core JavaScript -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="../resources/js/bootstrap.bundle.min.js"></script>

</body>
</html>

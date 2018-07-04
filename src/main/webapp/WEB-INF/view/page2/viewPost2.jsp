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
 
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
	<div class="collapse navbar-collapse" id="navbarColor03">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="${pageContext.request.contextPath}/page/main">Home <span class="sr-only">(current)</span></a>
	      </li>
	    </ul>
	    <a class="nav-link" href="${pageContext.request.contextPath}/page/logoutPro">Logout</a>	
	</div>
</nav>

<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center border-bottom m-4">
        	 <h1 class="h2">---</h1> 
</div>

<div class="container-fluid">
<h4 style="color: black;" >제목: <strong>${article.subject}</strong></h4> ${article.regdate}
    					<div class="list-group-item list-group-itipsisem-action ">
							 <p class="col-12 text-truncate p-0">${article.content}</p>
							
						</div>
						
		 		<button type="button" class="btn btn-light" onclick="window.location='../board/board1?num=${board_num}'">취소</button>
		        <button type="submit" class="btn btn-warning" onclick="contentDB()">등록dfsdffds</button>

		</div>  

<script type="text/javascript">

    
</script>
    
</body>
</html>

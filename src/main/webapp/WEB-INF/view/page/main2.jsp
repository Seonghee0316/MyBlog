<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="icon" href="../../../../favicon.ico">
<title>Insert title here</title>
 <!-- Bootstrap core CSS -->
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../resources/css/dashboard.css" rel="stylesheet">
</head>
<body>

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
	              <li class="nav-item">
	                <a class="nav-link active" href="#">
	                  <span data-feather="layers"></span>
	             	     목록 <span class="sr-only">(current)</span>
	                </a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="${pageContext.request.contextPath}/board/board1">
	                  <span data-feather="file-text"></span>
	             	     게시판
	                </a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="#">
	                  <span data-feather="shopping-cart"></span>
	             	     쇼핑목록
	                </a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="#">
	                  <span data-feather="users"></span>
	           	       방명록
	                </a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="#">
	                  <span data-feather="bar-chart-2"></span>
	              	    통계
	                </a>
	              </li>
	              <li class="nav-item">
	                <a class="nav-link" href="#">
	                  <span data-feather="home"></span>
	               	   관리
	                </a>
	              </li>
	            </ul>
		</div>
	</nav>
</div>
          <!--   <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
              <span>Saved reports</span>
              <a class="d-flex align-items-center text-muted" href="#">
                <span data-feather="plus-circle"></span>
              </a>
            </h6>
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Current month
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file"></span>
                  Last quarter
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Social engagement
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Year-end sale
                </a>
              </li>
            </ul> -->
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10">
        	
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center border-bottom m-5">
            <h1 class="h2">최근 글</h1>
            <div class="btn-toolbar mb-2 mb-md-0">
              <div class="btn-group mr-2">
                <button class="btn btn-sm btn-outline-secondary">글</button>
                <button class="btn btn-sm btn-outline-secondary">사진</button>
              </div>
              <button class="btn btn-sm btn-outline-secondary dropdown-toggle">
                <span data-feather="calendar"></span>
                This week
              </button>
              
            </div>
          </div>
        <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../resources/js/bootstrap.js"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>
</body>
</html>
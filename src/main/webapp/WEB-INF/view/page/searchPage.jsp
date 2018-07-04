<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../resources/css/mycss.css" rel="stylesheet"/>
<title>MyBlog</title>
</head>

<script type="text/javascript">
// article의 IMG 태그와 그 이하의 element를 모두 제거합니다.
function RemoveIMG() {
	// img 태그를 가진 부모들을 가져옵니다.
	var parents = document.getElementsByName("articleParent");
	
	for(i = 0; i < parents.length; i++) {
		// parents가 각각 가지는 img 태그를 가져옵니다.
		var imgChildren = parents[i].getElementsByTagName("img");
		var pClildren = parents[i].getElementsByTagName("div");
		
		// img 태그를 순회하면서 부모 node에게 제거하도록 합니다.
		for(j = 0; j < imgChildren.length; j++) {
			console.log(imgChildren[j].innerHTML);
			
			// img element의 부모 node(parentNode)에게 img element를 제거하도록 합니다.
			imgChildren[j].parentNode.removeChild(imgChildren[j]);
		}
		
		console.log(pClildren[0]);
		/* pClildren[0].styleName += "display:inline-block;width:10px"; */
		/* pClildren[0].className += "col-12 text-truncate p-0"; */
		
		
		// 숨겨왔던 parent 보여줍니다.
		parents[i].style.display = "block";
	}
}
</script>

<body>

   <main role="main" class="col-md-9 ml-sm-auto col-lg-10">
   		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center border-bottom m-5">
        	<h1 class="h2"><strong> > '<span style="color: gray;">${search}</span>' 검색 결과 (${searchCount})</strong></h1>
   		</div>
		<div class="container-fluid">		
			<div class="list-group">
				<!-- <a href="#" class="list-group-item list-group-item-action">
					<h4>제목</h4>
					<p>내용</p>
					<p>날짜</p>
				</a> -->
				<c:if test="${searchCount == 0}">
	 				<a href="#" class="list-group-item list-group-item-action">
						해당 조건의 글이 존재하지 않습니다.
					</a> 
				</c:if>
				
				<c:if test="${searchCount > 0 }">
    				<c:forEach var="article" items="${searchList}">
    					<div name="articleParent" onclick="location.href='${pageContext.request.contextPath}/board/viewPost?board_num=${article.board_num}&post_num=${article.posts_num}'" style="display:none" class="list-group-item list-group-itipsisem-action">
							<h4 style="color: black;" ><strong>${article.subject}</strong></h4>
							<p name="articleContent"><div style="/* display:inline-block; */width:auto;height:20px; overflow:hidden;/* overflow: ellipsis; */">${article.content}</div></p>
							<%-- <p class="col-12 text-truncate p-0">${article.content}</p> --%>
							<p><small><span style="color: #555E7B;"><strong>${article.board_name}</strong></span><span class="txt_bar"></span>${article.regdate}</small></p>
						</div>
					</c:forEach>
 				 </c:if>
			</div>
		</div>  
		
		
		<!-- page 처리 -->
		<c:if test="${searchCount>0}">
			<p>
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			  
		 	<c:if test="${startPage>bottomLine}"> 
				<li class="page-item">
			      <a class="page-link" href="searchPage?pageNum=${startPage-bottomLine}&search=${search}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			        <span class="sr-only">Previous</span>
			      </a>
			    </li>
		 	</c:if> 
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i!=currentPage }">  
					<li class="page-item">
						<a class="page-link"  href="searchPage?pageNum=${i}&search=${search}">${i}</a>
					</li>
				</c:if>
				<c:if test="${i==currentPage }">  
					 <li class="page-item active">
					 	<a class="page-link" href="searchPage?pageNum=${i}&search=${search}">${i}</a>
					 </li>
				</c:if>
			</c:forEach>
		 	<c:if test="${endPage<pageCount }"> 
				<li class="page-item">
			      <a class="page-link" href="searchPage?pageNum=${startPage+bottomLine}&search=${search}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			        <span class="sr-only">Next</span>
			      </a>
			    </li>
			</c:if>
			  </ul>
			</nav>
			</p>
		</c:if>		
		
	</main>




<script>
$( document ).ready(RemoveIMG());
</script>

 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../resources/js/bootstrap.js"></script>
    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
</body>
</html>
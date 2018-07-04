<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="icon" href="../../../../favicon.ico">
<title>MyBlog</title>
 <!-- Bootstrap core CSS -->
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../resources/css/dashboard.css" rel="stylesheet">
    <link href="../resources/css/mycss.css" rel="stylesheet"/>
</head>
<script type="text/javascript">
function categorySelect(){
	var value=$("#inputGroupSelect option:selected").val();
	if(value == "-1"){
		alert("카테고리를 선택해주세요.");
	}else{
		location.href = "${pageContext.request.contextPath}/board/writePost?board_num="+value;
	}
}

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
            <h1 class="h2"><strong>최근 글</strong></h1>
            <div class="input-group col-md-4">
			  <select class="custom-select" id="inputGroupSelect">
			    <option selected value= -1>카테고리 선택</option>
			    <c:if test="${fn:length(boardList) > 0}">	
					<c:forEach var="li" items="${boardList}" varStatus="loop">
					    <option value="${li.board_num}">${li.board_name}</option>
				    </c:forEach>
			    </c:if>
			  </select>
			  <div class="input-group-append">
			    <button class="btn btn-outline-primary" type="button" onclick=categorySelect();>글쓰기</button>
			  </div>
			</div>
     <%--        <button type="button" class="btn btn-warning" onclick="location.href='writePost?board_num=${board_num}'">글쓰기</button> --%>
<%--             <div class="btn-toolbar mb-2 mb-md-0">
              <div class="btn-group mr-2">
                <button class="btn btn-sm btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/page/main'">글</button>
                <button class="btn btn-sm btn-outline-secondary" onclick="location.href='${pageContext.request.contextPath}/page/mainImage'">사진</button>
              </div>
              
            </div> --%>
          </div>
          
        <div class="container-fluid">		
			<div class="list-group">
				<c:if test="${count== 0}">
	 				<a href="#" class="list-group-item list-group-item-action">
						글이 존재하지 않습니다.
					</a> 
				</c:if>
				
				<c:if test="${count!=0 }">
    				<c:forEach var="article" items="${mainList}">
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
    <script>
      feather.replace()
    </script>
</body>
</html>
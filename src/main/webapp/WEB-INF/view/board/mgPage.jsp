<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyBlog</title>
<!-- Bootstrap core CSS -->
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
    <link href="../resources/css/dashboard.css" rel="stylesheet">
</head>
<body>
 	<main role="main" class="col-md-9 ml-sm-auto col-lg-10">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center border-bottom m-5">
	    	<h1 class="h2"><strong> > 카테고리 관리</strong></h1>
	   </div>
	          
		<div class="d-flex flex-column flex-wrap flex-md-nowrap m-5">
			<div class="my-3 p-3 bg-white rounded box-shadow">
        <h6 class="border-bottom border-gray pb-2 mb-0">전체보기 (${count}/10)</h6>
		
			<c:choose>	
				<c:when test="${count==0}">
					<div class="w3-center w3-padding-top">
					<table class="w3-table table-bordered w3-center" width="100%">
					<tr  >
					<td class="w3-center w3-padding"><br>
					<span class="w3-tag w3-white w3-border">카테고리를 생성해주세요.</span><br><br></td>
					</tr>
					</table>
					</div>
				</c:when>	
			
				<c:when test="${count>0 && count<=10}">
					 <c:forEach var="li" items="${articleList}" varStatus="loop">
				       	  <div class="media text-muted pt-3">
					          <img data-src="holder.js/32x32?theme=thumb&bg=007bff&fg=007bff&size=1" alt="" class="mr-2 rounded">
					            
					          <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					        
					            <div class="d-flex justify-content-between align-items-center w-100">
					             
					             <%-- <strong id="c_${loop.index}" class="text-gray-dark">${li.board_name}</strong>--%>
					              <strong class="text-gray-dark">${li.board_name}</strong>	<!-- a태그로 감싸도 됌. -->
					              
					              <div class="row">
						              	<a href="#" data-toggle="modal" data-target="#nameModal" onClick="getCategoryIndex('${li.board_num}', '${li.board_name}')">수정</a> 
						              	&nbsp; &nbsp;
						               	<a href="#" data-toggle="modal" data-target="#deleteModal" onClick="getCategoryIndex('${li.board_num}')">삭제</a>
						               	&nbsp; &nbsp; &nbsp; 
					              </div>	
					        
					            </div>
					          </div>
				        	</div>
				  		 </c:forEach>
			 </c:when> 
		 </c:choose> 
        <small class="d-block text-right mt-3">
          <a data-toggle="modal" data-target="#exampleModal" href="#" onclick="addCotegory(${count})">+ 카테고리 추가</a>
        </small>
      </div>
		</div>
	</main>

 <c:if test="${count<10}">
<!--카테고리 추가 Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"> > 카테고리</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <form action="addBoard" method="post">
          <div class="form-group">
            <input type="text" class="form-control" id="board_name1" name="board_name" placeholder="이름" required>
          </div>
          <div align="right">
          <button type="submit" class="btn btn-warning">추가</button>
          </div>
          </form>
      </div>
    </div>
  </div>
</div>
</c:if>

<!-- 카테고리 수정 Modal -->
<div class="modal fade" id="nameModal" tabindex="-1" role="dialog" aria-labelledby="nameModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="nameModalLabel"> > 카테고리</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <form action="updateBoard" method="post">
          <div class="form-group">
          	<input type="hidden" id="board_num" name="board_num" required>
            <input type="text" class="form-control" id="board_name2" name="board_name" placeholder="이름" required>
          </div>
          <div align="right">
          <button type="submit" class="btn btn-warning">수정</button>
          </div>
          </form>
      </div>
    </div>
  </div>
</div>

<!-- 카테고리 삭제 modal-->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">		<!-- modal-dialog-centered 추가하면 modal 가운데로 떨어짐 -->
    <div class="modal-content" align="center">
      <div class="modal-body">
       <form action="deleteBoard" method="post">
          <div class="form-group">
          	<input type="hidden" id="delete_num" name="board_num" required>
         			 카테고리를 삭제하시겠습니까?
          </div>
          <button  class="btn btn-danger" class="close" data-dismiss="modal">No</button>
          <button  type="submit" class="btn btn-warning">Yes</button>
		</form>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
 function addCotegory(count) {
	if(count >= 10){
		/* $('#exampleModal').modal('hide'); */
		alert("카테고리는 10개까지 생성 가능합니다.");
	}
}
 
 function getCategoryIndex(categoryNum, categoryName) {
	 console.log(categoryNum);
	 console.log(categoryName);
	 console.log(document.getElementById("board_name2"));
	 document.getElementById("board_name2").value = categoryName;
	 document.getElementById("board_num").value = categoryNum;
	 
	 document.getElementById("delete_num").value = categoryNum;
 }
 
/* //게시판 이름 수 제한
 $('#add'){
    if($('#board_name1').val().length > 20){
	    	  alert("20글자 이하로 적어주세요.");
            $('#board_name1').focus();
  	 }
 } */
 
</script>

 <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script type="text/javascript" src="../resources/js/bootstrap.js"></script>

  
</body>
</html>
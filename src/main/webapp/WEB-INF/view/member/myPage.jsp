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
<script>
function deregisterModal(){
/* 	$('#deleteModal').on('hidden', function () {
		  // Load up a new modal...
		  $('#deleteModal2').modal('show')
		}) */
	$('#deleteModal').modal('hide');	
	 $('#deleteModal2').modal('show')
		
}



/* $('#deleteModal').on('hidden.bs.modal', function (e) {
	  // do something...
	}) */
</script>
<body>
 	<main role="main" class="col-md-9 ml-sm-auto col-lg-10">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center border-bottom m-5">
	    	<h1 class="h2"><strong> > 계정 관리</strong></h1>
	   	</div>
	   	<div class="d-flex flex-column flex-wrap flex-md-nowrap m-5">
	    	<form id="myPageUp" action="myPageUp" method="post" enctype="multipart/form-data">
					 <input type="hidden" name="num" value= ${li.num}>
					 <input type="hidden" name="profile" value=${li.profile}>
				  <div class="form-group">
				  	<label for="inputEmail"><strong>이메일</strong></label>
					    <input class="form-control" id= "email"  name="email" value=${li.email}  disabled="disabled">
				 </div>
				  
<!-- 				<div class="form-row">
					<div class="form-group col-md-6">
				      <label for="inputEmail4">비밀번호</label>
				      <input type="password" class="form-control" name="pwd" value=${li.pwd} id= "pwd" placeholder="Password" required="required">
				    </div>
				    <div class="form-group col-md-6">
				      <label for="inputPassword4">비밀번호 확인</label>
				      <input type="password" class="form-control" name="confirmPwd" id="confirmPwd" placeholder="Password" required="required">
				    </div>
				  </div> -->
				  <div class="form-group">
				    <label for="inputAddress"><strong>닉네임</strong></label>
				    <input type="text" class="form-control" name="name" value="${li.name}" placeholder="Nickname" required="required">
				  </div>
				  

				
				 <div class="form-group">
				    <label for="exampleFormControlFile1"><strong>*프로필 사진</strong></label>
				    <div id="profile_preview">
						<c:if test="${(li.profile!=null)&&(li.profile!='')}">
						<img src="<%=request.getContextPath() %>/fileSave/${li.profile}" id="preview" width="150" height="150">
						</c:if>
						<c:if test="${(li.profile==null)||(li.profile=='') }">
						<img src="${pageContext.servletContext.contextPath}/resources/imgs/x.png" id="preview" width="150" height="150">
						</c:if>
					</div>
					
					<div class="p-1">
				    <input type="file" id="profileUp" class="form-control-file" name="profileimage">
				  	</div> 
				  </div>
				
				 <div class="text-center p-5">
				  <button type="submit" class="btn btn-warning">수정</button> 
				</div>
				</form>
		<div class="row">
			<a class="nav-link" href="" data-toggle="modal" data-target="#deleteModal">myblog 탈퇴하기</a>
<!-- 			<a class="nav-link" >|</a> -->
			<a class="nav-link" href="" data-toggle="modal" data-target="#changePwModal">비밀번호 변경</a>
		</div>
	        </div>  
	</main>

<!-- 회원 탈퇴-->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel2" aria-hidden="true">
  <div class="modal-dialog" role="document">		<!-- modal-dialog-centered 추가하면 modal 가운데로 떨어짐 -->
    <div class="modal-content" align="center">
      <div class="modal-body">
       <form action="deregister" method="post">
          <div class="form-group">
          	<input type="hidden" name="board_num" value="${article.board_num}" required>
          	<input type="hidden" name="posts_num" value="${article.posts_num}" required>
         	정말 탈퇴하시겠습니까?
          </div>
          <button  class="btn btn-warning" class="close" data-dismiss="modal">No</button> &nbsp;
          <button  class="btn btn-danger" data-dismiss="modal" onclick="deregisterModal()">Yes</button>
		</form>
      </div>
    </div>
  </div>
</div>

<!-- 회원 탈퇴 비밀번호 확인-->
	<div class="modal fade" id="deleteModal2" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">		<!-- modal-dialog-centered 추가하면 modal 가운데로 떨어짐 -->
    <div class="modal-content" align="center">
      <div class="modal-body">
       <form action="deregister" method="post">
          <div class="form-group">
          	<input type="hidden" name="num" value="${li.num}" required>
          	 <div class="form-group">
          	<label for="inputEmail4"><strong>비밀번호를 입력하세요.</strong></label>
			<input type="password" class="form-control" name="pwd" id= "confirmPwd" placeholder="Password" required="required">
			</div>
         	* 탈퇴시 모든 데이터가 파기되오니 신중히 결정해 주세요.
         	<!-- 정말 탈퇴하시겠습니까? -->
          </div>
         <!--  <button  class="btn btn-danger" data-dismiss="modal" onclick="document.getElementById('deleteModal2').style.display='block'">입력</button> -->
          <button type="submit" class="btn btn-danger">탈퇴</button>
		</form>
      </div>
    </div>
  </div>
</div>

<!-- 비밀번호 변경-->
	<div class="modal fade" id="changePwModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">		<!-- modal-dialog-centered 추가하면 modal 가운데로 떨어짐 -->
    <div class="modal-content">
      <div class="modal-body">
       <form action="changePw" method="post">
          <div class="form-group">
          	<input type="hidden" name="num" value="${li.num}" required>
          	 <div class="form-group">
          	<li><label for="inputEmail4"><strong>현재 비밀번호를 입력하세요.</strong></label></li>
			<input type="password" class="form-control" name="currentPwd" id= "currentPwd" placeholder="Password" required="required">
			</div>
			
			<li><label for="inputEmail4"><strong>변경할 비밀번호를 입력하세요.</strong></label></li>
			<div class="form-row">
			 <div class="form-group col-md-6">
				<input type="password" class="form-control" name="changePwd" id= "changePwd" placeholder="Password" required="required">
			</div>

			<div class="form-group col-md-6">
				<input type="password" class="form-control" name="confirmchangePwd" id= "confirmchangePwd" placeholder="Password" required="required">
			</div>
		</div>
         	<!-- 정말 탈퇴하시겠습니까? -->
          </div>
          <div align="center">
           <button  class="btn btn-warning" class="close" data-dismiss="modal">취소</button> &nbsp;
          	<button type="submit" class="btn btn-danger">변경</button>
          </div>
		</form>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	//탈퇴 비밀번호 입력하고 모달 close해도 남아있는 input값 삭제(초기화)
	$('#deleteModal2').on('hidden.bs.modal', function (e) {
/* 	    console.log('modal close'); */
	  $(this).find('form')[0].reset()
	});

	//비밀번호 변경 폼 초기화
	$('#changePwModal').on('hidden.bs.modal', function (e) {
	  $(this).find('form')[0].reset()
	});
	
	 //비밀번호 확인
	   $('#confirmPwd').blur(function(){
	      if($('#confirmPwd').val() != ${li.pwd}){	    	  
	    	  if($('#confirmPwd').val()!=''){
		    	  alert("비밀번호가 일치하지 않습니다.");
	    		  $('#confirmPwd').val('');
	              $('#confirmPwd').focus();
	    	  }
	      }
	   })
	   
	   //현재 비밀번호 확인
	   $('#currentPwd').blur(function(){
		      if($('#currentPwd').val() != ${li.pwd}){	    	  
		    	  if($('#currentPwd').val()!=''){
			    	  alert("비밀번호가 일치하지 않습니다.");
		    		  $('#currentPwd').val('');
		              $('#currentPwd').focus();
		    	  }
		      }
		   })
		//비밀번호 변경 확인
	   $('#changePwd').blur(function(){
		      if($('#changePwd').val() == ${li.pwd}){	    	  
			    	  alert("입력한 비밀번호가 이전 비밀번호와 같습니다.");
		    		  $('#changePwd').val('');
		              $('#changePwd').focus();
		      }
		   })	
		   
	//비밀번호 변경 확인
	   $('#confirmchangePwd').blur(function(){
		      if($('#changePwd').val() != $('#confirmchangePwd').val()){	    	  
		    	  if($('#confirmchangePwd').val()!=''){
			    	  alert("비밀번호가 일치하지 않습니다.");
		    		  $('#confirmchangePwd').val('');
		              $('#confirmchangePwd').focus();
		    	  }
		      }
		   })	   
});
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
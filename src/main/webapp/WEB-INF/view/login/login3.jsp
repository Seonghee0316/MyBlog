<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" href="../../../../favicon.ico">
 	<!-- Bootstrap core CSS -->
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="../resources/css/signin.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<title>Insert title here</title>
</head>
 <body>
	<script type="text/javascript">
//아이디 중복체크
		$(function(){
		   $('#email').blur(function(){
			   
		      $.ajax({
		         type:"POST",
		         url:"emailCheck",
		         data:{
		            "email":$('#email').val() //m_id 
		         },
		         success:function(data){	//data : checkSignup에서 넘겨준 결과값
		            if(data==false){
		               if($('#email').val()!=''){ //입력한 값이 있을때만 (값이 없는경우에도 경고창이 나와서 해줌)
		               alert("사용가능한 아이디입니다.");
		               }
		            }else{
		               if($('#email').val()!=''){
		                  alert("중복된 아이디입니다.");
		                  $('#email').val('');
		                  $('#email').focus();
		               }
		            }
		         }
		      })
		      
		   })
		   
		   //비밀번호 확인
		   $('#confirmPwd').blur(function(){
		      if($('#pwd').val() != $('#confirmPwd').val()){
		    	  if($('#confirmPwd').val()!=''){
			    	  alert("비밀번호가 일치하지 않습니다.");
		    		  $('#confirmPwd').val('');
		              $('#confirmPwd').focus();
		    	  }
		      }
		   })
		   	   
		});
</script>

    <form class="form-signin text-center" action="loginPro" method="post">
    <h1 class="text-success">My blog</h1> <!--muted:연회색 -->
      
      <h1 class="h3 mb-3 font-weight-normal"></h1>
      <label for="inputEmail" class="sr-only">Email address</label>
      <input type="email" name="email" class="form-control" placeholder="Email address" required autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" name="pwd" class="form-control" placeholder="Password" required>
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div>
      <button class="btn btn-lg btn-success btn-block" type="submit">Sign in</button> <!-- dark: 진 회색 -->
      <div class="btn-group">
      	<button type="button" class="btn btn-link" data-toggle="modal" data-target="#myModal">회원가입</button>
  		<button type="button" class="btn btn-link">비밀번호 찾기</button>		
      </div>
    </form>
    
  <!-- 회원가입 폼 -->  		
	<div class="modal fade bd-example-modal-lg" tabindex="-1" id="myModal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header  bg-transparent text-dark">
	        <h5 class="modal-title">회원 가입</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
			<form name="joinForm" action="joinPro" method="post" enctype="multipart/form-data">
			<%-- <input type="hidden" name="num" value="${num}"> --%>
				  <div class="form-group">
				  	<label for="inputEmail">이메일</label>
					    <input type="email" class="form-control" id= "email"  name="email" placeholder="email" required="required">
				 </div>
				  
				<div class="form-row">
					<div class="form-group col-md-6">
				      <label for="inputEmail4">비밀번호</label>
				      <input type="password" class="form-control" name="pwd" id= "pwd" placeholder="Password" required="required">
				    </div>
				    <div class="form-group col-md-6">
				      <label for="inputPassword4">비밀번호 확인</label>
				      <input type="password" class="form-control" name="confirmPwd" id="confirmPwd" placeholder="Password" required="required">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputAddress">닉네임</label>
				    <input type="text" class="form-control" name="name" placeholder="Nickname" required="required">
				  </div>
				  
				  <div class="form-row">
					<div class="form-group col-md-6">
				      <p>성별</p>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender" id="exampleRadios1" value=0 checked>
							 <label class="form-check-label" for="exampleRadios1">
							   여
							 </label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender" id="exampleRadios2" value=1>
							 <label class="form-check-label" for="exampleRadios2">
							    남
							 </label>
						</div>
				  </div>
				  <div class="form-group col-md-6">
				      <label for="inputPassword4">생일</label>
				      <input type="date" class="form-control" name="birthday" placeholder="birthday">
				    </div>
				</div>	
				
				 <div class="form-group">
				    <label for="exampleFormControlFile1">*프로필 사진</label>
				    <input type="file" class="form-control-file" name="profileimage">
				  </div>
				
				 <div class="text-center">
				 <input type="button" value="이전" class="btn btn-light" OnClick="window.location='../member/login'">
				  <button type="submit" class="btn btn-warning">가입</button>
				  <input type="reset" value="새로고침" class="btn btn-light" >  
				</div> 
				</form>
	      </div>
	    </div>
	  </div>
	</div>



  </body>
</html>
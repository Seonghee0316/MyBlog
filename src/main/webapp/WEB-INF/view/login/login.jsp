<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <!--   <link rel="stylesheet" href="../resources/css/nanumgothic.css"> -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script type="text/javascript" src="../resources/js/bootstrap.js"></script>
    <script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<title>MyBlog</title>
</head>
 <body>
	

    <form class="form-signin text-center" action="loginPro" method="post">
    <h1 class="text-dark"><strong>My blog</strong></h1> <!--muted:연회색 -->
      
      <h1 class="h3 mb-3 font-weight-normal"></h1>
      <label for="inputEmail" class="sr-only">Email address</label>
      <input type="email" name="email" id="jemail" class="form-control" placeholder="Email address" required autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" name="pwd" class="form-control" placeholder="Password" required>
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" id="idSaveCheck"> Remember me
        </label>
      </div>
      <button class="btn btn-lg btn-dark btn-block" type="submit">Sign in</button> <!-- dark: 진 회색 -->
      <p></p>
      <div class="text-group">
      	<a  class="text-dark" data-toggle="modal" data-target="#myModal">회원가입</a> &nbsp;&nbsp;
  		<a  class="text-dark" data-toggle="modal" data-target="#forgetPw">비밀번호 찾기</a>		
      </div>
    </form>
    
  <!-- 회원가입 폼 -->  		
	<div class="modal fade bd-example-modal-lg" tabindex="-1" id="myModal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header  bg-transparent text-dark">
	        <h5 class="modal-title">회원 가입을 하시오</h5>
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
				      <input type="date" class="form-control" name="birthday" placeholder="birthday" required="required">
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

<!-- 비밀번호 찾기-->
	<div class="modal fade" id="forgetPw" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">		<!-- modal-dialog-centered 추가하면 modal 가운데로 떨어짐 -->
    <div class="modal-content">
      <div class="modal-body">
      
      <div align="center" style="display:none">
      <p id="noti"></p>
      	<button class="btn btn-warning" class="close" data-dismiss="modal" onclick="RestoreFindPW()">확인</button>
      </div>
      
       <form id="find_pw" method="post" onsubmit="return false;">
          <div class="form-group">
          	<input type="hidden" name="num" value="${li.num}" required>
          	 <div class="form-group">
          	<li><label for="inputEmail4"><strong>로그인 이메일을 입력하세요.</strong></label></li>
			<input type="email" class="form-control" id="inputEmail" name="email" placeholder="email" required="required">
			</div>
			
			<li><label for="inputEmail4"><strong>생년월일을 입력하세요.</strong></label></li>
			<div class="form-row">
			 <div class="form-group col-12">
				<input type="date" class="form-control" id="inputBirthday"  name="birthday" placeholder="birthday"  required="required">
			</div>

		</div>
          </div>
          <div align="center">
           <button  class="btn btn-warning" class="close" data-dismiss="modal">취소</button> &nbsp;
          	<button class="btn btn-danger" id="findBtn">찾기</button>
          </div>
		</form>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		var d = new Date();
	    var n = d.getTime();
		console.log(n)
		
		$('#forgetPw').on('hidden.bs.modal', function (e) {
			  $(this).find('form')[0].reset()
			});
		
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var userInputId = getCookie("userInputId");
	    $("input[id='jemail']").val(userInputId); 
	     
	    if($("input[id='jemail']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("input[id='jemail']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[id='jemail']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[id='jemail']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}	
	
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
		               alert("사용가능한 이메일입니다.");
		               }
		            }else{
		               if($('#email').val()!=''){
		                  alert("중복된 이메일입니다.");
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
		
$(function(){
	$("#findBtn").click(function(){
		$.ajax({
			type : "POST",
			url : "find_pw",
			data : {
				'email' : $("#inputEmail").val(),
				'birthday' : $("#inputBirthday").val()
			},
			success: function(result) {
				//console.log(result);
				if(result == 0){
					
					$("#noti").html("해당 회원이 존재하지 않습니다.");
				}else{
					$("#noti").html("이메일로 임시 비밀번호를 발송하였습니다.");
				}
				$("#find_pw").hide();
				$("#noti").parent().show();
				
			},
			error : function(request, status, error) {
				if (request.status == "200") {
					alert("no data")
				} else {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			}
		})
	});
})

function RestoreFindPW() {
	$("#find_pw").show();
	$("#noti").parent().hide();
	$('#find_pw').on('hidden.bs.modal', function (e) {
		  $(this).find('form')[0].reset()
		});
}
</script>
  </body>
</html>
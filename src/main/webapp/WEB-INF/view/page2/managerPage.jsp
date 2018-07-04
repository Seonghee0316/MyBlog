<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Bootstrap core CSS -->
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
		<link rel="stylesheet" type="text/css" href="../resources/css/searchPane.css">
		<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" language="javascript" src="../resources/js/searchPane.js"></script>
		<script type="text/javascript" src="../resources/js/bootstrap.js"></script>

<title>Insert title here</title>

</head>
<script type="text/javascript" charset="utf-8">
$(document).ready( function () {
	$('#example').DataTable( {
		searchPane: {
            container: '.searchPanes'
		}
	} );
} );

/* $(document).ready(function(){
	  var show_btn=$('.show-modal'); 
	    show_btn.click(function(){
	      $("#modal_member_info").modal('show');
	  })
	}); */
 
</script>
<body>
 
<a class="nav-link mt-2 ml-3" href="managerPage"><strong>관리자 페이지</strong></a>
<div class="mb-5 mr-5" align="right">
<%-- <a class="nav-link" href="${pageContext.request.contextPath}/page/logoutPro">Logout</a> --%>
<button class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/page/logoutPro'">Logout</button>	
</div>

<div class="container">
            <div class="searchGrid">
                <div class="searchTable">
                    <table id="example" class="display nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                            	<th>Num</th>
                                <th>Email</th>
                                <th>Name</th>
                                <th>Gender</th>
                                <th>Birthday</th>
                                <th>Joindate</th>
                                <th>Pofile</th>
                            </tr>
                        </thead>

                        <tfoot>
                          <tr>
                            	<th>Num</th>
                                <th>Email</th>
                                <th>Name</th>
                                <th>Gender</th>
                                <th>Birthday</th>
                                <th>Joindate</th>
                                <th>Pofile</th>
                            </tr>
                        </tfoot>

                        <tbody>
                        	<c:forEach var="member" items="${memberList}">
                        	
                            <tr id="a" class="show-modal">
                                <td id=num>${member.num}</td>
                                <td id=email>${member.email}</td>
                                <td id=name>${member.name}</td>
                                <td id=gender>${member.gender}</td>
                                <td id=birthday>${member.birthday}</td>
                                <td id=joindate>${member.joindate}</td>
                                <th id=profile>${member.profile}</th>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
              <!--   <div class="searchPanes"></div> -->
            </div>
		</div>
		
<%-- 		<!-- 회원 탈퇴-->
	<div class="modal fade" id="modal_member_info" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel2" aria-hidden="true">
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
</div> --%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<title>이메일 중복확인</title>
</head>
<body>
<c:if test="${result}">
 	<center>
 	<br/><br/>
 	<h4>"<a class="text-danger">${email}</a>"은 이미 <a class="text-primary">사용중인</a> 이메일입니다.</h4>	
 	</center>
</c:if>

<c:if test="${!result}">
	<center>
	<br/><br/>
	<h4>입력하신  "<a class="text-danger">${email}</a>"은 <a class="text-primary">사용할 수 있는</a> 이메일입니다.</h4>
	</center>

</c:if>
</body>
</html>

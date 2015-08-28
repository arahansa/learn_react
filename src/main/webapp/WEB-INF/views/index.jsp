<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title> Happy WOrld </title>
</head>
<body>
index happy~~!

<h4>앵귤러 페이지 가이드로 <a href="/angular_main.jsp">이동</a></h4>

<h4>리액트 페이지 가이드로 <a href="/react_main.jsp">이동</a></h4>

<h4>아이디 기억 테스트 </h4>
<form:form action="/login" method="post" modelAttribute="user">
	아이디 : <form:input path="id" name="id"></form:input><br>
	비밀번호 : <form:password path="password"></form:password><br>
	아이디 기억 여부 : <input type="checkbox"  name="rememberId"/>
	
	<input type="submit" value="확인">
</form:form>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title> Happy WOrld </title>
</head>
<body>
index happy~~!

<form:form action="/login" method="post" modelAttribute="user">
	아이디 : <form:input path="id" name="id"></form:input><br>
	비밀번호 : <form:password path="password"></form:password><br>
	아이디 기억 여부 : <input type="checkbox"  name="rememberId"/>
	
	<input type="submit" value="확인">
</form:form>
</body>
</html>
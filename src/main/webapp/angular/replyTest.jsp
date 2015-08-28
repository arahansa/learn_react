<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html   ng-app="testApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.myreply{ margin: 10px; }
	button { margin-left: 10px;}
	.nick { color: blue;}
</style>
</head>
<body  ng-controller="testController">


닉네임 :<input type="text" id="nick" value="아라한사"/>
댓글 내용 : <input type="text" id="reply" />

<button ng-click="addReply()">전송</button>
<br>
<!-- 
<div ng-repeat="item in items2">
	<my-reply item="item"></my-reply>
</div> 
-->
<br>
<b>현재 아이템의 수 {{items.length}} </b><br>

<my-reply ng-repeat="item in items|orderBy:'-id'"></my-reply>






<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.27/angular.min.js"></script>
<script src="/js/angular-route.min.js"></script>
<script src="/js/angular/app.js"></script>
<script src="/js/angular/controller/TestController.js"></script>


</body>
</html>
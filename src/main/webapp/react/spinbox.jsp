<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<title> Happy WOrld </title>
</head>
<body>
<a href="/react_main.jsp">메인으로</a>
<h1>spinbox</h1><br>

<div id="example"></div>
 <!-- 
<script type="text/jsx">
  React.render(
    <div>
        <input type="text" value="" />
        <button>▼</button>
        <button>▲</button>
    </div>,
    document.getElementById('example')
  );
</script>
 -->
<!-- The core React library -->
<script src="http://fb.me/react-0.12.0.js"></script>
<!-- In-browser JSX transformer, remove when pre-compiling JSX. -->
<script src="http://fb.me/JSXTransformer-0.12.0.js"></script>
<script src="/js/spinbox.react.js" type="text/jsx"></script>
</body>
</html>
<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<title>React : Happy WOrld</title>

</head>

<body>

<h1>react</h1>
<div id="example"></div>
 
<script type="text/jsx">
  React.render(
    <h1>Hello, world!</h1>,
    document.getElementById('example')
  );
</script>

<!-- The core React library -->
<script src="http://fb.me/react-0.12.0.js"></script>
<!-- In-browser JSX transformer, remove when pre-compiling JSX. -->
<script src="http://fb.me/JSXTransformer-0.12.0.js"></script>


</body>
</html>
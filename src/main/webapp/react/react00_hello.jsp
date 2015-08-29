<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<title>React : Happy WOrld</title>
<link rel="stylesheet" href="/css/prism.css"> 
<script type="text/javascript" src="/js/prism.js"></script>
</head>

<body>

<h1>react</h1>
<div id="example"></div>
 
 
 html에서의 모습
 <pre class="language-markup"><code>
 &lt;div id=&quot;example&quot;&gt;&lt;/div&gt; 
 </code></pre>
 <br>
 javascript에서의 모습
 <pre class="language-jsx"><code>
  React.render(
    &lt;h1&gt;Hello, world!&lt;/h1&gt;,
    document.getElementById('example')
  );
 </code></pre>


<!-- The core React library -->
<script src="http://fb.me/react-0.12.0.js"></script>
<!-- In-browser JSX transformer, remove when pre-compiling JSX. -->
<script src="http://fb.me/JSXTransformer-0.12.0.js"></script>
 
<script type="text/jsx">
  React.render(
    <h1>Hello, world!</h1>,
    document.getElementById('example')
  );
</script>

</body>
</html>
<%@ page contentType="text/html; charset=EUC-KR" %>
<!DOCTYPE html>
<html>
<head>
<title> Happy WOrld </title>
<link rel="stylesheet" href="/css/prism.css"> 
<script type="text/javascript" src="/js/prism.js"></script>
</head>
<body>
<a href="/react_main.jsp">메인으로</a>
<h1>spinbox</h1><br>
example 아이디를 찾아서 렌더링 시킨 내용을 삽입시킵니다. 

<br>
<div id="example"></div>


<pre class="language-markup"><code>
  &lt;div id=&quot;example&quot;&gt;&lt;/div&gt;
 </code></pre>
 
 <pre class="language-jsx"><code>
  React.render(
    &lt;div&gt;
        &lt;input type=&quot;text&quot; value=&quot;&quot; /&gt;
        &lt;button&gt;▼&lt;/button&gt;
        &lt;button&gt;▲&lt;/button&gt;
    &lt;/div&gt;,
    document.getElementById(&#39;example&#39;)
);
 </code></pre>



<!-- The core React library -->
<script src="http://fb.me/react-0.12.0.js"></script>
<!-- In-browser JSX transformer, remove when pre-compiling JSX. -->
<script src="http://fb.me/JSXTransformer-0.12.0.js"></script>
<!-- <script src="/js/react/spinbox1.react.js" type="text/jsx"></script> -->
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
</body>
</html>
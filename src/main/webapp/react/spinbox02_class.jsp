<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title> Happy WOrld </title>
<link rel="stylesheet" href="/css/prism.css"> 
<script type="text/javascript" src="/js/prism.js"></script>
</head>
<body>
<a href="/react_main.jsp">메인으로</a>

<h1>spinbox CLASS</h1><br>

createClass로 Spinbox 라는 클래스를 만들어서 재활용을 합니다. <Br>

<div id="example"></div>

<pre class="language-markup"><code>
  &lt;div id=&quot;example&quot;&gt;&lt;/div&gt;
 </code></pre>
 
 <pre class="language-jsx"><code>
 var Spinbox = React.createClass({
    render: function() {
        return (
                &lt;div&gt;
                    &lt;input type=&quot;text&quot; /&gt;
                    &lt;button&gt;▼&lt;/button&gt;
                    &lt;button&gt;▲&lt;/button&gt;
                &lt;/div&gt;
            );
    }
});
React.render(
 &lt;Spinbox /&gt;,
 document.getElementById(&quot;example&quot;)
);
 </code></pre>



<!-- The core React library -->
<script src="http://fb.me/react-0.12.0.js"></script>
<!-- In-browser JSX transformer, remove when pre-compiling JSX. -->
<script src="http://fb.me/JSXTransformer-0.12.0.js"></script>
<!-- <script src="/js/react/spinbox2_class.react.js" type="text/jsx"></script> -->
<script type="text/jsx">
var Spinbox = React.createClass({
    render: function() {
        return (
                <div>
                    <input type="text" />
                    <button>▼</button>
                    <button>▲</button>
                </div>
            );
    }
});
React.render(
 <Spinbox />,
 document.getElementById("example")
);
</script>
</body>
</html>
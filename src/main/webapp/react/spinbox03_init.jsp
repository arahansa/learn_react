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



<h1>spinbox init</h1><br>

스핀박스 렌더링 시 값을 500을 주는 것을 볼 수가 있습니다. 이것을 props로 받아옵니다. 

<div id="example"></div>

<pre class="language-markup"><code>
  &lt;div id=&quot;example&quot;&gt;&lt;/div&gt;
 </code></pre>
 
 <pre class="language-jsx"><code>
  var Spinbox = React.createClass({
    render: function() {
        return (
                &lt;div&gt;
                &lt;input type=&quot;text&quot; value={ this.props.value } /&gt;
                    &lt;button&gt;▼&lt;/button&gt;
                    &lt;button&gt;▲&lt;/button&gt;
                &lt;/div&gt;
            );
    }
});
React.render(
 &lt;Spinbox value=&quot;500&quot; /&gt;,
 document.getElementById(&quot;example&quot;)
);
 </code></pre>
 

<!-- The core React library -->
<script src="http://fb.me/react-0.12.0.js"></script>
<!-- In-browser JSX transformer, remove when pre-compiling JSX. -->
<script src="http://fb.me/JSXTransformer-0.12.0.js"></script>
<!-- <script src="/js/react/spinbox3_init.react.js" type="text/jsx"></script> -->
<script type="text/jsx">
var Spinbox = React.createClass({
    render: function() {
        return (
                <div>
                <input type="text" value={ this.props.value } />
                    <button>▼</button>
                    <button>▲</button>
                </div>
            );
    }
});
React.render(
 <Spinbox value="500" />,
 document.getElementById("example")
);
</script>


</body>
</html>
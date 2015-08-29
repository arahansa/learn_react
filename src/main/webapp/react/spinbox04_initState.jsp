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

<h1>spinbox init state</h1><br>
이번엔 props가 아닌 state속성을 줍니다. state는 변할 수 있는 값이라 들었습니다. <br>
<div id="example"></div>


<pre class="language-javascript"><code>
  var Spinbox = React.createClass({
	getInitialState : function(){
        return {
            value: this.props.value || 200
        }
    },
    render: function() {
        return (
                &lt;div&gt;
                &lt;input type=&quot;text&quot; value={ this.state.value } /&gt;
                    &lt;button&gt;▼&lt;/button&gt;
                    &lt;button&gt;▲&lt;/button&gt;
                &lt;/div&gt;
            );
    }
});
React.render(
 &lt;Spinbox value=&quot;&quot; /&gt;,
 document.getElementById(&quot;example&quot;)
);
 </code></pre>

<!-- The core React library -->
<script src="http://fb.me/react-0.12.0.js"></script>
<!-- In-browser JSX transformer, remove when pre-compiling JSX. -->
<script src="http://fb.me/JSXTransformer-0.12.0.js"></script>
<!-- <script src="/js/react/spinbox04_initstate.react.js" type="text/jsx"></script> -->
<script type="text/jsx">
var Spinbox = React.createClass({
	getInitialState : function(){
        return {
            value: this.props.value || 200
        }
    },
    render: function() {
        return (
                <div>
                <input type="text" value={ this.state.value } />
                    <button>▼</button>
                    <button>▲</button>
                </div>
            );
    }
});
React.render(
 <Spinbox value="" />,
 document.getElementById("example")
);
</script>

</body>
</html>
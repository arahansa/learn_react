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
이벤트 바인딩을 해주겠습니다. <Br>
<div id="example"></div>

<pre class="language-javascript"><code>
  var Spinbox = React.createClass({
	getInitialState : function(){
        return {
            value: this.props.value || 1
        }
    },
    decrease : function(){
        this.state.value -= 1;
        this.setState( { value: this.adjustValue(this.state.value) } );
    },
    increase : function(){
        this.state.value += 1;
        this.setState( { value: this.adjustValue(this.state.value) } );
    },
    adjustValue : function(value){
        if(value &lt; 100){
            value = 100;
        }
        if(value &gt; 300){
            value = 300;
        }
 
        return value;
    },
    render: function() {
        return (
                &lt;div&gt;
                &lt;input type=&quot;text&quot; value={ this.state.value } /&gt;
                	&lt;button onClick={ this.decrease }&gt;▼&lt;/button&gt;
                	&lt;button onClick={ this.increase }&gt;▲&lt;/button&gt;
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
<!-- <script src="/js/react/spinbox05_event.react.js" type="text/jsx"></script> -->
<script type="text/jsx">
var Spinbox = React.createClass({
	getInitialState : function(){
        return {
            value: this.props.value || 1
        }
    },
    decrease : function(){
        this.state.value -= 1;
        this.setState( { value: this.adjustValue(this.state.value) } );
    },
    increase : function(){
        this.state.value += 1;
        this.setState( { value: this.adjustValue(this.state.value) } );
    },
    adjustValue : function(value){
        if(value < 100){
            value = 100;
        }
        if(value > 300){
            value = 300;
        }
 
        return value;
    },
    render: function() {
        return (
                <div>
                <input type="text" value={ this.state.value } />
                	<button onClick={ this.decrease }>▼</button>
                	<button onClick={ this.increase }>▲</button>
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
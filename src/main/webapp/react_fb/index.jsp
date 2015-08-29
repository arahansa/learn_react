<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title> Happy WOrld </title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/react.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/JSXTransformer.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="/css/prism.css"> 
<script type="text/javascript" src="/js/prism.js"></script>
</head>
<body>
<a href="/react_main.jsp">메인으로</a>
<h1>happy world</h1>
우리는 여기서 다음과 같은 구조의 댓글을 구현할 것입니다.<br>
<pre><code> 
- CommentBox<br>
  - CommentList<br>
    - Comment<br>
  - CommentForm<br>
</code></pre>

가장 먼저 댓글을 간단하게 넣어보겠습니다.  (하단 글은 react로 받아온 글입니다. )<br>

<div id="content"></div>

<pre class="language-markup"><code>
  &#x3C;div id=&#x22;content&#x22;&#x3E;&#x3C;/div&#x3E;
 </code></pre>

<pre class="language-jsx line-numbers"><code>
  var CommentBox = React.createClass({
  render: function() {
    return (
      &#x3C;div className=&#x22;commentBox&#x22;&#x3E;
        Hello, world! I am a CommentBox.
      &#x3C;/div&#x3E;
    );
  }
});
React.render(
  &#x3C;CommentBox /&#x3E;,
  document.getElementById(&#x27;content&#x27;)
);
 </code></pre>


<script type="text/jsx">
var CommentBox = React.createClass({
  render: function() {
    return (
      <div className="commentBox">
        Hello, world! I am a CommentBox.
      </div>
    );
  }
});
React.render(
  <CommentBox />,
  document.getElementById('content')
);
</script>
</body>
</html>
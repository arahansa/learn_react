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

가장 먼저 댓글을 간단하게 넣어보겠습니다.  코멘트 리스트 , 폼을 넣고 코멘트 박스를 조금 수정하였습니다.<br>

<div id="content"></div>


<pre class="language-jsx line-numbers"><code>
var CommentList = React.createClass({
  render: function() {
    return (
      &#x3C;div className=&#x22;commentList&#x22;&#x3E;
        Hello, world! I am a CommentList.
      &#x3C;/div&#x3E;
    );
  }
});

var CommentForm = React.createClass({
  render: function() {
    return (
      &#x3C;div className=&#x22;commentForm&#x22;&#x3E;
        Hello, world! I am a CommentForm.
      &#x3C;/div&#x3E;
    );
  }
});
var CommentBox = React.createClass({
  render: function() {
    return (
      &#x3C;div className=&#x22;commentBox&#x22;&#x3E;
        &#x3C;h1&#x3E;Comments&#x3C;/h1&#x3E;
        &#x3C;CommentList /&#x3E;
        &#x3C;CommentForm /&#x3E;
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
var CommentList = React.createClass({
  render: function() {
    return (
      <div className="commentList">
        Hello, world! I am a CommentList.
      </div>
    );
  }
});

var CommentForm = React.createClass({
  render: function() {
    return (
      <div className="commentForm">
        Hello, world! I am a CommentForm.
      </div>
    );
  }
});
var CommentBox = React.createClass({
  render: function() {
    return (
      <div className="commentBox">
        <h1>Comments</h1>
        <CommentList />
        <CommentForm />
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
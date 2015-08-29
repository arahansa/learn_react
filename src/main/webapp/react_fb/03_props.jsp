<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title> Happy WOrld </title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/react.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/JSXTransformer.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/marked/0.3.2/marked.min.js"></script>


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

여기서는 props 설정을 합니다. 태그를 설정하면서 그 안에 속성을 지정해주면 props로 받아서 처리합니다. <br>
마크다운도 들어갑니다. 내용을 중간에 끊기가 뭐하다보니.. 내용이 조금 더 많이 들어가네요~<br>

<div id="content"></div>


<pre class="language-jsx line-numbers"><code>
var Comment = React.createClass({
  render: function() {
    var rawMarkup = marked(this.props.children.toString(), {sanitize: true});
    return (
      &#x3C;div className=&#x22;comment&#x22;&#x3E;
        &#x3C;h2 className=&#x22;commentAuthor&#x22;&#x3E;
          {this.props.author}
        &#x3C;/h2&#x3E;
        &#x3C;span dangerouslySetInnerHTML={{__html: rawMarkup}} /&#x3E;
      &#x3C;/div&#x3E;
    );
  }
});
var CommentList = React.createClass({
  render: function() {
    return (
      &#x3C;div className=&#x22;commentList&#x22;&#x3E;
        &#x3C;Comment author=&#x22;Pete Hunt&#x22;&#x3E;This is one comment&#x3C;/Comment&#x3E;
        &#x3C;Comment author=&#x22;Jordan Walke&#x22;&#x3E;This is *another* comment&#x3C;/Comment&#x3E;
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

<!--  여기서 부터 원래 jsx!!!  -->

<script type="text/jsx">
var Comment = React.createClass({
  render: function() {
    var rawMarkup = marked(this.props.children.toString(), {sanitize: true});
    return (
      <div className="comment">
        <h2 className="commentAuthor">
          {this.props.author}
        </h2>
        <span dangerouslySetInnerHTML={{__html: rawMarkup}} />
      </div>
    );
  }
});
var CommentList = React.createClass({
  render: function() {
    return (
      <div className="commentList">
        <Comment author="Pete Hunt">This is one comment</Comment>
        <Comment author="Jordan Walke">This is *another* comment</Comment>
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
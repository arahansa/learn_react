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

data 를 미리 선언을 하고서 댓글 내용들을 셋해보는 시간을 가져보겠습니다. <br>

<div id="content"></div>


<pre class="language-jsx line-numbers" data-line="23-32, 52, 59" id="play"><code>
var data = [
  {author: &#x22;arahansa&#x22;, text: &#x22;&#xC774;&#xAC83;&#xC774; &#xB9AC;&#xC561;&#xD2B8;&#xB85C;&#xAD70;&#xC694;~? !! &#x22;},
  {author: &#x22;Pete Hunt&#x22;, text: &#x22;This is one comment&#x22;},
  {author: &#x22;Jordan Walke&#x22;, text: &#x22;This is *another* comment&#x22;}
];

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
    var commentNodes = this.props.data.map(function (comment) {
      return (
        &#x3C;Comment author={comment.author}&#x3E;
          {comment.text}
        &#x3C;/Comment&#x3E;
      );
    });
    return (
      &#x3C;div className=&#x22;commentList&#x22;&#x3E;
        {commentNodes}
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
        &#x3C;CommentList data={this.props.data} /&#x3E;
        &#x3C;CommentForm /&#x3E;
      &#x3C;/div&#x3E;
    );
  }
});
React.render(
  &#x3C;CommentBox data={data} /&#x3E;,
  document.getElementById(&#x27;content&#x27;)
);
 </code></pre>

<!--  여기서 부터 원래 jsx!!!  -->

<script type="text/jsx">
var data = [
  {author: "arahansa", text: "이것이 리액트로군요~? !! "},
  {author: "Pete Hunt", text: "This is one comment"},
  {author: "Jordan Walke", text: "This is *another* comment"}
];

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
    var commentNodes = this.props.data.map(function (comment) {
      return (
        <Comment author={comment.author}>
          {comment.text}
        </Comment>
      );
    });
    return (
      <div className="commentList">
        {commentNodes}
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
        <CommentList data={this.props.data} />
        <CommentForm />
      </div>
    );
  }
});
React.render(
  <CommentBox data={data} />,
  document.getElementById('content')
);
</script>
</body>
</html>
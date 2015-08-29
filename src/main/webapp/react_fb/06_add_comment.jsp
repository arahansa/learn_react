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

state를 설정하는 이유는 props는 부모의 불변성을 가지고있기 때문에 변경할 수 있는 state로 변경함.<br>

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
	handleSubmit: function(e) {
    	e.preventDefault();
    	var author = React.findDOMNode(this.refs.author).value.trim();
    	var text = React.findDOMNode(this.refs.text).value.trim();
    	if (!text || !author) {
      	return;
    	}
    	// TODO: 서버에 요청을 전송합니다
		console.log({txt:"댓글내용", author: author, text:text});
		this.props.onCommentSubmit({author: author, text: text});

    	React.findDOMNode(this.refs.author).value = '';
    	React.findDOMNode(this.refs.text).value = '';
    	return;
  	},
  render: function() {
    return (
      <form className="commentForm" onSubmit={this.handleSubmit}>
        <input type="text" placeholder="이름" ref="author" />
        <input type="text" placeholder="내용을 입력하세요..." ref="text" />
        <input type="submit" value="올리기" />
      </form>
    );
  }
});

var CommentBox = React.createClass({
  getInitialState: function() {
    return {data: []};
  },
  componentDidMount: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
 handleCommentSubmit: function(comment) {
 	console.log(comment);
  },
  render: function() {
    return (
      <div className="commentBox">
        <h1>댓글</h1>
        <CommentList data={this.state.data} />
        <CommentForm onCommentSubmit={this.handleCommentSubmit}/>
      </div>
    );
  }
});


React.render(
  <CommentBox url="/public/comments.json" pollInterval={2000} />,
  document.getElementById('content')
);
</script>
</body>
</html>
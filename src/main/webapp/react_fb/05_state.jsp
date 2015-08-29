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

state를 설정하는 이유는 props는 부모의 불변성을 가지고있기 때문에 변경할 수 있는 state로 변경함.<br>

<div id="content"></div>


<pre class="language-jsx line-numbers" data-line="47-59" id="play"><code>

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
  getInitialState: function() {
    return {data: []};
  },
  componentDidMount: function() {
    $.ajax({
      url: this.props.url,
      dataType: &#x27;json&#x27;,
      cache: false,
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  render: function() {
    return (
      &#x3C;div className=&#x22;commentBox&#x22;&#x3E;
        &#x3C;h1&#x3E;&#xB313;&#xAE00;&#x3C;/h1&#x3E;
        &#x3C;CommentList data={this.state.data} /&#x3E;
        &#x3C;CommentForm /&#x3E;
      &#x3C;/div&#x3E;
    );
  }
});


React.render(
  &#x3C;CommentBox url=&#x22;/public/comments.json&#x22; pollInterval={2000} /&#x3E;,
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
  render: function() {
    return (
      <div className="commentForm">
        Hello, world! I am a CommentForm.
      </div>
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
  render: function() {
    return (
      <div className="commentBox">
        <h1>댓글</h1>
        <CommentList data={this.state.data} />
        <CommentForm />
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
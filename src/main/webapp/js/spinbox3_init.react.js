/**
 * 
 */
/*var props = {
    value : 500
}*/


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


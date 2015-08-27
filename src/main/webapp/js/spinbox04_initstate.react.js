/**
 * 
 */
/*var props = {
    value : 500
}*/


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


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


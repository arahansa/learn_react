/**
 * 
 */
var Spinbox = React.createClass({
    render: function() {
        return (
                <div>
                    <input type="text" />
                    <button>▼</button>
                    <button>▲</button>
                </div>
            );
    }
});
React.render(
 <Spinbox />,
 document.getElementById("example")
);


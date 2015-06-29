var React = require('react')
var DOM = React.DOM, div = DOM.div, span = DOM.span, h2 = DOM.h2

module.exports = React.createClass({
  getInitialState: function() {
    return {
      title: this.props.title,
      content: this.props.content
    }
  },

  render: function() {
    return div(null,
      h2(null, this.state.title),
      div({
        dangerouslySetInnerHTML: {
          __html: this.state.content
        }
      }, null)
    )
  }
})

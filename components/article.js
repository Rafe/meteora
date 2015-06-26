var React = require('react')
var DOM = React.DOM, div = DOM.div, span = DOM.span, h2 = DOM.h2

module.exports = React.createClass({
  getInitialState: function() {
    return {
      title: 'this is a post',
      content: this.props.content
    }
  },

  handleClick: function() {
    this.setState({ title: 'test' })
  },

  render: function() {
    return div(null,
      h2({ onClick: this.handleClick }, this.state.title),
      div({
        dangerouslySetInnerHTML: {
          __html: this.state.content
        }
      }, null)
    )
  }
})

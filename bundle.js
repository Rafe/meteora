var DOM = React.DOM, body = DOM.body, div = DOM.div, span = DOM.span, h2 = DOM.h2, script = DOM.script

var Article = React.createClass({
  getInitialState: function() {
    return {
      title: 'this is a post',
      content: this.props.content
    }
  },

  handleClick: function() {
    alert('!! cool')
    this.setState({ title: 'test' })
  },

  render: function() {
    return div(null,
      h2({ onClick: this.handleClick.bind(this) }, this.state.title),
      div(null, this.state.content)
    )
  }
})

var App = React.createClass({
  getInitialState: function(){
    return { resources: [
      'this is article 1',
      'this is article 2',
      'this is article 3',
      'this is article 4'
    ]}
  },

  render: function() {
    return body(null,
      div({id: 'content'},
        div(null, this.state.resources.map(function(resource) {
          return React.createElement(Article, { content: resource })
        }.bind(this)))
      ),
      script({src: 'https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/react.js'}),
      script({src: './bundle.js'})
    )
  }
})

React.render(React.createElement(App), document.getElementsByTagName('html')[0]);

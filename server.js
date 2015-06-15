var React = require('react')
var Article = React.createFactory(require('./components/article'))
var DOM = React.DOM, body = DOM.body, div = DOM.div, script = DOM.script


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
          return Article.call(this, { content: resource })
        }.bind(this)))
      ),
      script({src: 'https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/react.js'}),
      script({src: './bundle.js'})
    )
  }
})

var html = React.renderToString(React.createElement(App))

var fs = require('fs')

fs.writeFile('./test.html', html, function(err) {
  console.log('file is saved!')
});

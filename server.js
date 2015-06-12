var React = require('react')
var Article = React.createFactory(require('./components/article'))
var DOM = React.DOM, body = DOM.body, div = DOM.div, script = DOM.script

var resources = [
  'this is article 1',
  'this is article 2',
  'this is article 3',
  'this is article 4'
]

var html = React.renderToStaticMarkup(body(null,
  div({id: 'content', dangerouslySetInnerHTML: {__html:
    React.renderToString(div(null, resources.map(function(resource) {
      return Article({content: resource})
    })))
  }}),
  script({src: 'https://cdnjs.cloudflare.com/ajax/libs/react/0.13.3/react.js'})
))

var fs = require('fs')

fs.writeFile('./test.html', html, function(err) {
  console.log('file is saved!')
});

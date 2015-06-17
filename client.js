var React = require('react')
var App = React.createFactory(require('./components/app'))
var marked = require('marked')

var articles = [
  marked(require('./resources/articles/test.md')),
  marked(require('./resources/articles/test2.md')),
  marked(require('./resources/articles/test3.md')),
]

React.render(App({ articles: articles }, null), document.getElementById('content'))

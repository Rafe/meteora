var React = require('react')
var App = React.createFactory(require('./components/app'))
var marked = require('marked')

var articles = [
  './resources/articles/test.md',
  './resources/articles/test2.md',
  './resources/articles/test3.md',
].map(function(article) {
  return marked(require(article));
})

React.render(App({ articles: articles }, null), document.getElementById('content'))

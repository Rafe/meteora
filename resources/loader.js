var marked = require('marked')
var fs = require('fs')

var articles = [
  './resources/articles/test.md',
  './resources/articles/test2.md',
  './resources/articles/test3.md',
]

exports.articles = articles.map(function(path) {
  var article = fs.readFileSync(path)
  return marked(article.toString())
})

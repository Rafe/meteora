var express = require('express')
var app = express();
var React = require('react')
var browserify = require('browserify')
var stringify = require('stringify')

var resources = require('./resources/loader')

app.set('view engine', 'jade')

var App = React.createFactory(require('./components/app'))

app.get('/', function(req, res) {
  resources.load('articles', function(articles) {
    res.render('index', {
      content: React.renderToString(App({ articles: articles }))
    })
  })
})

app.get('/articles/:id', function(req, res) {
  resources.load('articles', function(articles) {
    res.render('show', {
      content: React.renderToString(App({ article: articles[params.id] }))
    })
  })
})

app.get('/bundle.js', function(req, res) {
  res.setHeader('Content-Type', 'text/javascript')

  browserify()
    .transform(stringify(['.md', '.markdown']))
    .add('./client.js')
    .bundle()
    .pipe(res)
})

var server = app.listen(3000, function() {
  var host = server.address().address
  var port = server.address().port

  console.log('Meteora is running at http://%s:%s', host, port)
})

fs = require('fs')
path = require('path')

moment = require('moment')
async = require('async')
_ = require('underscore')
CSON = require('cson')

parse = require('markdown').parse

TITLE_REGEX = /([\d]{4})-([\d]{2})-([\d]{2})-([a-z0-9-_]+)/
BODY_REGEX = /({[\w\W\d\s]+})([\w\W\d\s]+)/

module.exports = class Post
  @read: (file, callback)->
    fs.readFile path.join(@path, file), 'utf8', (err, source)->
      return callback(err) if err?
      post = new Post file, source
      callback(null, post)

  @all: (callback)->
    fs.readdir @path, (err, files)->
      async.map files, (file, fn)->
        Post.read(file, fn)
      , (err, posts)->
        posts.sort (a, b)->
          a.date < b.date
        callback(err, posts)

  constructor: (@file, @source, @config = {})->
    @parseTitle(@file)
    @parseBody(@source)

  parseTitle: (title)->
    result = TITLE_REGEX.exec(title)

    @date = new Date("#{result[1]}/#{result[2]}/#{result[3]}")
    @slug = result[4]
    @dir = moment(@date).format("/YYYY/MM/DD")
    @link = @dir + "/#{@slug}.html"

  parseBody: (source)->
    body = BODY_REGEX.exec(source)

    if body?
      @config = _.extend @config, CSON.parseSync(body[1])
      @source = body[2]
    else
      @source = source

    @title = @config.title

  render: ->
    @content = parse @source.replace('<!--more-->','')
    @content

  excerpt: ->
    @excerpt = parse @source.split('<!--more-->')[0]
    @excerpt

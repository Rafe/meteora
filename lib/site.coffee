fs = require('fs')
_ = require('underscore')
mkpath = require('mkpath')
async = require('async')
bower = require('bower')
path = require('path')

Post = require('./post')
Layout = require('./layout')

module.exports = class Site
  constructor: (@path)->
    @loadConfig()

  load: (callback)->
    @loadPosts (err, posts)=>
      @loadLayouts (err, layouts)=>
        @loadComponents ->
          callback(err, posts, layouts)

  loadConfig: ->
    @config = require(path.join(@path, 'config'))

  loadPosts: (callback)->
    Post.path = @path + '/_posts'
    Post.all (err, @posts)=>
      callback(err, @posts)

  loadLayouts: (callback)->
    Layout.path = @path + '/_layouts'
    Layout.all (err, @layouts)=>
      callback(err, @layouts)

  render: (callback)->
    async.each @posts, (post, fn)=>
      layout = @layouts[post.config.layout]
      mkpath @path + post.dir, (err)=>
        if layout
          file = layout( post: post , site: @config )
        else
          file = post.render()
        fs.writeFile @path + post.link, file, 'utf8', fn
    , callback

  renderIndex: (callback)->
    page = @layouts['index'](posts: @posts, site: @config)
    fs.writeFile @path + '/index.html', page, 'utf8', callback

  loadComponents: (callback)->
    bower.config.json = '/' + path.relative(process.cwd(), @path) + '/component.json'
    bower.config.directory = path.relative(process.cwd(), @path) + '/components'
    bower.commands.install()
      .on('data', console.log)
      .on('end', callback)

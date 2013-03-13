fs = require('fs')
_ = require('underscore')
{spawn, exec} = require 'child_process'
mkpath = require('mkpath')
async = require('async')
bower = require('bower')
path = require('path')
moment = require('moment')

bind = (proc)->
  proc.stdout.on 'data', (data) -> print data
  proc.stderr.on 'data', (data) -> print data
  proc.on 'exit', (status) -> callback?() if status is 0

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
    @config.updated = moment(new Date()).format()

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

  renderRss: (callback)->
    rss = @layouts['rss'](posts: @posts, site: @config)
    fs.writeFile @path + '/atom.xml', rss, 'utf8', callback

  loadComponents: (callback)->
    originPath = process.cwd()
    process.chdir(@path)
    exec 'component install', (err, stdout)->
      exec 'component build', (err, stdout)->
        process.chdir(originPath)
        callback()

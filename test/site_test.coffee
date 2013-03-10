Site = require('../lib/site')

sitePath = __dirname + '/site'
describe 'Site', ->
  describe 'config.coffee', ->
    it 'should read config.coffee as config', ->
      site = new Site(sitePath)
      site.config.title.should.eql 'test'

  it 'should load all posts', (done)->
    site = new Site(sitePath)
    site.loadPosts (err, posts)->
      site.posts.length.should.eql 2
      done(err)

  it 'should load all layouts', (done)->
    site = new Site(sitePath)
    site.loadLayouts (err, layouts)->
      site.layouts['default']?.should.be.ok
      site.layouts['post']?.should.be.ok
      done()

  it 'should render posts into position', (done)->
    site = new Site(sitePath)
    site.load (err)->
      site.render (err)->
        done()

  it 'should render index page', ->

  it 'should render archive page', ->

  it 'can load components', (done)->
    site = new Site(sitePath)
    site.loadComponents(done)

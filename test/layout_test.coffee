Layout = require('../lib/layout')
Layout.path = __dirname + '/site/_layouts'

describe 'Layout', ->
  it 'can read layout as jade template', (done)->
    Layout.read 'post.jade', (err, layout)->
      result = layout( post: { render: -> '<h2>Hello World</h2>'})
      result.should.include 'Hello World'
      result.should.include 'default'
      done(err)

  it 'can read all layouts', (done)->
    Layout.all (err, layouts)->
      page = layouts.post( post: { render: -> '<h2>Hello World</h2>'})
      page.should.include 'Hello World'
      page.should.include 'default'
      done()

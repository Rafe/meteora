Layout = require('../lib/layout')
Layout.path = __dirname + '/site/_layouts'

describe 'Layout', ->
  it 'can read layout as jade template', (done)->
    Layout.read 'post.jade', (err, layout)->
      result = layout( content: '<h2>Hello World</h2>')
      result.should.include 'Hello World'
      result.should.include 'default'
      done()

  it 'can read all layouts', (done)->
    Layout.all (err, layouts)->
      page = layouts.post( content: '<h2>Hello World</h2>')
      page.should.include 'Hello World'
      page.should.include 'default'
      done()

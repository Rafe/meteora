Post = require('../lib/post')
Post.path = __dirname + '/site/_posts'

describe 'Post', ->
  it 'can parse date from filename', ->
    post = new Post('2012-09-05-test.md', '')
    post.date.should.eql new Date("2012/09/05")

  it 'can parse slug', ->
    post = new Post('2012-09-05-test.md', '')
    post.slug.should.eql 'test'

  it 'can parse config on post', (done)->
    Post.read '2012-09-05-test.md', (err, post)->
      post.title.should.eql "Test"
      post.config.layout.should.eql "post"
      post.config.category.should.eql "test"
      post.config.tags.length.should.eql 2
      done(err)

  it 'return error when no file', (done)->
    Post.read '2012-09-05-error.md', (err, post)->
      err.message.should.include 'ENOENT'
      done()

  it 'can render post from markdown to html', (done)->
    Post.read '2012-09-05-test.md', (err, post)->
      post.render().should.include '<h1>Test1234</h1>'
      done()

  it 'can parse post from address', (done)->
    Post.read '2012-09-05-test.md', (err, post)->
      post.title.should.eql 'Test'
      done(err)

  it 'can parse all article under directory', (done)->
    Post.all (err, posts)->
      posts[0].slug.should.eql 'test'
      posts[1].slug.should.eql 'test2'
      done()

  it 'should have param link', (done)->
    Post.read '2012-09-05-test.md', (err, post)->
      post.link.should.eql '/2012/09/05/test.html'
      done()

  it 'should be able to generate excerpt post', (done)->
    Post.read '2012-09-05-test.md', (err, post)->
      post.excerpt().should.not.include 'Test4567'
      done()
    

fs = require('fs')
moment = require('moment')
slugs = require('slugs')
path = require('path')

module.exports = (options)->
  title = options.title || options.argv.remain.shift()

  post = moment(new Date()).format("YYYY-MM-DD-") + slugs(title) + '.md'
  fs.writeFileSync(path.join(options.path, '_posts', post) , """
  {
    title: '#{title}'
    layout: 'post'
  }
  """)

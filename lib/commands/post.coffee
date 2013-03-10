fs = require('fs')
moment = require('moment')
slugs = require('slugs')
path = require('path')

module.exports = (options)->
  post = moment(new Date()).format("YYYY-MM-DD-") + slugs(options.title) + '.md'
  fs.writeFileSync(path.join(options.path, '_posts', post) , """
  {
    title: '#{options.title}'
    layout: 'post'
  }
  """)

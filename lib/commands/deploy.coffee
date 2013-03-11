sync = require('s3sync')
path = require('path')

module.exports = (options)->
  config = require path.join(process.cwd(), options.path, 'config')

  sync
    'S3_KEY': config.s3.key
    'S3_SECRET': config.s3.secret
    'bucket': config.s3.bucket
    'gitRoot': process.cwd()
    'dir': path.join process.cwd(), options.path
    'ignore': ['_posts', '_layouts', '_assets','config.coffee', 'component.json', 'components' ]
    'complete': ->
      console.log 'sync complete'

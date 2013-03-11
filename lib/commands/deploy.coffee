sync = require('s3sync')
path = require('path')

module.exports = (options)->
  config = require(path.join(options.path, 'config'))

  sync
    'amazonKey': config.s3.key
    'amazonSecret': config.s3.secret
    'bucket': config.s3.bucket
    'gitroot': process.cwd()
    'dir': options.path
    'complete': ->
      console.log 'sync complete'

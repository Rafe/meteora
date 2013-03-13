sync = require('s3sync')
path = require('path')

module.exports = (options)->
  config = require path.join(process.cwd(), options.path, 'config')

  if config.s3?
    console.log 'start syncing with s3...'
    sync
      'key': config.s3.key
      'secret': config.s3.secret
      'bucket': config.s3.bucket
      'gitRoot': process.cwd()
      'dir': path.join process.cwd(), options.path
      'ignore': ['^_', '.coffee$', '.json$', 'components' ]
      'complete': ->
        console.log 'sync complete'
  else
    console.log 'no specified sync method'

path = require('path')
express = require('express')

module.exports = (options)->
  app = express()
  app.use express.static(path.join process.cwd(), options.path)
  app.listen(3000)
  console.log 'listening port 3000'

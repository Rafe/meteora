fs = require('fs')
path = require('path')
jade = require('jade')
async = require('async')

module.exports = class Layout
  @read: (file, callback)=>
    filePath = path.join(@path, file)
    fs.stat filePath, (err, stat)->
      if stat.isFile()
        fs.readFile filePath, 'utf8', (err, data)=>
          return callback(err) if err?
          template = jade.compile(data, filename: filePath)
          callback(null, template)
      else
        callback()

  @all: (callback)->
    fs.readdir @path, (err, files)->
      return callback(err) if err?
      return callback(new Error('no folder')) unless files?

      async.reduce files, {}, (result, file, fn)->
        Layout.read file, (err, layout)->
          return fn(null, result) unless layout?

          result[file.split('.')[0]] = layout

          fn(null, result)
      , callback

var marked = require('marked')
var fs = require('fs')
var path = require('path')

exports.load = function load(name, callback) {
  dirPath = path.join('./resources/', name)
  files = []
  fs.readdirSync(dirPath).forEach(function(filename) {
    var filePath = path.join(dirPath, filename)
    var stat = fs.statSync(filePath)
    if (stat.isFile()) {
      files.push(marked(fs.readFileSync(filePath).toString()))
    }
  })
  callback(files)
}

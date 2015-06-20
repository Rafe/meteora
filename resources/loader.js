var marked = require('marked')
var fs = require('fs')
var path = require('path')

exports.loadResources = function loadResources(name, callback) {
  dirPath = path.join('./resources/', name)
  files = []
  fs.readdirSync(dirPath).forEach(function(filename) {
    var filePath = path.join(dirPath, filename)
    var stat = fs.statSync(filePath)
    if (stat.isFile()) {
      files.push(fs.readSync(filePath))
    }
  })
  return files
}

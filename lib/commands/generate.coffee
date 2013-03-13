{ Site } = require('../')
path = require('path')

module.exports = (options)->
  site = new Site( path.join(process.cwd(), options.path) )

  site.load ->
    site.render ->
      site.renderIndex ->
        site.renderRss ->

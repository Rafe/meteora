meteora = require('../')
path = require('path')

module.exports = (options)->
  Site = meteora.Site
  site = new Site( path.join(process.cwd(), options.path) )

  site.load ->
    site.render ->
      site.renderIndex ->

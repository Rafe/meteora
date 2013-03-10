module.exports = ->
  console.log '''
  
  Meteora:
    Static blog generate engine

    --commands
      generate [g]
        Generate site from posts and layouts, default path to ./site
      server [s]
        Start a static server for site
    --options
      --path, -p [site]
  '''

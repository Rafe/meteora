module.exports = ->
  console.log '''
  
  Meteora:
    Static blog generate engine

    --commands
      generate [g]
        ex: meteora g -p site
        Generate site from posts and layouts, default path to ./
      server [s]
        ex: meteora s -p site
        Start a static server for site, default path to ./
      post <title> [p]
        ex: meteora p 'new post' -p site
        Generate a new post with title
      deploy [d]
        ex: meteora d -p site
        Deploy site to amazon S3 (Need to be in git)
    --options
      --path, -p [site]
  '''

#Meteora

### Static blog generate engine with components

## Target

## Features

+ components compatable
+ jade template
+ markdown support

## Todos

+ components themes
+ components plugins
+ pages
+ categories
+ tags
+ pagination

##Commands

Generate content

    meteora generate --path site
    meteora g -p site

Start local server

    meteora server
    meteora s

Generate new post

    meteora post -t '[new title]'
    meteora p

##Example structure

    _posts/
      2012-12-31-test-post.md
    _layouts/
      index.jade
    config.coffee

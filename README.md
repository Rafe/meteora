#Meteora

### Static blog generate engine with components

## Target

Static blog engine, with pluggable github-based themes and plugins

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

##Install

coffeescript and component required:

    npm install -g coffee-script
    npm install -g component

install

    npm install -g git://github.com/Rafe/meteora.git

##Folder structure

    _posts/
      2012-12-31-test-post.md
    _layouts/
      index.jade
    assets/
    config.coffee

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


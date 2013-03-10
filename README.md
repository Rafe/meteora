#Meteora

1. bootstrap lib
2. post logic:

1.index page
2.show page

theme is installed by bower

config is saved as a json file

generate static site by config

deploy to s3 cdn or github page

use case:

meteora init -> generate project skeleton
meteora post
meteora page
meteora generate
meteora watch
meteora deploy

posts/
  2012-12-31-test-post.md
pages/
  /game/testpage.html
theme/
config.coffee

bin:

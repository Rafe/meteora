var React = require('react')
var App = React.createFactory(require('./App'))
var DOM = React.DOM, body = DOM.body, div = DOM.div, script = DOM.script;

var props = {
      items: [
        'Item 0',
        'Item 1',
        'Item </script>',
        'Item <!--inject!-->',
      ]
    }
var html = React.renderToStaticMarkup(body(null,
  // The actual server-side rendering of our component occurs here, and we
  // pass our data in as `props`. This div is the same one that the client
  // will "render" into on the browser from browser.js
  div({id: 'content', dangerouslySetInnerHTML: {__html:
    React.renderToString(App(props))
  }}),

  // We'll load React from a CDN - you don't have to do this,
  // you can bundle it up or serve it locally if you like
  script({src: '//fb.me/react-0.13.3.min.js'}),

  // Then the browser will fetch and run the browserified bundle consisting
  // of browser.js and all its dependencies.
  // We serve this from the endpoint a few lines down.
  script({src: '/bundle.js'})
))

console.log(html)

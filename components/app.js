var React = require('react')
var Article = React.createFactory(require('./article'))
var div = React.DOM.div

module.exports = React.createClass({
  getInitialState: function() {
    return {
      page: this.props.page
    }
  },

  componentWillMount: function() {
    // load router...
    // // last hack for continue streaks...
  },

  render: function() {
    var articles = this.props.articles.map(function(article) {
      return Article({ title: 'Article', content: article })
    })
    return div(null, articles)
  }
})

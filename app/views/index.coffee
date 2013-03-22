View = require('./view')

module.exports = class Index extends View
  template: require('./templates/index')
  parts: {}
  className: "page index"
  events: 
    "click": "gotoTweets"

  gotoTweets: (e) ->
    return if $(e.target).attr("href") isnt undefined
    
    e.preventDefault()
    app.trigger "page:render", "tweets"

  #on dom ready

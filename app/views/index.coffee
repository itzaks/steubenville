View = require('./view')

module.exports = class Index extends View
  template: require('./templates/index')
  parts: {}
  className: "page index"
  events: 
  	"click": "gotoTweets"

  gotoTweets: (e) ->
  	e.preventDefault()
  	
  	app.router.navigate "tweets", {trigger: true}

  #on dom ready

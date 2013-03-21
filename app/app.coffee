LayoutView = require 'views/layout'

module.exports = class Application
  name: "streubenville"
  root: "streubenville"
  views: {}
  routers: {}
  events: {}
  tweets: []
  constructor: ->
    _.extend this, Backbone.Events

    @grabTweets()

  grabTweets: ->
    user = 's_reps'

    $.ajax
      type: 'GET'
      dataType: 'jsonp'
      url: 'http://api.twitter.com/1/statuses/user_timeline.json'
      data: 
        screen_name: 's_reps'
        include_rts: 1

      success: (data) =>
        console.log data
        tweet = data[0].text
        
        for tweet in data
          @tweets.push tweet

        @trigger "got-tweets"

  init: ->
    @chrome()

  chrome: ->
    @layout = new LayoutView
      el: $("#application")

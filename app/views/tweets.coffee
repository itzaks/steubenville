View = require('./view')

module.exports = class Tweets extends View
  template: require('./templates/tweets')

  id: "tweets"
  className: "page"

  events: 
    "click .more": "showTweet"
    "click .tweet": "showTweet"

  isReady: false
  tweets: []
  current: 0

  bootstrap: ->
    showFirstTweet = _.once @showTweet

    @listenTo app, "got-tweets", ->
      @showTweet()
      
    @on "#{@cid}:render:after", ->
      @$tweet = @$(".tweet")
      setTimeout =>
        @showTweet()
        window.scrollTo(0, 1)
      , 150

  showTweet: ->
    return if app.tweets.length is 0

    tweet = app.tweets[@current % app.tweets.length]
    
    name = tweet.retweeted_status.user.name
    username = tweet.retweeted_status.user.screen_name
    text = tweet.retweeted_status.text

    copy = "I think you should read this article – http://www.newstatesman.com/laurie-penny/2013/03/steubenville-rape-cultures-abu-ghraib-moment"

    mentionURL = "https://twitter.com/intent/tweet?text=#{ encodeURI(copy) }&in_reply_to=#{ tweet.retweeted_status.id_str }"

    tweetURL = "https://twitter.com/#{ name }/status/#{ tweet.retweeted_status.id_str }"

    text.replace('"', '”')
        
    @$tweet
      .removeClass("show")
      .html("<div>#{ text }</div>")

    $fit = @$tweet.find("div")

    height = if $(window).width() > 960 then $(window).height() - 350 else 240
    
    $fit.css
      width: "100%"
      height: height

    $fit.textFit
      alignVert: true
      alignHoriz: true

    setTimeout =>
      @$tweet.addClass("show")
    , 100

    @$(".name").text(name)
    @$(".username").text(" @#{ username }").attr("href", "http://twitter.com/#{ username }")
    @$(".respond").attr("href", mentionURL)

    @ready() unless @isReady

    @current++

  ready: ->
    @$el.addClass("ready")
    @isReady = true
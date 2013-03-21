View = require('./view')

module.exports = class Tweets extends View
  template: require('./templates/tweets')

  id: "tweets"
  className: "page"

  events: "click .more": "showTweet"

  isReady: false
  tweets: []
  current: 0

  bootstrap: ->
    @on "#{@cid}:render:after", ->
      @$tweet = @$(".tweet")
      @grabTweets()

  showTweet: ->
    tweet = @tweets[@current % @tweets.length]
    
    name = tweet.retweeted_status.user.screen_name
    image = tweet.retweeted_status.user.profile_image_url
    text = tweet.retweeted_status.text
    mentionURL = "https://twitter.com/intent/tweet?text=It's%20not%20who%20you%20love%20%E2%80%93%20it's%20*that*%20you%20love%20that%20truly%20matters&in_reply_to=#{ tweet.retweeted_status.id_str }"

    tweetURL = "https://twitter.com/#{ name }/status/#{ tweet.retweeted_status.id_str }"
        
    @$tweet
      .removeClass("show")
      .html("<div>#{ text }</div>")

    $fit = @$tweet.find("div")
    $fit.css
      width: "100%"
      height: $(window).height() - 300

    $fit.textFit
      alignVert: true
      alignHoriz: true

    setTimeout =>
      @$tweet.addClass("show")
    , 100

    @$(".name").text(name)
    #@$(".tweeter_info").hide().fadeIn()
    @$(".respond").attr("href", mentionURL)
    #@$(".profile_image").attr("src", image)
    #@$(".tweet_url").attr("href", tweetURL)

    @ready() unless @isReady

    @current++

  ready: ->
    @$el.addClass("ready")
    @isReady = true

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
    
        @showTweet()
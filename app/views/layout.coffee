View = require('./view')

# Application frame
module.exports = class Application extends View
  tagName: "body"
  current: null
  started: false

  bootstrap: ->
    @listenTo app, "page:render", (which) ->
      view = new View = require "views/#{ which }"
      
      @current?.$el.addClass "slide-away"


      setTimeout =>
        @$page.html view.render().el
        @current = view
        @start() unless @started
      , 200
  
    @$page = @$("#content")

  start: ->
    @$el.addClass "ready"

  #on dom ready
  initialize: (options) ->
    @setElement options.el
    super()

    console.log @parts
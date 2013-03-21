View = require('./view')

# Application frame
module.exports = class Application extends View
  tagName: "body"
  current: null
  

  bootstrap: ->
    @listenTo app, "page:render", (which) ->
      view = new View = require "views/#{ which }"
      
      @current?.$el.addClass "slide-away"

      setTimeout =>
        @$page.html view.render().el
        @current = view
      , 300
  
    @$page = @$("#content")

  #on dom ready
  initialize: (options) ->
    @setElement options.el
    super()

    console.log @parts
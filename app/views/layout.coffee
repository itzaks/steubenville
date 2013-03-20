View = require('./view')

# Application frame
module.exports = class Application extends View
  tagName: "body"

  bootstrap: ->
    @listenTo app, "page:render", (which) ->
      view = new View = require "views/#{ which }"
      @$page.html view.render().el
  
    @$page = @$("#content")

  #on dom ready
  initialize: (options) ->
    @setElement options.el
    super()

    console.log @parts
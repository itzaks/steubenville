module.exports = Backbone.Router.extend
  routes:
    '': 'index'

  index: ->
    @subpage 'index'

  #set current view and render in layouts $content-part
  subpage: (name) ->
    layout_parts = app.views.layout.parts

    app.views[name] ?= new View = require "views/#{ name }"

    return if app.views[name] is app.views.current

    app.views.current = app.views[name]
    layout_parts.content.html app.views[name].render().el

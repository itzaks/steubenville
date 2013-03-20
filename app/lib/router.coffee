module.exports = Backbone.Router.extend
  routes:
    '': 'index'

  index: ->
    @subpage 'index'

  #set current view and render in layouts $content-part
  subpage: (name) ->
    app.trigger "page:render", name

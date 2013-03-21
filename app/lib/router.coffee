module.exports = Backbone.Router.extend
  routes:
    '': 'index'
    'tweets': 'tweets'

  index: ->
    @subpage 'index'
  tweets: ->
    @subpage 'tweets'

  #set current view and render in layouts $content-part
  subpage: (name) ->
    app.trigger "page:render", name

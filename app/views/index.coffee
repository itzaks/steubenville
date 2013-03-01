View = require('./view')

# Application frame
module.exports = class Application extends View
  tagName: "body"
  template: require('./templates/index')
  parts: {}

  #on dom ready
  initialize: ->
    super()
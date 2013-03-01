View = require('./view')

# Application frame
module.exports = class Application extends View
  tagName: "body"
  parts: {}

  #on dom ready
  initialize: ->
    @parts.content = @$("#content")
    super()

    console.log @parts
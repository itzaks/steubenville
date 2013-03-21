Application = require "./app"

$ ->
  app.init()
  app.trigger "page:render", "index"

@app = new Application
Application = require "./app"

$ ->
  app.init()
  Backbone.history.start
    pushState: yes
    root: root

@app = new Application
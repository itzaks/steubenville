Application = require "./app"

$ ->
  app.init()

  root = if location.href.indexOf('localhost') isnt -1 then '' else app.name
  
  Backbone.history.start
    pushState: yes
    root: root

@app = new Application
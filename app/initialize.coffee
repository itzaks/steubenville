Application = require "./app"

$ ->
  app.init()

  root = if location.href.indexOf('localhost') isnt -1 then '' else app.root
  
  Backbone.history.start
    pushState: yes
    root: root

@app = new Application
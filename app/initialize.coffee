Application = require "./app"

$ ->
  app.init()

  root = if location.href.indexOf('localhost') isnt -1 then '' else app.root
  
  Backbone.history.start
    pushState: yes
    root: root

  app.router.navigate("/", {trigger:true})

@app = new Application
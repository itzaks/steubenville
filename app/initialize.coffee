Application = require "./app"

$ ->
  app.init()

  #root = if location.href.indexOf('localhost') isnt -1 then '' else app.root
  app.trigger "page:render", "index"
  #app.router.navigate("/", {trigger:true})

@app = new Application
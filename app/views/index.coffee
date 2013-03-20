View = require('./view')

module.exports = class Index extends View
  template: require('./templates/index')
  parts: {}

  #on dom ready

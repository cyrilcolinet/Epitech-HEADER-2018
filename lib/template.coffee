module.exports =
  class Template
    constructor: (@templateStr) ->

    replace: (what, content) ->
      escaped = what.replace /([.*+?^=!:${}()|\[\]\/\\])/g, '\\$1'
      re = new RegExp escaped, 'g'
      @templateStr = @templateStr.replace re, content

    getTemplate: ->
      return @templateStr

root = exports ? this
$ ($) ->
  konami = "38,38,40,40,37,39,37,39,66,65"
  konami_index = 0
  cornify_added = false
  $(document).keydown (e) ->
    return if cornify_added
    if e.keyCode is konami_keys[konami_index++]
      if konami_index is konami_keys.length
        cornify_added = true
        $(document).unbind('keydown', arguments.callee)
        $('#selfie').attr('src', 'cfarm.jpg')
        $.getScript 'http://www.cornify.com/js/cornify.js', ->
          cornify_add()
          $(document).keydown(cornify_add)
    else
      konami_index = 0

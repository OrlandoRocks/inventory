$(window).bind 'page:change', ->
  icheck()

@icheck = ->
  if $('.icheck-me').length > 0
    $('.icheck-me').each ->
      $el = $(this)
      skin = if $el.attr('data-skin') != undefined then '_' + $el.attr('data-skin') else ''
      color = if $el.attr('data-color') != undefined then '-' + $el.attr('data-color') else ''
      opt =
        checkboxClass: 'icheckbox' + skin + color
        radioClass: 'iradio' + skin + color
      $el.iCheck opt
      return
  return

current_skin = null
storeSkin = (skin) ->
  localStorage.setItem 'skin', skin
  return

getSkin = ->
  localStorage.getItem 'skin'

changeSkin = (skin) ->
  body_classes = $('body').attr('class').split ' '
  $.each body_classes, (index, value) ->
    if value.match /skin-([a-zA-Z]+)(-[a-zA-Z]+)?/
      current_skin = value
    return
  $('body').removeClass current_skin
  $('body').addClass skin
  storeSkin skin
  return

$(window).bind 'page:change', ->
  tmpSkin = getSkin()
  if tmpSkin
    changeSkin tmpSkin
  $("[data-skin]").on 'click', (e) ->
    e.preventDefault()
    changeSkin $(this).data 'skin'
    return

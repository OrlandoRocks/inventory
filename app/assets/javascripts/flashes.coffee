$('.alert').click ->
  $(this).fadeOut()
  return

setTimeout (->
  $('.alert').fadeOut()
  return
), 4000

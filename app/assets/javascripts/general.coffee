window.block = (options) ->
  options = $.extend(true, {}, options)
  html = ''
  if options.animate
    html = '<div class="loading-message ' + (if options.boxed then 'loading-message-boxed' else '') + '">' +
        '<div class="block-spinner-bar"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div></div>' + '</div>'
  else if options.iconOnly
    html = '<div class="loading-message ' + (if options.boxed then 'loading-message-boxed' else '') +
        '"><i class="fa fa-circle-o-notch fa-2x fa-spin"></i></div>'
  else if options.textOnly
    html = '<div class="loading-message ' + (if options.boxed then 'loading-message-boxed' else '') +
        '"><span>&nbsp;&nbsp;' + (if options.message then options.message else 'LOADING...') + '</span></div>'
  else
    html = '<div class="loading-message ' + (if options.boxed then 'loading-message-boxed' else '') +
        '"><i class="fa fa-circle-o-notch fa-2x fa-spin"></i><span>&nbsp;&nbsp;' + (if options.message then options.message else 'LOADING...') + '</span></div>'
    $('.wrapper').css 'filter', 'blur(1.5px)'
  if options.target
    # element blocking
    el = $(options.target)
    if el.height() <= $(window).height()
      options.cenrerY = true
    el.block
      message: html
      baseZ: if options.zIndex then options.zIndex else 1000
      centerY: if options.cenrerY != undefined then options.cenrerY else false
      css:
        top: '10%'
        border: '0'
        padding: '0'
        backgroundColor: 'none'
      overlayCSS:
        backgroundColor: if options.overlayColor then options.overlayColor else '#555'
        opacity: if options.boxed then 0.05 else 0.1
        cursor: 'wait'
  else
    # page blocking
    $.blockUI
      message: html
      baseZ: if options.zIndex then options.zIndex else 1000
      css:
        border: '0'
        padding: '0'
        backgroundColor: 'none'
      overlayCSS:
        backgroundColor: if options.overlayColor then options.overlayColor else '#555'
        opacity: if options.boxed then 0.05 else 0.2
        cursor: 'wait'
  return
window.unblock = (target) ->
  if target
    $(target).unblock onUnblock: ->
      $(target).css 'position', ''
      $(target).css 'zoom', ''
      return
  else
    $.unblockUI()
    $('.wrapper').removeClass 'blur'
    $('.wrapper').removeAttr 'style'
  return

$(window).bind 'page:change', ->
  $('form').on 'submit', ->
    block
      message: I18n.processing_message
    return

  $(ClientSideValidations.selectors.forms).enableClientSideValidations()

  $('.btn-destroy').click (event) ->
    element = $(this)
    row = element.closest('tr')
    resource = element.data('resource')
    resourceId = element.data('resource-id')
    resourceMsg = element.data('resource-message')
    url = resource + "/" + resourceId;
    swal.init()
    swal {
      text: resourceMsg
      type: 'warning'
      showCancelButton: true
      confirmButtonText: I18n.confirm
      cancelButtonText: I18n.cancel
      closeOnConfirm: false
      confirmButtonClass: 'btn btn-success btn-flat',
      cancelButtonClass: 'btn btn-danger btn-flat',
    }, (isConfirm) ->
      if !isConfirm
        return
      $.ajax
        url: url
        type: 'DELETE'
        dataType: 'json'
        success: (data) ->
          swal {
            title: I18n.done
            text: I18n.deleted
            type: 'success'
            confirmButtonText: I18n.ok
          }
          $(row).remove()
          return
        error: ->
          swal I18n.error, I18n.try_again, 'error'
          return
      return
    return
  return


elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));

elems.forEach (html) ->
  switchery = new Switchery(html)

$(window).bind 'page:change', ->
  $(".select2").select2({
    theme: "classic"
  });

  $(".select2").find('.select2-search__field').removeAttr('style')


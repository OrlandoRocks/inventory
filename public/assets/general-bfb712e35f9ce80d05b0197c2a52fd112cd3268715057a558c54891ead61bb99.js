(function() {
  var elems;

  window.block = function(options) {
    var el, html;
    options = $.extend(true, {}, options);
    html = '';
    if (options.animate) {
      html = '<div class="loading-message ' + (options.boxed ? 'loading-message-boxed' : '') + '">' + '<div class="block-spinner-bar"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div></div>' + '</div>';
    } else if (options.iconOnly) {
      html = '<div class="loading-message ' + (options.boxed ? 'loading-message-boxed' : '') + '"><i class="fa fa-circle-o-notch fa-2x fa-spin"></i></div>';
    } else if (options.textOnly) {
      html = '<div class="loading-message ' + (options.boxed ? 'loading-message-boxed' : '') + '"><span>&nbsp;&nbsp;' + (options.message ? options.message : 'LOADING...') + '</span></div>';
    } else {
      html = '<div class="loading-message ' + (options.boxed ? 'loading-message-boxed' : '') + '"><i class="fa fa-circle-o-notch fa-2x fa-spin"></i><span>&nbsp;&nbsp;' + (options.message ? options.message : 'LOADING...') + '</span></div>';
      $('.wrapper').css('filter', 'blur(1.5px)');
    }
    if (options.target) {
      el = $(options.target);
      if (el.height() <= $(window).height()) {
        options.cenrerY = true;
      }
      el.block({
        message: html,
        baseZ: options.zIndex ? options.zIndex : 1000,
        centerY: options.cenrerY !== void 0 ? options.cenrerY : false,
        css: {
          top: '10%',
          border: '0',
          padding: '0',
          backgroundColor: 'none'
        },
        overlayCSS: {
          backgroundColor: options.overlayColor ? options.overlayColor : '#555',
          opacity: options.boxed ? 0.05 : 0.1,
          cursor: 'wait'
        }
      });
    } else {
      $.blockUI({
        message: html,
        baseZ: options.zIndex ? options.zIndex : 1000,
        css: {
          border: '0',
          padding: '0',
          backgroundColor: 'none'
        },
        overlayCSS: {
          backgroundColor: options.overlayColor ? options.overlayColor : '#555',
          opacity: options.boxed ? 0.05 : 0.2,
          cursor: 'wait'
        }
      });
    }
  };

  window.unblock = function(target) {
    if (target) {
      $(target).unblock({
        onUnblock: function() {
          $(target).css('position', '');
          $(target).css('zoom', '');
        }
      });
    } else {
      $.unblockUI();
      $('.wrapper').removeClass('blur');
      $('.wrapper').removeAttr('style');
    }
  };

  $(window).bind('page:change', function() {
    $('form').on('submit', function() {
      block({
        message: I18n.processing_message
      });
    });
    $(ClientSideValidations.selectors.forms).enableClientSideValidations();
    $('.btn-destroy').click(function(event) {
      var element, resource, resourceId, resourceMsg, row, url;
      element = $(this);
      row = element.closest('tr');
      resource = element.data('resource');
      resourceId = element.data('resource-id');
      resourceMsg = element.data('resource-message');
      url = resource + "/" + resourceId;
      swal.init();
      swal({
        text: resourceMsg,
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: I18n.confirm,
        cancelButtonText: I18n.cancel,
        closeOnConfirm: false,
        confirmButtonClass: 'btn btn-success btn-flat',
        cancelButtonClass: 'btn btn-danger btn-flat'
      }, function(isConfirm) {
        if (!isConfirm) {
          return;
        }
        $.ajax({
          url: url,
          type: 'DELETE',
          dataType: 'json',
          success: function(data) {
            swal({
              title: I18n.done,
              text: I18n.deleted,
              type: 'success',
              confirmButtonText: I18n.ok
            });
            $(row).remove();
          },
          error: function() {
            swal(I18n.error, I18n.try_again, 'error');
          }
        });
      });
    });
  });

  elems = Array.prototype.slice.call(document.querySelectorAll('.js-switch'));

  elems.forEach(function(html) {
    var switchery;
    return switchery = new Switchery(html);
  });

  $(window).bind('page:change', function() {
    $(".select2").select2({
      theme: "classic"
    });
    return $(".select2").find('.select2-search__field').removeAttr('style');
  });

}).call(this);

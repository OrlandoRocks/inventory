(function() {
  $(window).bind('page:change', function() {
    var PermissionMessage;
    $('#permission_controller').on('change', function() {
      var resource, url;
      resource = $('#permission_controller').val();
      url = $('#permission_controller').data('url');
      if (resource) {
        $.get(url, {
          resource: resource
        });
      } else {
        $('#permission_action').empty().append('<option>' + I18n.select + '</option>');
      }
    });
    $('.generate-seed').on('click', function() {
      $.ajax({
        url: '/permissions/generate_seeds',
        type: 'POST',
        dataType: 'json',
        success: function() {
          if (window.location.href.indexOf('?') > -1) {
            window.location.href = '/permissions#done';
          } else {
            window.location.href = '/permissions#done';
            location.reload();
          }
        },
        error: function() {}
      });
    });
    PermissionMessage = function() {
      if (window.location.hash === '#done') {
        window.location.replace('#');
        if (typeof window.history.replaceState === 'function') {
          history.replaceState({}, '', window.location.href.slice(0, -1));
        }
      }
    };
    PermissionMessage();
  });

}).call(this);

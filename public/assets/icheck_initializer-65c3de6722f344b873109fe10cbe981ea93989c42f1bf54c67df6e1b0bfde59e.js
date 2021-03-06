(function() {
  $(window).bind('page:change', function() {
    return icheck();
  });

  this.icheck = function() {
    if ($('.icheck-me').length > 0) {
      $('.icheck-me').each(function() {
        var $el, color, opt, skin;
        $el = $(this);
        skin = $el.attr('data-skin') !== void 0 ? '_' + $el.attr('data-skin') : '';
        color = $el.attr('data-color') !== void 0 ? '-' + $el.attr('data-color') : '';
        opt = {
          checkboxClass: 'icheckbox' + skin + color,
          radioClass: 'iradio' + skin + color
        };
        $el.iCheck(opt);
      });
    }
  };

}).call(this);

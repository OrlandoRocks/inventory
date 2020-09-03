(function() {
  var changeSkin, current_skin, getSkin, storeSkin;

  current_skin = null;

  storeSkin = function(skin) {
    localStorage.setItem('skin', skin);
  };

  getSkin = function() {
    return localStorage.getItem('skin');
  };

  changeSkin = function(skin) {
    var body_classes;
    body_classes = $('body').attr('class').split(' ');
    $.each(body_classes, function(index, value) {
      if (value.match(/skin-([a-zA-Z]+)(-[a-zA-Z]+)?/)) {
        current_skin = value;
      }
    });
    $('body').removeClass(current_skin);
    $('body').addClass(skin);
    storeSkin(skin);
  };

  $(window).bind('page:change', function() {
    var tmpSkin;
    tmpSkin = getSkin();
    if (tmpSkin) {
      changeSkin(tmpSkin);
    }
    return $("[data-skin]").on('click', function(e) {
      e.preventDefault();
      changeSkin($(this).data('skin'));
    });
  });

}).call(this);

(function() {
  $(window).bind('page:change', function() {
    $('#StrengthProgressBar').zxcvbnProgressBar({
      passwordInput: "#Password"
    });
  });

}).call(this);

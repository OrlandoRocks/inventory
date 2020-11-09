(function() {
  $('.alert').click(function() {
    $(this).fadeOut();
  });

  setTimeout((function() {
    $('.alert').fadeOut();
  }), 4000);

}).call(this);

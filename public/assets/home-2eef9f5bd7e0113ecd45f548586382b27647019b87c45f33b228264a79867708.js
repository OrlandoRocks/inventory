(function() {
  $(window).bind('page:change', function() {
    $('.date-range').daterangepicker({
      autoUpdateInput: false,
      buttonClasses: 'btn btn-sm btn-flat',
      locale: {
        autoUpdateInput: false,
        format: I18n.date_format,
        cancelLabel: I18n.cancel,
        applyLabel: I18n.confirm,
        daysOfWeek: [I18n.sunday, I18n.monday, I18n.tuesday, I18n.wednesday, I18n.thursday, I18n.friday, I18n.saturnday],
        monthNames: [I18n.january, I18n.february, I18n.march, I18n.april, I18n.may, I18n.june, I18n.july, I18n.august, I18n.september, I18n.october, I18n.november, I18n.december]
      }
    }, function(start, end, format) {
      $('#start_date').val(start.format(I18n.date_format));
      $('#end_date').val(end.format(I18n.date_format));
    });
    $('.date-range').on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format(I18n.date_format) + ' - ' + picker.endDate.format(I18n.date_format));
    });
    $('.date-range').on('cancel.daterangepicker', function(ev, picker) {
      $('#start_date').val('');
      $('#end_date').val('');
      $(this).val('');
    });
  });

}).call(this);

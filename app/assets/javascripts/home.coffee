# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).bind 'page:change', ->
# Enables date range picker
  $('.date-range').daterangepicker {
    autoUpdateInput: false,
    buttonClasses: 'btn btn-sm btn-flat'
    locale: {
      autoUpdateInput: false
      format: I18n.date_format
      cancelLabel: I18n.cancel
      applyLabel: I18n.confirm
      daysOfWeek: [
        I18n.sunday
        I18n.monday
        I18n.tuesday
        I18n.wednesday
        I18n.thursday
        I18n.friday
        I18n.saturnday
      ]
      monthNames: [
        I18n.january
        I18n.february
        I18n.march
        I18n.april
        I18n.may
        I18n.june
        I18n.july
        I18n.august
        I18n.september
        I18n.october
        I18n.november
        I18n.december
      ]
    }
  }, (start, end, format) ->
    $('#start_date').val start.format(I18n.date_format)
    $('#end_date').val end.format(I18n.date_format)
    return

  $('.date-range').on 'apply.daterangepicker', (ev, picker) ->
    $(this).val(picker.startDate.format(I18n.date_format) + ' - ' + picker.endDate.format(I18n.date_format));
    return

  $('.date-range').on 'cancel.daterangepicker', (ev, picker) ->
    $('#start_date').val ''
    $('#end_date').val ''
    $(this).val('')
    return


  return

$(window).bind 'page:change', ->
  $('#modal-unassign-item').on 'show.bs.modal', (e) ->
    #get data-id attribute of the clicked element
    itemName = $(e.relatedTarget).data('item-name')
    itemId = $(e.relatedTarget).data('item-id')
    statusItemId = $(e.relatedTarget).data('item-status')

    # populate the textbox
    $(e.currentTarget).find('.modal-title').text(itemName)
    $(e.currentTarget).find('#item_id').val(itemId)
    $(e.currentTarget).find('#item_status_item_id').val(statusItemId)
    return

  $('#modal-unassign-item').on 'click', 'button#unassignItem', (e) ->
    form = $('form#unassign-item')
    data = {
      id: form.find('#item_id').val()
      item: {
        status_item_id: form.find('#item_status_item_id').val()
      }
    }

    $.ajax
      method: 'PUT'
      url: form.attr('action')
      data: data
      success: (msg) ->
        $('#modal-unassign-item').modal('hide')
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
        block()
        location.reload();
      error: (err) ->
        swal I18n.general_error, I18n.try_again, 'error'
    return

  $('#modal-assign-item').on 'show.bs.modal', (e) ->
    #get data-id attribute of the clicked element
    itemName = $(e.relatedTarget).data('item-name')
    itemId = $(e.relatedTarget).data('item-id')
    itemUserId = $(e.relatedTarget).data('item-user-id')
    statusItemId = $(e.relatedTarget).data('item-status')


    # populate the textbox
    $(e.currentTarget).find('.modal-title').text(itemName)
    $(e.currentTarget).find('#item_id').val(itemId)
    $(e.currentTarget).find('#item_user_id').val(itemUserId)
    $(e.currentTarget).find('#item_status_item_id').val(statusItemId)
    return

  $('#modal-assign-item').on 'click', 'button#assignItem', (e) ->
    form = $('form#assign-item')
    data = {
      id: form.find('#item_id').val()
      item: {
        status_item_id: form.find('#item_status_item_id').val()
        user_id: form.find('#item_user_id').val()
      }
    }

    $.ajax
      method: 'PUT'
      url: form.attr('action')
      data: data
      success: (msg) ->
        $('#modal-assign-item').modal('hide')
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
        block()
        location.reload();
      error: (err) ->
        swal I18n.general_error, I18n.try_again, 'error'
    return

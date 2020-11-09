(function() {
  $(window).bind('page:change', function() {
    $('#modal-unassign-item').on('show.bs.modal', function(e) {
      var itemId, itemName, statusItemId;
      itemName = $(e.relatedTarget).data('item-name');
      itemId = $(e.relatedTarget).data('item-id');
      statusItemId = $(e.relatedTarget).data('item-status');
      $(e.currentTarget).find('.modal-title').text(itemName);
      $(e.currentTarget).find('#item_id').val(itemId);
      $(e.currentTarget).find('#item_status_item_id').val(statusItemId);
    });
    $('#modal-unassign-item').on('click', 'button#unassignItem', function(e) {
      var data, form;
      form = $('form#unassign-item');
      data = {
        id: form.find('#item_id').val(),
        item: {
          status_item_id: form.find('#item_status_item_id').val()
        }
      };
      $.ajax({
        method: 'PUT',
        url: form.attr('action'),
        data: data,
        success: function(msg) {
          $('#modal-unassign-item').modal('hide');
          $('body').removeClass('modal-open');
          $('.modal-backdrop').remove();
          block();
          return location.reload();
        },
        error: function(err) {
          return swal(I18n.general_error, I18n.try_again, 'error');
        }
      });
    });
    $('#modal-assign-item').on('show.bs.modal', function(e) {
      var itemId, itemName, itemUserId, statusItemId;
      itemName = $(e.relatedTarget).data('item-name');
      itemId = $(e.relatedTarget).data('item-id');
      itemUserId = $(e.relatedTarget).data('item-user-id');
      statusItemId = $(e.relatedTarget).data('item-status');
      $(e.currentTarget).find('.modal-title').text(itemName);
      $(e.currentTarget).find('#item_id').val(itemId);
      $(e.currentTarget).find('#item_user_id').val(itemUserId);
      $(e.currentTarget).find('#item_status_item_id').val(statusItemId);
    });
    return $('#modal-assign-item').on('click', 'button#assignItem', function(e) {
      var data, form;
      form = $('form#assign-item');
      data = {
        id: form.find('#item_id').val(),
        item: {
          status_item_id: form.find('#item_status_item_id').val(),
          user_id: form.find('#item_user_id').val()
        }
      };
      $.ajax({
        method: 'PUT',
        url: form.attr('action'),
        data: data,
        success: function(msg) {
          $('#modal-assign-item').modal('hide');
          $('body').removeClass('modal-open');
          $('.modal-backdrop').remove();
          block();
          return location.reload();
        },
        error: function(err) {
          return swal(I18n.general_error, I18n.try_again, 'error');
        }
      });
    });
  });

}).call(this);

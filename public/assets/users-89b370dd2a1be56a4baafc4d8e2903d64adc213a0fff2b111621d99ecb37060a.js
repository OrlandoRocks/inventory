(function() {
  $(window).bind('page:change', function() {
    var $file, searchWorkArticles;
    keyBlocker($('#user_username'), /(^[a-z0-9_\.]+$)/);
    $(function() {
      $('#users_index').DataTable({
        'paging': false,
        'lengthChange': false,
        'searching': false,
        'ordering': true,
        'info': true,
        'autoWidth': false
      });
    });
    $file = $('#file_input');
    $file.change(function() {
      $('#display_input').val($(this).val().replace(/^.*[\\\/]/, ''));
    });
    $('#select_btn').click(function() {
      $file.click();
    });
    $('#file_input').bind('change', function() {
      var file, type;
      file = this.files[0];
      type = /(image)[\/](gif|jpe?g|png|bmp)$/;
      if (file.size > 5000000) {
        toastr.warning(I18n.profile_file_size);
        this.value = null;
        $('#display_input').val(null);
      } else if (!type.test(file.type)) {
        toastr.warning(I18n.profile_file_type);
        this.value = null;
        $('#display_input').val(null);
        return;
      }
    });
    $('#search-work-articles-assigned').submit(function(e) {
      var form, url;
      e.preventDefault();
      form = $(e.target);
      url = form.attr('action');
      url = url + '?' + form.serialize();
      searchWorkArticles(url, $('#content-work-articles-assigned'));
    });
    $('#work-articles-assigned').on('click', '.pagination a', function() {
      var url;
      url = this.href;
      searchWorkArticles(url, $('#content-work-articles-assigned'));
      return false;
    });
    $('#search-work-articles').submit(function(e) {
      var form, url;
      e.preventDefault();
      form = $(e.target);
      url = form.attr('action');
      url = url + '?' + form.serialize();
      searchWorkArticles(url, $('#content-work-articles'));
    });
    $('#work-articles').on('click', '.pagination a', function() {
      var url;
      url = this.href;
      searchWorkArticles(url, $('#content-work-articles'));
      return false;
    });
    searchWorkArticles = function(url, element) {
      $.ajax({
        method: 'GET',
        url: url
      }).done(function(data) {
        element.html(data);
        icheck();
        unblock();
      }).error(function() {
        unblock();
      });
    };
    $('#search-work-articles-assigned').submit();
    $('#search-work-articles').submit();
    $('#work-articles').on('show.bs.modal', '#modal-assign-work-article', function(e) {
      var userId, workArticleId, workArticleName;
      workArticleName = $(e.relatedTarget).data('work-article-name');
      workArticleId = $(e.relatedTarget).data('work-article-id');
      userId = $(e.relatedTarget).data('user-id');
      $(e.currentTarget).find('.modal-title').text(I18n.add + ' ' + workArticleName);
      $(e.currentTarget).find('#users_work_article_work_article_id').val(workArticleId);
      $(e.currentTarget).find('#users_work_article_user_id').val(userId);
    });
    $('#work-articles').on('click', 'button#addWorkArticle', function(e) {
      var data, form;
      form = $('form#add-work-article');
      data = {
        id: form.find('#users_work_article_user_id').val(),
        users_work_article: {
          reception_status: form.find('#users_work_article_reception_status').val(),
          work_article_id: form.find('#users_work_article_work_article_id').val()
        }
      };
      $.ajax({
        method: 'POST',
        url: form.attr('action'),
        data: data,
        success: function(msg) {
          $('#search-work-articles-assigned').submit();
          $('#search-work-articles').submit();
          $('#modal-assign-work-article').modal('hide');
          $('body').removeClass('modal-open');
          return $('.modal-backdrop').remove();
        },
        error: function(err) {
          return swal(I18n.general_error, I18n.try_again, 'error');
        }
      });
    });
    $('#work-articles-assigned').on('show.bs.modal', '#modal-remove-work-article', function(e) {
      var usersWorkArticleId, workArticleName;
      workArticleName = $(e.relatedTarget).data('work-article-name');
      usersWorkArticleId = $(e.relatedTarget).data('users-work-article-id');
      $(e.currentTarget).find('.modal-title').text(I18n.remove + ' ' + workArticleName);
      $(e.currentTarget).find('#users_work_article_id').val(usersWorkArticleId);
    });
    $('#work-articles-assigned').on('click', 'button#removeWorkArticle', function(e) {
      var data, form;
      form = $('form#remove-work-article');
      data = {
        id: form.find('#users_work_article_id').val(),
        users_work_article: {
          delivery_status: form.find('#users_work_article_delivery_status').val()
        }
      };
      $.ajax({
        method: 'PUT',
        url: form.attr('action'),
        data: data,
        success: function(msg) {
          $('#search-work-articles-assigned').submit();
          $('#search-work-articles').submit();
          $('#modal-assign-work-article').modal('hide');
          $('body').removeClass('modal-open');
          return $('.modal-backdrop').remove();
        },
        error: function(err) {
          return swal(I18n.general_error, I18n.try_again, 'error');
        }
      });
    });
  });

}).call(this);

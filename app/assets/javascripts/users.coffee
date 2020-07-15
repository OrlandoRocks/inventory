# Modifies user form
$(window).bind 'page:change', ->
  keyBlocker $('#user_username'), /(^[a-z0-9_\.]+$)/

  $ ->
    $('#users_index').DataTable
      'paging': false
      'lengthChange': false
      'searching': false
      'ordering': true
      'info': true
      'autoWidth': false
    return

  $file = $('#file_input')
  $file.change ->
    $('#display_input').val $(@).val().replace(/^.*[\\\/]/, '')
    return
  $('#select_btn').click ->
    $file.click()
    return

  $('#file_input').bind 'change', ->
    file = this.files[0]
    type = /(image)[\/](gif|jpe?g|png|bmp)$/;
    if file.size > 5000000
      toastr.warning I18n.profile_file_size
      this.value = null
      $('#display_input').val(null)
    else if !type.test file.type
      toastr.warning I18n.profile_file_type
      this.value = null
      $('#display_input').val(null)
      return
    return

  $('#search-work-articles-assigned').submit (e) ->
    e.preventDefault()
    form = $(e.target)
    url = form.attr('action')
    url = url + '?' + form.serialize()
    searchWorkArticles(url, $('#content-work-articles-assigned'))
    return

  $('#work-articles-assigned').on 'click', '.pagination a', ->
    url = this.href
    searchWorkArticles(url, $('#content-work-articles-assigned'))
    return false


  $('#search-work-articles').submit (e) ->
    e.preventDefault()
    form = $(e.target)
    url = form.attr('action')
    url = url + '?' + form.serialize()
    searchWorkArticles(url, $('#content-work-articles'))
    return

  $('#work-articles').on 'click', '.pagination a', ->
    url = this.href
    searchWorkArticles(url, $('#content-work-articles'))
    return false

  searchWorkArticles = (url, element) ->
    $.ajax
      method: 'GET'
      url: url
    .done (data) ->
      element.html(data)
      icheck()
      unblock()
      return
    .error ->
      unblock()
      return
    return


  $('#search-work-articles-assigned').submit()
  $('#search-work-articles').submit()

  $('#work-articles').on 'show.bs.modal', '#modal-assign-work-article', (e) ->
    #get data-id attribute of the clicked element
    workArticleName = $(e.relatedTarget).data('work-article-name')
    workArticleId = $(e.relatedTarget).data('work-article-id')
    userId = $(e.relatedTarget).data('user-id')

    # populate the textbox
    $(e.currentTarget).find('.modal-title').text(I18n.add + ' ' + workArticleName)
    $(e.currentTarget).find('#users_work_article_work_article_id').val(workArticleId)
    $(e.currentTarget).find('#users_work_article_user_id').val(userId)
    return

  $('#work-articles').on 'click', 'button#addWorkArticle', (e) ->
    form = $('form#add-work-article')
    data = {
      id: form.find('#users_work_article_user_id').val()
      users_work_article: {
        reception_status: form.find('#users_work_article_reception_status').val()
        work_article_id: form.find('#users_work_article_work_article_id').val()
      }
    }

    $.ajax
      method: 'POST'
      url: form.attr('action')
      data: data
      success: (msg) ->
        $('#search-work-articles-assigned').submit()
        $('#search-work-articles').submit()
        $('#modal-assign-work-article').modal('hide')
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
      error: (err) ->
        swal I18n.general_error, I18n.try_again, 'error'
    return



  $('#work-articles-assigned').on 'show.bs.modal', '#modal-remove-work-article', (e) ->
    #get data-id attribute of the clicked element
    workArticleName = $(e.relatedTarget).data('work-article-name')
    usersWorkArticleId = $(e.relatedTarget).data('users-work-article-id')
#    userId = $(e.relatedTarget).data('user-id')

    # populate the textbox
    $(e.currentTarget).find('.modal-title').text(I18n.remove + ' ' + workArticleName)
    $(e.currentTarget).find('#users_work_article_id').val(usersWorkArticleId)
#    $(e.currentTarget).find('#users_work_article_user_id').val(userId)
    return

  $('#work-articles-assigned').on 'click', 'button#removeWorkArticle', (e) ->
    form = $('form#remove-work-article')
    data = {
      id: form.find('#users_work_article_id').val()
      users_work_article: {
        delivery_status: form.find('#users_work_article_delivery_status').val()
      }
    }



    $.ajax
      method: 'PUT'
      url: form.attr('action')
      data: data
      success: (msg) ->
        $('#search-work-articles-assigned').submit()
        $('#search-work-articles').submit()
        $('#modal-assign-work-article').modal('hide')
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
      error: (err) ->
        swal I18n.general_error, I18n.try_again, 'error'
    return

  return

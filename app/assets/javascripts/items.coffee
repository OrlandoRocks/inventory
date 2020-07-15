# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).bind 'page:change', ->
  window.deparments_filtered = []
  window.deparment_selected = ''
  window.code_selected = ''
  window.isEdit = false

  $('#immediate_boss').text('Admin')



  $('#maintenanceModal').on 'shown.bs.modal', (e) ->
    #get data-id attribute of the clicked element
    itemId = $(e.relatedTarget).data('item-id')
    console.log itemId
    # usersWorkArticleId = $(e.relatedTarget).data('users-work-article-id')
    #    userId = $(e.relatedTarget).data('user-id')

    # populate the textbox
    $(e.currentTarget).find('.modal-title').text(I18n.maintenance)
    $(e.currentTarget).find('#items_maintenance_item_id').val(itemId);
    # $(e.currentTarget).find('#users_work_article_id').val(usersWorkArticleId)
    # $(e.currentTarget).find('#users_work_article_user_id').val(userId)
    return

  $('#saveMaintenance').on 'click', (e) ->
    form = $('form#maintenance-form')
    data = {
      items_maintenance: {
        maintenance_id: form.find('#items_maintenance_maintenance_id').val()
        description: form.find('#items_maintenance_description').val()
        price: form.find('#items_maintenance_price').val()
        provider: form.find('#items_maintenance_provider').val()
        item_id: form.find('#items_maintenance_item_id').val()
      }
    }

    $.ajax
      method: 'POST'
      url: form.attr('action')
      data: data
      success: (msg) ->
#        $('#search-work-articles-assigned').submit()
#        $('#search-work-articles').submit()

        $('#maintenanceModal').modal('hide')
        $('body').removeClass('modal-open');
        $('.modal-backdrop').remove();
      error: (err) ->
        swal I18n.general_error, I18n.try_again, 'error'
    return


  $('#reporter_form').submit (e) ->
    $this = $(this)
    e.preventDefault()
    $.ajax
      method: 'GET'
      url: '/reporter.js'
      data: $this.serialize()
      success: (result) ->
        unblock()
    return

  $('#reporter-list').on 'click', '.paging_simple_numbers a', (e) ->
    $.getScript(this.href);
    return false

  qBranchIdIn = $('#q_branch_id_in')

  if qBranchIdIn.val() != ''
    branchIdIn = qBranchIdIn.val()
    departmentIdIn = $('#q_department_id_in').val()
    $('#q_department_id_in').html('')

    if branchIdIn
      changeDepartmentsSelect(branchIdIn, departmentIdIn)

#    qBranchIdIn.change ->
#      $this = $(this)
#      changeDepartmentsSelect($this.val(), null)
#      return

  qBranchIdIn.change ->
    departmentIdIn = $('#q_department_id_in').val() == '' ? null : $('#q_department_id_in').val();
    $this = $(this)
    changeDepartmentsSelect($this.val(), departmentIdIn)
    return
#  qCategoryIdIn = $('#q_category_id_in')
#  if qCategoryIdIn.length > 0
#    categoryIdIn = qCategoryIdIn.val()
#    subCategoryIdIn = $('#q_sub_category_id_in').val()
#    $('#q_sub_category_id_in').html('')
#
#    if categoryIdIn != null
#      changeSubCategoriesSelect(categoryIdIn, subCategoryIdIn)
#      return
#
#    qCategoryIdIn.change ->
#      $this = $(this)
#      changeSubCategoriesSelect($this.val(), null)
#      return


  $itemBranchId = $('#item_branch_id');
  $departmentId = $('#item_department_id');
  $userId = $('#user_id');
  $immediateBoss = $('#immediate_boss')
  $departmentCode = $('#item_code');
  $categoryId = $('#category_id');
  $SubCategoryId = $('#item_sub_category_id');
  $SubCategoryId.prop('disabled', true);
  $itemUserId = $('#item_user_id')


  $itemBranchId.change ->
    $this = $(this)

    director_obj = $.parseJSON( $('#director_name').val() )
    if($this.val() == '')
      $userId = $('#item_user_id')
      $userId.html('')
#      $('<option>').val('').text('Seleccionar...').appendTo($userId);
      $userId.append(new Option( director_obj.full_name.concat(' - Director') , director_obj.id))
      $('#immediate_boss').text('Admin')
      $departmentId.html('')
    else
      changeDepartmentsSelectForm($this.val(), null)
    return

  if $itemBranchId.val() != ''
    changeDepartmentsSelectForm($itemBranchId.val(), $departmentId.val())


  $departmentId.change ->
    $this = $(this)
    if($this.val()!='')
      window.isEdit = false
      setDepartmentCode($this.val(), false)
    else
      changeDepartmentsSelectForm($itemBranchId.val(), null)
    return

  if $departmentId.val() != ''
    window.isEdit = true
    window.deparment_selected = $departmentId.val();
    window.code_selected = $departmentCode.val();
    setDepartmentCode($departmentId.val(), true)


  $itemUserId.change ->
    $this = $(this);
    first_user = $('#item_user_id option:first').val();

    $('#user_id').val($this.val());
    for department in window.deparments_filtered
      if (parseInt(department.id) == parseInt($departmentId.val()))
        if(parseInt(first_user) == parseInt($this.val()))
          $immediateBoss.text(department.branch.user.full_name)
        else
          $immediateBoss.text(department.manager['first_name']+' '+department.manager['last_name'])
        return
    return


    return


  $categoryId.change ->
    $this = $(this)
    changeSubCategoriesSelect($categoryId.val(), null)
    return

  if $categoryId.val() != ''
    changeSubCategoriesSelect($categoryId.val(),$SubCategoryId.val() )

  return


setDepartmentCode = (departmentId, first_time) ->
  $userId = $('#item_user_id')
  $departmentCode = $('#item_code')
  $departmentCode2 = $('#item_code2')
  $immediateBoss = $('#immediate_boss')
  $immediateBossID = $('#immediate_boss_id')
  $departmentCode.prop('disabled', true);
  departmentSelected = {}


#  console.log($departmentCode.val())
  if (departmentId != '')



    $userId.html('')
#    $('<option>').val('').text('Seleccionar...').appendTo($userId);
    for department in window.deparments_filtered
      if (parseInt(department.id)==parseInt(departmentId))


        if(department.manager)
          users = department.manager['first_name']+' '+department.manager['last_name'].concat ' - Coordinador'
          $userId.append(new Option( users , department.manager.id))
          first_user = $('#item_user_id option:first').val();

        for employees in department.employees
          employee = employees['first_name']+' '+employees['last_name'].concat ' - Empleado Responsable'
          $userId.append(new Option( employee , employees.id))

        if(department.manager)
          $immediateBossID.val(department.manager['id'])
          $immediateBoss.text(department.branch.user.full_name)
#          $immediateBoss.text(department.manager['first_name']+' '+department.manager['last_name'])
        if(!window.isEdit)
          if (department.last_code)
            secuence = parseInt((department.last_code).slice(-4)) + 1
          else
            secuence = department.sequence
          if (window.deparment_selected == departmentId)
            $departmentCode.val(window.code_selected)
            $departmentCode2.val(window.code_selected)
          else if department.branch.code==null or department.code == null
            $departmentCode.val('Sin Codigo')
          else
            $departmentCode.val(department.branch.code+'-'+department.code+'-'+("000" + secuence).slice(-4))
            $departmentCode2.val(department.branch.code+'-'+department.code+'-'+("000" + secuence).slice(-4))

        if $userId.val() != '' && first_time
          first_user = $('#item_user_id option:first').val();
          if(parseInt(first_user) == parseInt($('#user_id').val()))
            $immediateBoss.text(department.branch.user.full_name)
          else
            $immediateBoss.text(department.manager['first_name']+' '+department.manager['last_name'])

        return
    return
  return


changeDepartmentsSelectForm = (branchId, departmentId) ->
  $immediateBoss = $('#immediate_boss')
  $departmentId = $('#item_department_id')
  $userIdHid = $('#user_id')
  $userId = $('#item_user_id')
  $departmentCode = $('#item_code')
  $departmentCode2 = $('#item_code2')

  if(departmentId==null)
    $departmentCode.val('')
    $departmentCode2.val('')
    $departmentCode.prop('disabled', true)

  $departmentId.prop('disabled', false);

  select_val = $departmentId.val()
  director_obj = $.parseJSON( $('#director_name').val() )

#  console.log(director_obj);

  if director_obj?
    $immediateBoss.text(director_obj.full_name)
  
   


  if (branchId != '')
    $.ajax
      type: 'GET',
      url: '/branches/' + branchId + '/departments',
      success: (departments) ->

        window.deparments_filtered = departments
        $departmentId.html('')
        $userId.html('')
        users = departments[0].branch.user.full_name.concat " - Gerente"
        $('<option>').val('').text('Seleccionar...').appendTo($departmentId);
#        $('<option>').val('').text('Seleccionar...').appendTo($userId);
        $userId.append(new Option( users , departments[0].branch.user.id))

        for department in departments

          $departmentId.append(new Option(department.name, department.id))
        if departmentId != null
#          $('#item_department_id option:eq('+departmentId+')')
          $('#item_department_id option[value="'+select_val+'"]').attr("selected",true)
          setDepartmentCode(departmentId, true)
          $('#item_user_id option[value="'+$userIdHid.val()+'"]').attr("selected",true)
          return
#          $departmentId.val(departmentId)
  else
    $departmentId.html('');

  return


changeDepartmentsSelect = (data, departmentIdIn) ->
  if (data != null)
    $.ajax
      method: 'GET'
      url: '/branches/departments/'
      data: { branch_ids: data }
      success: (result) ->
        $('#q_department_id_in').html('');
        for branch in result
          id = branch.id
          name = branch.name
          optgroup = $('<optgroup>');
          optgroup.attr('label', branch.name)
          for department in branch.departments
            option = $('<option></option>')
            option.val(department.id)
            option.text(department.name)
            optgroup.append(option)
          $('#q_department_id_in').append(optgroup)
        if (departmentIdIn != null)
          $('#q_department_id_in').val(departmentIdIn)
          $(".select2").select2({ theme: "classic" });
          return
        return

  else
    $('#q_department_id_in').html('')
  return


changeSubCategoriesSelect = (data, subCategoryIdIn) ->
  $subCategoryId = $('#item_sub_category_id')

  if (data != null)
    $.ajax
      method: 'GET'
      url: '/categories/sub_categories/'
      data: { category_ids: data }
      success: (result) ->
        $subCategoryId.prop('disabled', false);
        $subCategoryId.html('');
        for sub_category in result.sub_categories
          $subCategoryId.append(new Option(sub_category.name, sub_category.id))
        if (subCategoryIdIn != null)
          $subCategoryId.val(subCategoryIdIn)
#          $('#q_sub_category_id_in').val(subCategoryIdIn)
#          $(".select2").select2({ theme: "classic" });
          return
        return

  else
    $subCategoryId.html('')
#    $('#q_sub_category_id_in').html('')
  return


(function() {
  var changeDepartmentsSelect, changeDepartmentsSelectForm, changeSubCategoriesSelect, setDepartmentCode;

  $(window).bind('page:change', function() {
    var $SubCategoryId, $categoryId, $departmentCode, $departmentId, $immediateBoss, $itemBranchId, $itemUserId, $userId, branchIdIn, departmentIdIn, qBranchIdIn;
    window.deparments_filtered = [];
    window.deparment_selected = '';
    window.code_selected = '';
    window.isEdit = false;
    $('#immediate_boss').text('Admin');
    $('#maintenanceModal').on('shown.bs.modal', function(e) {
      var itemId;
      itemId = $(e.relatedTarget).data('item-id');
      console.log(itemId);
      $(e.currentTarget).find('.modal-title').text(I18n.maintenance);
      $(e.currentTarget).find('#items_maintenance_item_id').val(itemId);
    });
    $('#saveMaintenance').on('click', function(e) {
      var data, form;
      form = $('form#maintenance-form');
      data = {
        items_maintenance: {
          maintenance_id: form.find('#items_maintenance_maintenance_id').val(),
          description: form.find('#items_maintenance_description').val(),
          price: form.find('#items_maintenance_price').val(),
          provider: form.find('#items_maintenance_provider').val(),
          item_id: form.find('#items_maintenance_item_id').val()
        }
      };
      $.ajax({
        method: 'POST',
        url: form.attr('action'),
        data: data,
        success: function(msg) {
          $('#maintenanceModal').modal('hide');
          $('body').removeClass('modal-open');
          return $('.modal-backdrop').remove();
        },
        error: function(err) {
          return swal(I18n.general_error, I18n.try_again, 'error');
        }
      });
    });
    $('#reporter_form').submit(function(e) {
      var $this;
      $this = $(this);
      e.preventDefault();
      $.ajax({
        method: 'GET',
        url: '/reporter.js',
        data: $this.serialize(),
        success: function(result) {
          return unblock();
        }
      });
    });
    $('#reporter-list').on('click', '.paging_simple_numbers a', function(e) {
      $.getScript(this.href);
      return false;
    });
    qBranchIdIn = $('#q_branch_id_in');
    if (qBranchIdIn.val() !== '') {
      branchIdIn = qBranchIdIn.val();
      departmentIdIn = $('#q_department_id_in').val();
      $('#q_department_id_in').html('');
      if (branchIdIn) {
        changeDepartmentsSelect(branchIdIn, departmentIdIn);
      }
    }
    qBranchIdIn.change(function() {
      var $this, ref;
      departmentIdIn = (ref = $('#q_department_id_in').val() === '') != null ? ref : {
        "null": $('#q_department_id_in').val()
      };
      $this = $(this);
      changeDepartmentsSelect($this.val(), departmentIdIn);
    });
    $itemBranchId = $('#item_branch_id');
    $departmentId = $('#item_department_id');
    $userId = $('#user_id');
    $immediateBoss = $('#immediate_boss');
    $departmentCode = $('#item_code');
    $categoryId = $('#category_id');
    $SubCategoryId = $('#item_sub_category_id');
    $SubCategoryId.prop('disabled', true);
    $itemUserId = $('#item_user_id');
    $itemBranchId.change(function() {
      var $this, director_obj;
      $this = $(this);
      director_obj = $.parseJSON($('#director_name').val());
      if ($this.val() === '') {
        $userId = $('#item_user_id');
        $userId.html('');
        $userId.append(new Option(director_obj.full_name.concat(' - Director'), director_obj.id));
        $('#immediate_boss').text('Admin');
        $departmentId.html('');
      } else {
        changeDepartmentsSelectForm($this.val(), null);
      }
    });
    if ($itemBranchId.val() !== '') {
      changeDepartmentsSelectForm($itemBranchId.val(), $departmentId.val());
    }
    $departmentId.change(function() {
      var $this;
      $this = $(this);
      if ($this.val() !== '') {
        window.isEdit = false;
        setDepartmentCode($this.val(), false);
      } else {
        changeDepartmentsSelectForm($itemBranchId.val(), null);
      }
    });
    if ($departmentId.val() !== '') {
      window.isEdit = true;
      window.deparment_selected = $departmentId.val();
      window.code_selected = $departmentCode.val();
      setDepartmentCode($departmentId.val(), true);
    }
    $itemUserId.change(function() {
      var $this, department, first_user, i, len, ref;
      $this = $(this);
      first_user = $('#item_user_id option:first').val();
      $('#user_id').val($this.val());
      ref = window.deparments_filtered;
      for (i = 0, len = ref.length; i < len; i++) {
        department = ref[i];
        if (parseInt(department.id) === parseInt($departmentId.val())) {
          if (parseInt(first_user) === parseInt($this.val())) {
            $immediateBoss.text(department.branch.user.full_name);
          } else {
            $immediateBoss.text(department.manager['first_name'] + ' ' + department.manager['last_name']);
          }
          return;
        }
      }
      return;
    });
    $categoryId.change(function() {
      var $this;
      $this = $(this);
      changeSubCategoriesSelect($categoryId.val(), null);
    });
    if ($categoryId.val() !== '') {
      changeSubCategoriesSelect($categoryId.val(), $SubCategoryId.val());
    }
  });

  setDepartmentCode = function(departmentId, first_time) {
    var $departmentCode, $departmentCode2, $immediateBoss, $immediateBossID, $userId, department, departmentSelected, employee, employees, first_user, i, j, len, len1, ref, ref1, secuence, users;
    $userId = $('#item_user_id');
    $departmentCode = $('#item_code');
    $departmentCode2 = $('#item_code2');
    $immediateBoss = $('#immediate_boss');
    $immediateBossID = $('#immediate_boss_id');
    $departmentCode.prop('disabled', true);
    departmentSelected = {};
    if (departmentId !== '') {
      $userId.html('');
      ref = window.deparments_filtered;
      for (i = 0, len = ref.length; i < len; i++) {
        department = ref[i];
        if (parseInt(department.id) === parseInt(departmentId)) {
          if (department.manager) {
            users = department.manager['first_name'] + ' ' + department.manager['last_name'].concat(' - Coordinador');
            $userId.append(new Option(users, department.manager.id));
            first_user = $('#item_user_id option:first').val();
          }
          ref1 = department.employees;
          for (j = 0, len1 = ref1.length; j < len1; j++) {
            employees = ref1[j];
            employee = employees['first_name'] + ' ' + employees['last_name'].concat(' - Empleado Responsable');
            $userId.append(new Option(employee, employees.id));
          }
          if (department.manager) {
            $immediateBossID.val(department.manager['id']);
            $immediateBoss.text(department.branch.user.full_name);
          }
          if (!window.isEdit) {
            if (department.last_code) {
              secuence = parseInt(department.last_code.slice(-4)) + 1;
            } else {
              secuence = department.sequence;
            }
            if (window.deparment_selected === departmentId) {
              $departmentCode.val(window.code_selected);
              $departmentCode2.val(window.code_selected);
            } else if (department.branch.code === null || department.code === null) {
              $departmentCode.val('Sin Codigo');
            } else {
              $departmentCode.val(department.branch.code + '-' + department.code + '-' + ("000" + secuence).slice(-4));
              $departmentCode2.val(department.branch.code + '-' + department.code + '-' + ("000" + secuence).slice(-4));
            }
          }
          if ($userId.val() !== '' && first_time) {
            first_user = $('#item_user_id option:first').val();
            if (parseInt(first_user) === parseInt($('#user_id').val())) {
              $immediateBoss.text(department.branch.user.full_name);
            } else {
              $immediateBoss.text(department.manager['first_name'] + ' ' + department.manager['last_name']);
            }
          }
          return;
        }
      }
      return;
    }
  };

  changeDepartmentsSelectForm = function(branchId, departmentId) {
    var $departmentCode, $departmentCode2, $departmentId, $immediateBoss, $userId, $userIdHid, director_obj, select_val;
    $immediateBoss = $('#immediate_boss');
    $departmentId = $('#item_department_id');
    $userIdHid = $('#user_id');
    $userId = $('#item_user_id');
    $departmentCode = $('#item_code');
    $departmentCode2 = $('#item_code2');
    if (departmentId === null) {
      $departmentCode.val('');
      $departmentCode2.val('');
      $departmentCode.prop('disabled', true);
    }
    $departmentId.prop('disabled', false);
    select_val = $departmentId.val();
    director_obj = $.parseJSON($('#director_name').val());
    if (director_obj != null) {
      $immediateBoss.text(director_obj.full_name);
    }
    if (branchId !== '') {
      $.ajax({
        type: 'GET',
        url: '/branches/' + branchId + '/departments',
        success: function(departments) {
          var department, i, len, users;
          window.deparments_filtered = departments;
          $departmentId.html('');
          $userId.html('');
          users = departments[0].branch.user.full_name.concat(" - Gerente");
          $('<option>').val('').text('Seleccionar...').appendTo($departmentId);
          $userId.append(new Option(users, departments[0].branch.user.id));
          for (i = 0, len = departments.length; i < len; i++) {
            department = departments[i];
            $departmentId.append(new Option(department.name, department.id));
          }
          if (departmentId !== null) {
            $('#item_department_id option[value="' + select_val + '"]').attr("selected", true);
            setDepartmentCode(departmentId, true);
            $('#item_user_id option[value="' + $userIdHid.val() + '"]').attr("selected", true);
          }
        }
      });
    } else {
      $departmentId.html('');
    }
  };

  changeDepartmentsSelect = function(data, departmentIdIn) {
    if (data !== null) {
      $.ajax({
        method: 'GET',
        url: '/branches/departments/',
        data: {
          branch_ids: data
        },
        success: function(result) {
          var branch, department, i, id, j, len, len1, name, optgroup, option, ref;
          $('#q_department_id_in').html('');
          for (i = 0, len = result.length; i < len; i++) {
            branch = result[i];
            id = branch.id;
            name = branch.name;
            optgroup = $('<optgroup>');
            optgroup.attr('label', branch.name);
            ref = branch.departments;
            for (j = 0, len1 = ref.length; j < len1; j++) {
              department = ref[j];
              option = $('<option></option>');
              option.val(department.id);
              option.text(department.name);
              optgroup.append(option);
            }
            $('#q_department_id_in').append(optgroup);
          }
          if (departmentIdIn !== null) {
            $('#q_department_id_in').val(departmentIdIn);
            $(".select2").select2({
              theme: "classic"
            });
            return;
          }
        }
      });
    } else {
      $('#q_department_id_in').html('');
    }
  };

  changeSubCategoriesSelect = function(data, subCategoryIdIn) {
    var $subCategoryId;
    $subCategoryId = $('#item_sub_category_id');
    if (data !== null) {
      $.ajax({
        method: 'GET',
        url: '/categories/sub_categories/',
        data: {
          category_ids: data
        },
        success: function(result) {
          var i, len, ref, sub_category;
          $subCategoryId.prop('disabled', false);
          $subCategoryId.html('');
          ref = result.sub_categories;
          for (i = 0, len = ref.length; i < len; i++) {
            sub_category = ref[i];
            $subCategoryId.append(new Option(sub_category.name, sub_category.id));
          }
          if (subCategoryIdIn !== null) {
            $subCategoryId.val(subCategoryIdIn);
            return;
          }
        }
      });
    } else {
      $subCategoryId.html('');
    }
  };

}).call(this);

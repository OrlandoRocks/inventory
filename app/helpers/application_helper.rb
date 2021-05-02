module ApplicationHelper
  def bootstrap_flash_class(flash_type)
    {success: 'alert-success',
     error: 'alert-danger',
     alert: 'alert-warning',
     notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def page_title
    @title || controller_name.gsub(/Controller/, "").humanize
  end

  def has_policy(record, actions, devise_controller = nil)
    return true if current_user.god?

    if record.is_a? String and record.split('::').size > 1
      klass = ActiveSupport::Inflector.deconstantize(record).classify.constantize
      policy = policy(klass)
    else
      record = record.classify.constantize if record.is_a? String
      policy = policy(record)
    end

    actions.each { |query| return true if policy.send('general_policy', record, query, devise_controller) }
    false
  end

  def has_policy_catalogo()
    return true if (current_user.god? or current_user.admin?)
  end

  def has_policy_roles()
    return true if (current_user.god? or current_user.admin?)
  end

  def has_policy_branch()
    return true if (current_user.admin_branch?)
  end

  def has_policy_employee()
    return true if (current_user.user_employee?)
  end

  def collection_scope(user, scope)
    policy_name = (scope.to_s + 'Policy').classify.constantize
    policy_name::ScopeActions.new(user, scope).collection_scope
  end

  def current_translations
    @translator = I18n.backend
    @translator.load_translations
    @translations = @translator.send(:translations)[I18n.locale][:messages]
  end

  def custom_paginator(resource, params = nil)
    if params
      will_paginate resource, renderer: BootstrapPagination::Rails,
                    next_label: '<i class="fa fa-chevron-right"></i>'.html_safe,
                    previous_label: '<i class="fa fa-chevron-left"></i>'.html_safe,
                    params: params

    else
      will_paginate resource, renderer: BootstrapPagination::Rails,
                    next_label: '<i class="fa fa-chevron-right"></i>'.html_safe,
                    previous_label: '<i class="fa fa-chevron-left"></i>'.html_safe
    end

  end

  def selected_company
    if current_user.current_company.nil?
      'SIN EMPRESA'
    elsif current_user.current_company.equal?(0)
      'TODAS LAS EMPRESAS'
    else
      #@current_company = Company.find(current_user.current_company)
      #@current_company.name.upcase
      t("activerecord.attributes.user.current_companies.#{current_user.current_company}")
    end
  end

  def selected_company_id
    if current_user.current_company.nil?
      nil
    elsif current_user.current_company.equal?(0)
      0
    else
      current_user.current_company
    end
  end

  def search_company_user user
    if user.try(:companies).present?
      Company.where(user_id: user.id).first.try(:name)
    elsif user.try(:company).present?
      user.try(:company).try(:name)
    elsif user.role.key.eql? ('admin_sucursal')
      user.try(:branches).try(:first).try(:company).try(:name)
    end

  end

  def search_branch_user user
    if user.role.key.eql? ('empleado_sin_acceso')
      user.try(:department).try(:branch).try(:name)
    elsif user.role.key.eql? ('admin_sucursal')
      user.try(:branches).try(:first).try(:name)
    end
  end

  def search_department_user user
    if user.try(:departments).present?
      user.departments.last.name
    elsif user.try(:department).present?
      user.department.name
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = sort_column ? "#{sort_direction}" : "current"
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => 'link-to-text-color'}
  end

  def sortable_quotation(column, title = nil)
    title ||= column.titleize
    # css_class = sort_column_quotation ? "#{sort_direction}" : "current"
    direction = column == sort_column_quotation && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => 'link-to-text-color'}
  end

  def sortable_orders(column, title = nil)
    title ||= column.titleize
    css_class = sort_column_orders ? "#{sort_direction}" : "current"
    direction = column == sort_column_orders && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => 'link-to-text-color'}
  end

  def company_title
    return t('activerecord.attributes.user.current_companies.planet') if cookies[:company].nil?
    (current_user.remolques_current_company? or cookies[:company].eql?('remolques')) ? t('activerecord.attributes.user.current_companies.remolques') : t('activerecord.attributes.user.current_companies.planet')
  end

  def logo_for_company
    current_user.remolques_current_company? ? 'logo_remolques_norte.png' : 'logo1.png'
  end
end

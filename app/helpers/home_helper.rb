module HomeHelper



  def sort_link(column, title = nil )
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    icon = sort_direction == "asc" ? "fa fa-sort-asc" : "fa fa-sort-desc"
    icon = column == sort_column ? icon : ""
    link_to "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction}
  end


  def search_branch item
    if item.try(:user).try(:departments).present?
      item.user.departments.last.branch.name
    elsif item.try(:user).try(:department).present?
      item.user.branch.name
    else
      item.try(:user).try(:branches).try(:last).try(:name)
    end
  end

  def search_department item
    if item.try(:user).try(:departments).present?
      item.user.departments.last.name
    elsif item.try(:user).try(:department).present?
      item.user.department.name
    end
  end

end

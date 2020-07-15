module ItemsHelper
  #
  # def sort_link(column, title = nil,q )
  #   title ||= column.titleize
  #   direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  #   icon = sort_direction == "asc" ? "fa fa-sort-asc" : "fa fa-sort-desc"
  #   icon = column == sort_column ? icon : ""
  #   link_to "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction, q: q}
  # end


  def distance_of_time_custom(today, maintenance_date)
    if Date.today == maintenance_date
      'Hoy'
    elsif Date.today > maintenance_date
      "- #{distance_of_time_in_words(maintenance_date, Date.today)}"
    else
      distance_of_time_in_words(maintenance_date, Date.today)
    end
  end

  def next_maintenance(item)
    if item.time_quantity_service.nil? or item.time_quantity_service == 0
      t('helpers.not_apply')
    else
      l(item.maintenance_date, format: :long)
    end
  end
end

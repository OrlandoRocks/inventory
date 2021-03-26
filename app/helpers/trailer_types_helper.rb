module TrailerTypesHelper

  def get_title(key)
    case key
    when 'trailer_length_id'
      "Longitud"
    when 'trailer_width_id'
      "Anchura"
    when 'ramp_type_id'
      "Tipo de Rampa "
    when 'redila_type_id'
      "Tipo de Redila "
    when 'trailer_type_id'
      "Tipo de Trailer "
    when 'floor_type_id'
      "Tipo de Piso "
    when 'capacity_id'
      "Capacidad"
    when 'color_id'
      "Color"
    when 'hydraulic_jack_id'
      "Gato Hidraulico"
    when 'pull_type_id'
      "Tipo de Jalon "
    when 'brake_type_id'
      "Tipo de Freno "
    when 'reinforcement_type_id'
      "Tipo de Refuerzo "
    when 'fender_type_id'
      "Tipo de Fender "
    when 'turn_type_id'
      "Tipo de Volteo "
    when 'divition_type_id'
      "Tipo de Division "
    when 'suspension_type_id'
      "Tipo de Suspencion "
    when 'roof_type_id'
      "Tipo de Techo "
    when 'brand_id'
      "Marca"
    else
      ''
    end
  end


  def get_description(category)
    case category.key
    when 'trailer_length_id'
      category.trailer_length.name
    when 'trailer_width_id'
      category.trailer_width.name
    when 'ramp_type_id'
      category.ramp_type.name
    when 'redila_type_id'
      category.redila_type.name
    when 'trailer_type_id'
      category.trailer_type.name
    when 'floor_type_id'
      category.floor_type.name
    when 'capacity_id'
      category.capacity.name
    when 'color_id'
      category.color.name
    when 'hydraulic_jack_id'
      category.hydraulic_jack.name
    when 'pull_type_id'
      category.pull_type.name
    when 'brake_type_id'
      category.brake_type.name
    when 'reinforcement_type_id'
      category.reinforcement_type.name
    when 'fender_type_id'
      category.fender_type.name
    when 'turn_type_id'
      category.turn_type.name
    when 'divition_type_id'
      category.divition_type.name
    when 'suspension_type_id'
      category.suspension_type.name
    when 'roof_type_id'
      category.roof_type.name
    when 'brand_id'
      category.brand.name
    else
      ''
    end
  end



end

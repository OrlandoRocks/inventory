json.extract! trailer, :id, :name, :model, :status , :trailer_length,
              :trailer_height, :ramp_type, :redila_type, :floor_type, :capacity,
              :trailer_width, :brake_type, :color, :divition_type, :fender_type, :hydraulic_jack,
              :pull_type, :reinforcement_type, :roof_type, :suspension_type, :turn_type,:created_at, :updated_at

json.trailer_type trailer.trailer_type.as_json(except: :image) if trailer.trailer_type

json.url trailer_url(trailer, format: :json)

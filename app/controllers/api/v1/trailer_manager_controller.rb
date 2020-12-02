class Api::V1::TrailerManagerController < ActionController::Base

  protect_from_forgery with: :null_session


  def create_trailer
    begin

      trailer_params = Hash.new

      trailer_params[:name]  =   params[:name]           if params[:name]
      trailer_params[:model]  =   params[:model]           if params[:model]
      trailer_params[:status]  =   params[:status]           if params[:status]
      trailer_params[:brand]                     =    params[:brand]                      if params[:brand]
      trailer_params[:trailer_length_id]         =    params[:trailer_length_id]          if params[:trailer_length_id]
      trailer_params[:trailer_height_id]         =    params[:trailer_height_id]          if params[:trailer_height_id]
      trailer_params[:ramp_type_id]              =    params[:ramp_type_id]               if params[:ramp_type_id]
      trailer_params[:redila_type_id]            =    params[:redila_type_id]             if params[:redila_type_id]
      trailer_params[:trailer_type_id]           =    params[:trailer_type_id]            if params[:trailer_type_id]
      trailer_params[:floor_type_id]             =    params[:floor_type_id]              if params[:floor_type_id]
      trailer_params[:capacity_id]               =    params[:capacity_id]                if params[:capacity_id]
      trailer_params[:trailer_width_id]          =    params[:trailer_width_id]           if params[:trailer_width_id]
      trailer_params[:color_id]                  =    params[:color_id]                   if params[:color_id]
      trailer_params[:hydraulic_jack_id]         =    params[:hydraulic_jack_id]          if params[:hydraulic_jack_id]
      trailer_params[:pull_type_id]              =    params[:pull_type_id]               if params[:pull_type_id]
      trailer_params[:brake_type_id]             =    params[:brake_type_id]              if params[:brake_type_id]
      trailer_params[:reinforcement_type_id]     =    params[:reinforcement_type_id]      if params[:reinforcement_type_id]
      trailer_params[:fender_type_id]            =    params[:fender_type_id]             if params[:fender_type_id]
      trailer_params[:turn_type_id]              =    params[:turn_type_id]               if params[:turn_type_id]
      trailer_params[:divition_type_id]          =    params[:divition_type_id]           if params[:divition_type_id]
      trailer_params[:suspension_type_id]        =    params[:suspension_type_id]         if params[:suspension_type_id]
      trailer_params[:roof_type_id]              =    params[:roof_type_id]               if params[:roof_type_id]


      @new_trailer= Trailer.new(trailer_params)
      @new_trailer.image.attach(io: image_io, filename: 'comprobante de pago')     if params[:image]

      p 'new trailer'
      p @new_trailer

      if @new_trailer.save
        p 'se salvo'
        render json: {status:200, success: true, message:'se creo el Trailer correctamente en el Catalogo!'}
      else
        p 'algo valio shit'
        render json: {status:400, success: false, error:@new_trailer.errors.as_json}

      end

    rescue => error
      p 'error--------'
      p error
    end


  end

  def update_trailer
    begin

      trailer = Trailer.find(params[:id])

      trailer_params = Hash.new

      trailer_params[:name]  =   params[:name]           if params[:name]
      trailer_params[:model]  =   params[:model]           if params[:model]
      trailer_params[:status]  =   params[:status]           if params[:status]
      trailer_params[:brand]                     =    params[:brand]                      if params[:brand]
      trailer_params[:trailer_length_id]         =    params[:trailer_length_id]          if params[:trailer_length_id]
      trailer_params[:trailer_height_id]         =    params[:trailer_height_id]          if params[:trailer_height_id]
      trailer_params[:ramp_type_id]              =    params[:ramp_type_id]               if params[:ramp_type_id]
      trailer_params[:redila_type_id]            =    params[:redila_type_id]             if params[:redila_type_id]
      trailer_params[:trailer_type_id]           =    params[:trailer_type_id]            if params[:trailer_type_id]
      trailer_params[:floor_type_id]             =    params[:floor_type_id]              if params[:floor_type_id]
      trailer_params[:capacity_id]               =    params[:capacity_id]                if params[:capacity_id]
      trailer_params[:trailer_width_id]          =    params[:trailer_width_id]           if params[:trailer_width_id]
      trailer_params[:color_id]                  =    params[:color_id]                   if params[:color_id]
      trailer_params[:hydraulic_jack_id]         =    params[:hydraulic_jack_id]          if params[:hydraulic_jack_id]
      trailer_params[:pull_type_id]              =    params[:pull_type_id]               if params[:pull_type_id]
      trailer_params[:brake_type_id]             =    params[:brake_type_id]              if params[:brake_type_id]
      trailer_params[:reinforcement_type_id]     =    params[:reinforcement_type_id]      if params[:reinforcement_type_id]
      trailer_params[:fender_type_id]            =    params[:fender_type_id]             if params[:fender_type_id]
      trailer_params[:turn_type_id]              =    params[:turn_type_id]               if params[:turn_type_id]
      trailer_params[:divition_type_id]          =    params[:divition_type_id]           if params[:divition_type_id]
      trailer_params[:suspension_type_id]        =    params[:suspension_type_id]         if params[:suspension_type_id]
      trailer_params[:roof_type_id]              =    params[:roof_type_id]               if params[:roof_type_id]


      trailer.image.attach(io: image_io, filename: 'Comprobante de Pago') if params[:image]

      # trailer_params[:image]               =    params[:image] if params[:image]
      # trailer_params[:image]               =    image_io(trailer_params[:image]) if trailer_params[:image]



      if trailer.update(trailer_params)

        p 'se actualizo!'
        render json: {status:200, success: true, message:'se actualizo el Trailer correctamente en el Catalogo!'}
      else
        p 'algo valio shit'
        render json: {status:400, success: false, error:item.errors.as_json}

      end

    rescue => error
      p 'error--------'
      p error
    end


  end


  def destroy_trailer
    trailer = Trailer.find(params[:id])
    trailer.destroy
    render json: {status:200, success: true, message:'se elimino el Trailer correctamente en el Catalogo!'}

  end


  private

  def image_io

    decoded_image = Base64.decode64(params[:image])


    StringIO.new(decoded_image)
  end



end

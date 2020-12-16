
class Api::V1::ClientManagerController < ActionController::Base

  protect_from_forgery with: :null_session


  def create_client
    begin

      client_params = Hash.new



      client_params[:name]         =    params[:name]        if params[:name]
      client_params[:last_name]    =    params[:last_name]             if params[:last_name]
      client_params[:maiden_name]  =    params[:maiden_name]               if params[:maiden_name]
      client_params[:address]      =    params[:address]           if params[:address]
      client_params[:postal_code]  =    params[:postal_code]               if params[:postal_code]
      client_params[:email]        =    params[:email]         if params[:email]
      client_params[:phone_number] =    params[:phone_number]                if params[:phone_number]
      client_params[:cellphone]    =    params[:cellphone]             if params[:cellphone]
      client_params[:contact]      =    params[:contact]           if params[:contact]
      client_params[:created_at]   =    params[:created_at]              if params[:created_at]
      client_params[:updated_at]   =    params[:updated_at]              if params[:updated_at]
      client_params[:rfc]          =    params[:rfc]       if params[:rfc]
      client_params[:suburb]       =    params[:suburb]          if params[:suburb]
      client_params[:state_id]     =    params[:state_id]            if params[:state_id]
      client_params[:city_id]      =    params[:city_id]           if params[:city_id]
      client_params[:company]      =    params[:company]           if params[:company]
      

      @new_client= Client.new(client_params)

      p 'new client'
      p @new_client

      if @new_client.save
        p 'se salvo'
        render json: {status:200, success: true, message:'se creo el cliente correctamente en el Catalogo!'}
      else
        p 'algo valio shit'
        render json: {status:400, success: false, error:@new_client.errors.as_json}

      end

    rescue => error
      p 'error--------'
      p error
    end


  end

  def update_client
    begin

      client = Client.find(params[:id])

      client_params = Hash.new



      client_params[:name]         =    params[:name]        if params[:name]
      client_params[:last_name]    =    params[:last_name]             if params[:last_name]
      client_params[:maiden_name]  =    params[:maiden_name]               if params[:maiden_name]
      client_params[:address]      =    params[:address]           if params[:address]
      client_params[:postal_code]  =    params[:postal_code]               if params[:postal_code]
      client_params[:email]        =    params[:email]         if params[:email]
      client_params[:phone_number] =    params[:phone_number]                if params[:phone_number]
      client_params[:cellphone]    =    params[:cellphone]             if params[:cellphone]
      client_params[:contact]      =    params[:contact]           if params[:contact]
      client_params[:created_at]   =    params[:created_at]              if params[:created_at]
      client_params[:updated_at]   =    params[:updated_at]              if params[:updated_at]
      client_params[:rfc]          =    params[:rfc]       if params[:rfc]
      client_params[:suburb]       =    params[:suburb]          if params[:suburb]
      client_params[:state_id]     =    params[:state_id]            if params[:state_id]
      client_params[:city_id]      =    params[:city_id]           if params[:city_id]
      client_params[:company]      =    params[:company]           if params[:company]



      if client.update(client_params)

        p 'se actualizo!'
        render json: {status:200, success: true, message:'se actualizo el Cliente correctamente en el Catalogo!'}
      else
        p 'algo valio shit'
        render json: {status:400, success: false, error:item.errors.as_json}

      end

    rescue => error
      p 'error--------'
      p error
    end


  end


  def destroy_client
    client = Client.find(params[:id])
    client.destroy
    render json: {status:200, success: true, message:'se elimino el cliente correctamente en el Catalogo!'}

  end




end

class Api::V1::InventoryManagerController < ActionController::Base

  protect_from_forgery with: :null_session


  def get_clients
    render json: Client.all
  end


  def get_fiscal_vouchers
    render json: FiscalVoucher.all
  end



  def get_cities
    render json: City.all
  end


  def get_states
    render json: State.all
  end




  def get_branches
    @branches = Branch.all
    render json: @branches
  end


  def get_trailers
    render json: Trailer.all
  end


  def get_status_item
    render json: StatusItem.all
  end


  def get_categories
    render json: {trailers: TrailerType.all.as_json(except: :image), widths: TrailerWidth.all, lengths: TrailerLength.all, floors: FloorType.all, ramps: RampType.all,
                  capacities: Capacity.all, redilas: RedilaType.all, roofs:RoofType.all, turns:TurnType.all, brakes: BrakeType.all, colors:Color.all,
                  divitios:DivitionType.all, fenders: FenderType.all, hydraulic_jacks: HydraulicJack.all, pulls: PullType.all, brands: Brand.all,
                  suspensions:SuspensionType.all}
  end


  def get_sub_categories
    render json: SubCategory.all
  end


  def get_status_shipping
    render json: StatusShipping.all
  end

  def get_trailer_types
    render json: TrailerType.all
  end

  def get_items
    @items = Item.all
    render json: @items
  end

  def get_items_not_sell
    @user = User.find(params[:user_id])
    if @user.god? or @user.admin?
      @items = Item.where(status_item_id: StatusItem.find_by_key('no_vendido'))
    else
      @items = Item.where(status_item_id: StatusItem.find_by_key('no_vendido'), department_id: @user.department_id)
    end

    render json: @items



  end

  def get_items_sell

    @user = User.find(params[:user_id])
    if @user.god? or @user.admin?

      @items = Item.where(status_item_id: StatusItem.where(key:['vendido', 'pendiente_factura', 'facturado']).pluck(:id))
    else
      @items = Item.where(status_item_id: StatusItem.where(key:['vendido', 'pendiente_factura', 'facturado']).pluck(:id), department_id: @user.department_id)
    end

    render json: @items


  end

  def get_items_order
    @user = User.find(params[:user_id])
    if @user.god? or @user.admin?
      @items = Item.where(status_item_id: StatusItem.find_by_key('pendiente'))
    else
      @items = Item.where(status_item_id: StatusItem.find_by_key('pendiente'), department_id: @user.department_id)
    end

    render json: @items
  end


  def get_orders_shipped

    @user = User.find(params[:user_id])
    if @user.god? or @user.admin?
      @items = Item.where(status_shipping_id: StatusShipping.find_by_key('enviado').try(:id))
    else
      @items = Item.where(status_shipping_id: StatusShipping.find_by_key('enviado').try(:id), department_id: @user.department_id)
    end

    @items = Item.where(status_shipping_id: StatusShipping.find_by_key('enviado').try(:id))
    render json: @items
  end


  def get_items_by_branch

    items = Branch.find(params[:id]).items
    render json: items.as_json.as_json(except: :image)
  end


  def create_item
    begin



      item_params = Hash.new

      item_params[:serial_number]       =    params[:serial_number]       if params[:serial_number]
      item_params[:acquisition_date]    =    params[:acquisition_date]    if params[:acquisition_date]
      item_params[:purchased_date]      =    params[:purchased_date]      if params[:purchased_date]
      item_params[:in_service_date]     =    params[:in_service_date]     if params[:in_service_date]
      item_params[:price]               =    params[:price]               if params[:price]
      item_params[:department_id]       =    params[:department_id]       if params[:department_id]
      item_params[:status_item_id]      =    params[:status_item_id]      if params[:status_item_id]
      item_params[:status_shipping_id]  =    params[:client_id] ? StatusShipping.find_by_key('pedido').try(:id) : params[:department_id] == 1 ? StatusShipping.find_by_key('recibido').try(:id) :  StatusShipping.find_by_key('enviado').try(:id)
      item_params[:sale_price]          =    params[:sale_price]          if params[:sale_price]
      item_params[:remission]           =    params[:remission]           if params[:remission]
      item_params[:accessory]           =    params[:accessory]           if params[:accessory]
      item_params[:trailer_id]          =    params[:trailer_id]          if params[:trailer_id]
      item_params[:description]         =    params[:description]         if params[:description]
      item_params[:price]               =    params[:price]               if params[:price]
      item_params[:user_id]             =    params[:user_id]             if params[:user_id]
      item_params[:code]                =    params[:code]                if params[:code]
      item_params[:model]               =    params[:model]               if params[:model]
      item_params[:payment_type]        =    params[:payment_type]        if params[:payment_type]
      item_params[:fiscal_voucher_id]   =    params[:fiscal_voucher_id]   if params[:fiscal_voucher_id]
      item_params[:client_id]           =    params[:client_id]           if params[:client_id]
      item_params[:advance_payment]     =    params[:advance_payment]     if params[:advance_payment]
      item_params[:brand]                     =    params[:brand]                      if params[:brand]
      item_params[:trailer_length_id]         =    params[:trailer_length_id]          if params[:trailer_length_id]
      item_params[:trailer_height_id]         =    params[:trailer_height_id]          if params[:trailer_height_id]
      item_params[:ramp_type_id]              =    params[:ramp_type_id]               if params[:ramp_type_id]
      item_params[:redila_type_id]            =    params[:redila_type_id]             if params[:redila_type_id]
      item_params[:trailer_type_id]           =    params[:trailer_type_id]            if params[:trailer_type_id]
      item_params[:floor_type_id]             =    params[:floor_type_id]              if params[:floor_type_id]
      item_params[:capacity_id]               =    params[:capacity_id]                if params[:capacity_id]
      item_params[:trailer_width_id]          =    params[:trailer_width_id]           if params[:trailer_width_id]
      item_params[:color_id]                  =    params[:color_id]                   if params[:color_id]
      item_params[:hydraulic_jack_id]         =    params[:hydraulic_jack_id]          if params[:hydraulic_jack_id]
      item_params[:pull_type_id]              =    params[:pull_type_id]               if params[:pull_type_id]
      item_params[:brake_type_id]             =    params[:brake_type_id]              if params[:brake_type_id]
      item_params[:reinforcement_type_id]     =    params[:reinforcement_type_id]      if params[:reinforcement_type_id]
      item_params[:fender_type_id]            =    params[:fender_type_id]             if params[:fender_type_id]
      item_params[:turn_type_id]              =    params[:turn_type_id]               if params[:turn_type_id]
      item_params[:divition_type_id]          =    params[:divition_type_id]           if params[:divition_type_id]
      item_params[:suspension_type_id]        =    params[:suspension_type_id]         if params[:suspension_type_id]
      item_params[:roof_type_id]              =    params[:roof_type_id]               if params[:roof_type_id]
      item_params[:categories_description]    =    params[:categories_description]     if params[:categories_description]
      item_params[:seller_percentage]    =    params[:seller_percentage]     if params[:seller_percentage]
      item_params[:planet_percentage]    =    params[:planet_percentage]     if params[:planet_percentage]
      item_params[:branch_percentage]    =    params[:branch_percentage]     if params[:branch_percentage]




      @new_item = Item.new(item_params)
      @new_item.image.attach(io: image_io, filename: 'comprobante de pago')     if params[:image]

      p 'new item'
      p @new_item

      if @new_item.save
        p 'se salvo'
        render json: {status:200, success: true, message:'se creo el Articulo correctamente!'}
      else
        p 'algo valio shit'
        render json: {status:400, success: false, error:@new_item.errors.as_json}

      end

    rescue => error
      p 'error--------'
      p error
    end


  end

  def update_item
    begin

      item = Item.find(params[:id])

      # status_item_id          =    StatusItem.find_by_key('no_vendido').try(:id)  #params[:status_item_id]
      # status_shipping_id      =    params[:department_id] == 1 ? StatusShipping.find_by_key('recibido').try(:id) :  StatusShipping.find_by_key('enviado').try(:id)  # params[:status_shipping_id]




      item_params = Hash.new

      item_params[:serial_number]       =    params[:serial_number]       if params[:serial_number]
      item_params[:acquisition_date]    =    params[:acquisition_date]    if params[:acquisition_date]
      item_params[:purchased_date]      =    params[:purchased_date]      if params[:purchased_date]
      item_params[:in_service_date]     =    params[:in_service_date]     if params[:in_service_date]
      item_params[:price]               =    params[:price]               if params[:price]
      item_params[:department_id]       =    params[:department_id]       if params[:department_id]
      item_params[:status_item_id]      =    params[:status_item_id]      if params[:status_item_id]
      item_params[:status_shipping_id]  =    params[:department_id] == 1 ? StatusShipping.find_by_key('recibido').try(:id) :  StatusShipping.find_by_key('enviado').try(:id)
      item_params[:sale_price]          =    params[:sale_price]          if params[:sale_price]
      item_params[:remission]           =    params[:remission]           if params[:remission]
      item_params[:accessory]           =    params[:accessory]           if params[:accessory]
      item_params[:trailer_id]          =    params[:trailer_id]          if params[:trailer_id]
      item_params[:description]         =    params[:description]         if params[:description]
      item_params[:price]               =    params[:price]               if params[:price]
      item_params[:user_id]             =    params[:user_id]             if params[:user_id]
      item_params[:code]                =    params[:code]                if params[:code]
      item_params[:model]               =    params[:model]               if params[:model]
      item_params[:payment_type]        =    params[:payment_type]        if params[:payment_type]
      item_params[:fiscal_voucher_id]   =    params[:fiscal_voucher_id]   if params[:fiscal_voucher_id]
      item_params[:client_id]           =    params[:client_id]           if params[:client_id]
      item_params[:advance_payment]     =    params[:advance_payment]     if params[:advance_payment]
      item_params[:brand]                     =    params[:brand]                      if params[:brand]
      item_params[:trailer_length_id]         =    params[:trailer_length_id]          if params[:trailer_length_id]
      item_params[:trailer_height_id]         =    params[:trailer_height_id]          if params[:trailer_height_id]
      item_params[:ramp_type_id]              =    params[:ramp_type_id]               if params[:ramp_type_id]
      item_params[:redila_type_id]            =    params[:redila_type_id]             if params[:redila_type_id]
      item_params[:trailer_type_id]           =    params[:trailer_type_id]            if params[:trailer_type_id]
      item_params[:floor_type_id]             =    params[:floor_type_id]              if params[:floor_type_id]
      item_params[:capacity_id]               =    params[:capacity_id]                if params[:capacity_id]
      item_params[:trailer_width_id]          =    params[:trailer_width_id]           if params[:trailer_width_id]
      item_params[:color_id]                  =    params[:color_id]                   if params[:color_id]
      item_params[:hydraulic_jack_id]         =    params[:hydraulic_jack_id]          if params[:hydraulic_jack_id]
      item_params[:pull_type_id]              =    params[:pull_type_id]               if params[:pull_type_id]
      item_params[:brake_type_id]             =    params[:brake_type_id]              if params[:brake_type_id]
      item_params[:reinforcement_type_id]     =    params[:reinforcement_type_id]      if params[:reinforcement_type_id]
      item_params[:fender_type_id]            =    params[:fender_type_id]             if params[:fender_type_id]
      item_params[:turn_type_id]              =    params[:turn_type_id]               if params[:turn_type_id]
      item_params[:divition_type_id]          =    params[:divition_type_id]           if params[:divition_type_id]
      item_params[:suspension_type_id]        =    params[:suspension_type_id]         if params[:suspension_type_id]
      item_params[:roof_type_id]              =    params[:roof_type_id]               if params[:roof_type_id]
      item_params[:categories_description]    =    params[:categories_description]     if params[:categories_description]
      item_params[:seller_percentage]    =    params[:seller_percentage]     if params[:seller_percentage]
      item_params[:planet_percentage]    =    params[:planet_percentage]     if params[:planet_percentage]
      item_params[:branch_percentage]    =    params[:branch_percentage]     if params[:branch_percentage]

      item.image.attach(io: image_io, filename: 'Comprobante de Pago') if params[:image]

      # item_params[:image]               =    params[:image] if params[:image]
      # item_params[:image]               =    image_io(item_params[:image]) if item_params[:image]

      item_selled = params[:status_item_id] == item.status_item_id

      if item.update(item_params)

        if params[:status_item_id]
          if item_selled
            Item.fcm_push_notification('REMOLQUE VENDIDO',item.user.full_name,User.first.try(:token))
          end
        end

        p 'se actualizo!'
        render json: {status:200, success: true, message:'se actualizo el Articulo correctamente!', item: Item.find(params[:id]).as_json}
      else
        p 'algo valio shit'
        render json: {status:400, success: false, error:item.errors.as_json}

      end

    rescue => error
      p 'error--------'
      p error
    end


  end


  def destroy_item
    item = Item.find(params[:id])
    item.destroy
    render json: {status:200, success: true, message:'se elimino el Articulo correctamente!'}

  end


  private

  def image_io

    decoded_image = Base64.decode64(params[:image])


    StringIO.new(decoded_image)
  end

  def image_name
    params[:post][:file_name]
  end


end


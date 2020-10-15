class Api::V1::InventoryManagerController < ActionController::Base

  protect_from_forgery with: :null_session


  def get_clients
    render json: Client.all
  end
  def get_fiscal_vouchers
    render json: FiscalVoucher.all
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
    render json: Category.all
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
      item_params[:status_shipping_id]  =    params[:department_id] == 1 ? StatusShipping.find_by_key('recibido').try(:id) :  StatusShipping.find_by_key('enviado').try(:id)
      item_params[:sale_price]          =    params[:sale_price]          if params[:sale_price]
      item_params[:remission]           =    params[:remission]           if params[:remission]
      item_params[:accessory]           =    params[:accessory]           if params[:accessory]
      item_params[:trailer_id]          =    params[:trailer_id]          if params[:trailer_id]
      item_params[:description]         =    params[:description]         if params[:description]
      item_params[:price]               =    params[:price]               if params[:price]
      item_params[:user_id]             =    params[:user_id]             if params[:user_id]
      item_params[:code]                =    params[:code]                if params[:code]
      item_params[:payment_type]        =    params[:payment_type]        if params[:payment_type]
      item_params[:fiscal_voucher_id]   =    params[:fiscal_voucher_id]   if params[:fiscal_voucher_id]
      item_params[:client_id]           =    params[:client_id]           if params[:client_id]
      item_params[:advance_payment]     =    params[:advance_payment]     if params[:advance_payment]
      item_params[:image]               =    params[:image].attach(io: image_io, filename: 'comprobante de pago')     if params[:image]





      @new_item = Item.new(item_params)

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
      item_params[:status_shipping_id]  =    params[:status_shipping_id]  if params[:status_shipping_id]
      item_params[:sale_price]          =    params[:sale_price]          if params[:sale_price]
      item_params[:remission]           =    params[:remission]           if params[:remission]
      item_params[:accessory]           =    params[:accessory]           if params[:accessory]
      item_params[:trailer_id]          =    params[:trailer_id]          if params[:trailer_id]
      item_params[:description]         =    params[:description]         if params[:description]
      item_params[:price]               =    params[:price]               if params[:price]
      item_params[:user_id]             =    params[:user_id]             if params[:user_id]
      item_params[:code]                =    params[:code]                if params[:code]
      item_params[:payment_type]        =    params[:payment_type]        if params[:payment_type]
      item_params[:fiscal_voucher_id]   =    params[:fiscal_voucher_id]   if params[:fiscal_voucher_id]
      item_params[:client_id]           =    params[:client_id]           if params[:client_id]
      item_params[:advance_payment]     =    params[:advance_payment]     if params[:advance_payment]
      item_params[:image]               =    image_io if params[:image]
      # item_params[:image]               =    item_params[:image].attach(io: image_io, filename: 'comprobante de pago') if item_params[:image]





      if item.update(item_params)

        p 'se actualizo!'
        render json: {status:200, success: true, message:'se actualizo el Articulo correctamente!'}
      else
        p 'algo valio shit'
        render json: {status:400, success: false, error:item.errors.as_json}

      end

    rescue => error
      p 'error--------'
      p error
    end


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


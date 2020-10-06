module Api
  module V1
    class InventoryManagerController < ActionController::Base

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

      def get_items
        @items = Item.all
        render json: @items
      end

      def create_item
        begin

          serial_number    =         params[:serial_number]
          purchased_date    =        params[:purchased_date]
          in_service_date    =       params[:in_service_date]
          time_unit_service    =     params[:time_unit_service]
          time_quantity_service  =   params[:time_quantity_service]
          price    =                 params[:price]
          department_id    =         params[:department_id]
          status_item_id    =        params[:status_item_id]
          sale_price    =            params[:sale_price]
          remission    =             params[:remission]
          accessory    =             params[:accessory]
          acquisition_date    =      params[:acquisition_date]
          trailer_id    =            params[:trailer_id]

         @new_item = Item.new(
              serial_number:                 serial_number,
              purchased_date:                purchased_date,
              in_service_date:               in_service_date,
              time_unit_service:             time_unit_service,
              time_quantity_service:         time_quantity_service,
              price:                         price,
              department_id:                 department_id,
              status_item_id:                status_item_id,
              sale_price:                    sale_price,
              remission:                     remission,
              accessory:                     accessory,
              acquisition_date:              acquisition_date,
              trailer_id:                    trailer_id
           )

          if @new_item.save
            render json: {status:200, success: true, message:'se creo el Articulo correctamente!'}
          else
            render json: {status:200, success: false, error:@new_item.errors}

          end

        rescue => error
          p 'error--------'
          p error
        end


      end


    end
  end
end

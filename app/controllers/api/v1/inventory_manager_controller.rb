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


      p "params"
      p params


      end


    end
  end
end


module Api
  module V1
    class InventoryManagerController < ActionController::Base

      protect_from_forgery with: :null_session


      def get_items
        @items = Item.all
        render json: @items, except: :image
      end

    end
  end

end
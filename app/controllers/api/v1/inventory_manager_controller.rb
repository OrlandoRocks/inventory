module Api
  module V1
    class InventoryManagerController < ActionController::Base

      protect_from_forgery with: :null_session


      def get_items
        @items = Item.all
        @items.each do |e|
          e.branch_name = ''
          if e.direct_branch.present?
            e.branch = e.direct_branch.name
          elsif e.direct_branch
            e.branch = e.direct_branch.name
          end

          e.department_name = ''
          e.department.present? ? e.department = e.department.name : e.department = ''

          e.status_name = ''
          e.status_item.present? ? e.status = e.status_item.name  : e.status = ''
        end
        render json: @items
      end

    end
  end

end
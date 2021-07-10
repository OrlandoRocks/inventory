json.extract! spare_part_sold, :id, :client_id, :user_id, :spare_part_id, :quantity, :unit_sale_price, :payment_type, :fiscal_voucher_id, :advance_payment, :created_at, :updated_at
json.url spare_part_sold_url(spare_part_sold, format: :json)

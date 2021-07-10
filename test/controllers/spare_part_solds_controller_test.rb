require 'test_helper'

class SparePartSoldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spare_part_sold = spare_part_solds(:one)
  end

  test "should get index" do
    get spare_part_solds_url
    assert_response :success
  end

  test "should get new" do
    get new_spare_part_sold_url
    assert_response :success
  end

  test "should create spare_part_sold" do
    assert_difference('SparePartSold.count') do
      post spare_part_solds_url, params: { spare_part_sold: { advance_payment: @spare_part_sold.advance_payment, client_id: @spare_part_sold.client_id, fiscal_voucher_id: @spare_part_sold.fiscal_voucher_id, payment_type: @spare_part_sold.payment_type, quantity: @spare_part_sold.quantity, spare_part_id: @spare_part_sold.spare_part_id, unit_sale_price: @spare_part_sold.unit_sale_price, user_id: @spare_part_sold.user_id } }
    end

    assert_redirected_to spare_part_sold_url(SparePartSold.last)
  end

  test "should show spare_part_sold" do
    get spare_part_sold_url(@spare_part_sold)
    assert_response :success
  end

  test "should get edit" do
    get edit_spare_part_sold_url(@spare_part_sold)
    assert_response :success
  end

  test "should update spare_part_sold" do
    patch spare_part_sold_url(@spare_part_sold), params: { spare_part_sold: { advance_payment: @spare_part_sold.advance_payment, client_id: @spare_part_sold.client_id, fiscal_voucher_id: @spare_part_sold.fiscal_voucher_id, payment_type: @spare_part_sold.payment_type, quantity: @spare_part_sold.quantity, spare_part_id: @spare_part_sold.spare_part_id, unit_sale_price: @spare_part_sold.unit_sale_price, user_id: @spare_part_sold.user_id } }
    assert_redirected_to spare_part_sold_url(@spare_part_sold)
  end

  test "should destroy spare_part_sold" do
    assert_difference('SparePartSold.count', -1) do
      delete spare_part_sold_url(@spare_part_sold)
    end

    assert_redirected_to spare_part_solds_url
  end
end

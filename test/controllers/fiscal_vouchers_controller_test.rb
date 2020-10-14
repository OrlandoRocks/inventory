require 'test_helper'

class FiscalVouchersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fiscal_voucher = fiscal_vouchers(:one)
  end

  test "should get index" do
    get fiscal_vouchers_url
    assert_response :success
  end

  test "should get new" do
    get new_fiscal_voucher_url
    assert_response :success
  end

  test "should create fiscal_voucher" do
    assert_difference('FiscalVoucher.count') do
      post fiscal_vouchers_url, params: { fiscal_voucher: { name: @fiscal_voucher.name, status: @fiscal_voucher.status } }
    end

    assert_redirected_to fiscal_voucher_url(FiscalVoucher.last)
  end

  test "should show fiscal_voucher" do
    get fiscal_voucher_url(@fiscal_voucher)
    assert_response :success
  end

  test "should get edit" do
    get edit_fiscal_voucher_url(@fiscal_voucher)
    assert_response :success
  end

  test "should update fiscal_voucher" do
    patch fiscal_voucher_url(@fiscal_voucher), params: { fiscal_voucher: { name: @fiscal_voucher.name, status: @fiscal_voucher.status } }
    assert_redirected_to fiscal_voucher_url(@fiscal_voucher)
  end

  test "should destroy fiscal_voucher" do
    assert_difference('FiscalVoucher.count', -1) do
      delete fiscal_voucher_url(@fiscal_voucher)
    end

    assert_redirected_to fiscal_vouchers_url
  end
end

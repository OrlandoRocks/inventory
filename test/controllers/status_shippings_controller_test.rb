require 'test_helper'

class StatusShippingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_shipping = status_shippings(:one)
  end

  test "should get index" do
    get status_shippings_url
    assert_response :success
  end

  test "should get new" do
    get new_status_shipping_url
    assert_response :success
  end

  test "should create status_shipping" do
    assert_difference('StatusShipping.count') do
      post status_shippings_url, params: { status_shipping: {  } }
    end

    assert_redirected_to status_shipping_url(StatusShipping.last)
  end

  test "should show status_shipping" do
    get status_shipping_url(@status_shipping)
    assert_response :success
  end

  test "should get edit" do
    get edit_status_shipping_url(@status_shipping)
    assert_response :success
  end

  test "should update status_shipping" do
    patch status_shipping_url(@status_shipping), params: { status_shipping: {  } }
    assert_redirected_to status_shipping_url(@status_shipping)
  end

  test "should destroy status_shipping" do
    assert_difference('StatusShipping.count', -1) do
      delete status_shipping_url(@status_shipping)
    end

    assert_redirected_to status_shippings_url
  end
end

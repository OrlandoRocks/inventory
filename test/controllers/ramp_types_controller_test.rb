require 'test_helper'

class RampTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ramp_type = ramp_types(:one)
  end

  test "should get index" do
    get ramp_types_url
    assert_response :success
  end

  test "should get new" do
    get new_ramp_type_url
    assert_response :success
  end

  test "should create ramp_type" do
    assert_difference('RampType.count') do
      post ramp_types_url, params: { ramp_type: { model_part: @ramp_type.model_part, name: @ramp_type.name, status: @ramp_type.status } }
    end

    assert_redirected_to ramp_type_url(RampType.last)
  end

  test "should show ramp_type" do
    get ramp_type_url(@ramp_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_ramp_type_url(@ramp_type)
    assert_response :success
  end

  test "should update ramp_type" do
    patch ramp_type_url(@ramp_type), params: { ramp_type: { model_part: @ramp_type.model_part, name: @ramp_type.name, status: @ramp_type.status } }
    assert_redirected_to ramp_type_url(@ramp_type)
  end

  test "should destroy ramp_type" do
    assert_difference('RampType.count', -1) do
      delete ramp_type_url(@ramp_type)
    end

    assert_redirected_to ramp_types_url
  end
end

require 'test_helper'

class BrakeTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brake_type = brake_types(:one)
  end

  test "should get index" do
    get brake_types_url
    assert_response :success
  end

  test "should get new" do
    get new_brake_type_url
    assert_response :success
  end

  test "should create brake_type" do
    assert_difference('BrakeType.count') do
      post brake_types_url, params: { brake_type: { model_part: @brake_type.model_part, name: @brake_type.name, status: @brake_type.status } }
    end

    assert_redirected_to brake_type_url(BrakeType.last)
  end

  test "should show brake_type" do
    get brake_type_url(@brake_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_brake_type_url(@brake_type)
    assert_response :success
  end

  test "should update brake_type" do
    patch brake_type_url(@brake_type), params: { brake_type: { model_part: @brake_type.model_part, name: @brake_type.name, status: @brake_type.status } }
    assert_redirected_to brake_type_url(@brake_type)
  end

  test "should destroy brake_type" do
    assert_difference('BrakeType.count', -1) do
      delete brake_type_url(@brake_type)
    end

    assert_redirected_to brake_types_url
  end
end

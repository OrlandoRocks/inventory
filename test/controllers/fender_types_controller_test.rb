require 'test_helper'

class FenderTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fender_type = fender_types(:one)
  end

  test "should get index" do
    get fender_types_url
    assert_response :success
  end

  test "should get new" do
    get new_fender_type_url
    assert_response :success
  end

  test "should create fender_type" do
    assert_difference('FenderType.count') do
      post fender_types_url, params: { fender_type: { model_part: @fender_type.model_part, name: @fender_type.name, status: @fender_type.status } }
    end

    assert_redirected_to fender_type_url(FenderType.last)
  end

  test "should show fender_type" do
    get fender_type_url(@fender_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_fender_type_url(@fender_type)
    assert_response :success
  end

  test "should update fender_type" do
    patch fender_type_url(@fender_type), params: { fender_type: { model_part: @fender_type.model_part, name: @fender_type.name, status: @fender_type.status } }
    assert_redirected_to fender_type_url(@fender_type)
  end

  test "should destroy fender_type" do
    assert_difference('FenderType.count', -1) do
      delete fender_type_url(@fender_type)
    end

    assert_redirected_to fender_types_url
  end
end

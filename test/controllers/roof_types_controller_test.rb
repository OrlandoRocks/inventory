require 'test_helper'

class RoofTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @roof_type = roof_types(:one)
  end

  test "should get index" do
    get roof_types_url
    assert_response :success
  end

  test "should get new" do
    get new_roof_type_url
    assert_response :success
  end

  test "should create roof_type" do
    assert_difference('RoofType.count') do
      post roof_types_url, params: { roof_type: { model_part: @roof_type.model_part, name: @roof_type.name, status: @roof_type.status } }
    end

    assert_redirected_to roof_type_url(RoofType.last)
  end

  test "should show roof_type" do
    get roof_type_url(@roof_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_roof_type_url(@roof_type)
    assert_response :success
  end

  test "should update roof_type" do
    patch roof_type_url(@roof_type), params: { roof_type: { model_part: @roof_type.model_part, name: @roof_type.name, status: @roof_type.status } }
    assert_redirected_to roof_type_url(@roof_type)
  end

  test "should destroy roof_type" do
    assert_difference('RoofType.count', -1) do
      delete roof_type_url(@roof_type)
    end

    assert_redirected_to roof_types_url
  end
end

require 'test_helper'

class SuspensionTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @suspension_type = suspension_types(:one)
  end

  test "should get index" do
    get suspension_types_url
    assert_response :success
  end

  test "should get new" do
    get new_suspension_type_url
    assert_response :success
  end

  test "should create suspension_type" do
    assert_difference('SuspensionType.count') do
      post suspension_types_url, params: { suspension_type: { model_part: @suspension_type.model_part, name: @suspension_type.name, status: @suspension_type.status } }
    end

    assert_redirected_to suspension_type_url(SuspensionType.last)
  end

  test "should show suspension_type" do
    get suspension_type_url(@suspension_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_suspension_type_url(@suspension_type)
    assert_response :success
  end

  test "should update suspension_type" do
    patch suspension_type_url(@suspension_type), params: { suspension_type: { model_part: @suspension_type.model_part, name: @suspension_type.name, status: @suspension_type.status } }
    assert_redirected_to suspension_type_url(@suspension_type)
  end

  test "should destroy suspension_type" do
    assert_difference('SuspensionType.count', -1) do
      delete suspension_type_url(@suspension_type)
    end

    assert_redirected_to suspension_types_url
  end
end

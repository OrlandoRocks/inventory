require 'test_helper'

class DivitionTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @divition_type = divition_types(:one)
  end

  test "should get index" do
    get divition_types_url
    assert_response :success
  end

  test "should get new" do
    get new_divition_type_url
    assert_response :success
  end

  test "should create divition_type" do
    assert_difference('DivitionType.count') do
      post divition_types_url, params: { divition_type: { model_part: @divition_type.model_part, name: @divition_type.name, status: @divition_type.status } }
    end

    assert_redirected_to divition_type_url(DivitionType.last)
  end

  test "should show divition_type" do
    get divition_type_url(@divition_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_divition_type_url(@divition_type)
    assert_response :success
  end

  test "should update divition_type" do
    patch divition_type_url(@divition_type), params: { divition_type: { model_part: @divition_type.model_part, name: @divition_type.name, status: @divition_type.status } }
    assert_redirected_to divition_type_url(@divition_type)
  end

  test "should destroy divition_type" do
    assert_difference('DivitionType.count', -1) do
      delete divition_type_url(@divition_type)
    end

    assert_redirected_to divition_types_url
  end
end

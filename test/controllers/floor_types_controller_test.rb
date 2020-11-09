require 'test_helper'

class FloorTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @floor_type = floor_types(:one)
  end

  test "should get index" do
    get floor_types_url
    assert_response :success
  end

  test "should get new" do
    get new_floor_type_url
    assert_response :success
  end

  test "should create floor_type" do
    assert_difference('FloorType.count') do
      post floor_types_url, params: { floor_type: { model_part: @floor_type.model_part, name: @floor_type.name, status: @floor_type.status } }
    end

    assert_redirected_to floor_type_url(FloorType.last)
  end

  test "should show floor_type" do
    get floor_type_url(@floor_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_floor_type_url(@floor_type)
    assert_response :success
  end

  test "should update floor_type" do
    patch floor_type_url(@floor_type), params: { floor_type: { model_part: @floor_type.model_part, name: @floor_type.name, status: @floor_type.status } }
    assert_redirected_to floor_type_url(@floor_type)
  end

  test "should destroy floor_type" do
    assert_difference('FloorType.count', -1) do
      delete floor_type_url(@floor_type)
    end

    assert_redirected_to floor_types_url
  end
end

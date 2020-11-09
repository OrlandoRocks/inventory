require 'test_helper'

class TurnTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @turn_type = turn_types(:one)
  end

  test "should get index" do
    get turn_types_url
    assert_response :success
  end

  test "should get new" do
    get new_turn_type_url
    assert_response :success
  end

  test "should create turn_type" do
    assert_difference('TurnType.count') do
      post turn_types_url, params: { turn_type: { model_part: @turn_type.model_part, name: @turn_type.name, status: @turn_type.status } }
    end

    assert_redirected_to turn_type_url(TurnType.last)
  end

  test "should show turn_type" do
    get turn_type_url(@turn_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_turn_type_url(@turn_type)
    assert_response :success
  end

  test "should update turn_type" do
    patch turn_type_url(@turn_type), params: { turn_type: { model_part: @turn_type.model_part, name: @turn_type.name, status: @turn_type.status } }
    assert_redirected_to turn_type_url(@turn_type)
  end

  test "should destroy turn_type" do
    assert_difference('TurnType.count', -1) do
      delete turn_type_url(@turn_type)
    end

    assert_redirected_to turn_types_url
  end
end

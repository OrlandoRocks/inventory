require 'test_helper'

class ReinforcementTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reinforcement_type = reinforcement_types(:one)
  end

  test "should get index" do
    get reinforcement_types_url
    assert_response :success
  end

  test "should get new" do
    get new_reinforcement_type_url
    assert_response :success
  end

  test "should create reinforcement_type" do
    assert_difference('ReinforcementType.count') do
      post reinforcement_types_url, params: { reinforcement_type: { model_part: @reinforcement_type.model_part, name: @reinforcement_type.name, status: @reinforcement_type.status } }
    end

    assert_redirected_to reinforcement_type_url(ReinforcementType.last)
  end

  test "should show reinforcement_type" do
    get reinforcement_type_url(@reinforcement_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_reinforcement_type_url(@reinforcement_type)
    assert_response :success
  end

  test "should update reinforcement_type" do
    patch reinforcement_type_url(@reinforcement_type), params: { reinforcement_type: { model_part: @reinforcement_type.model_part, name: @reinforcement_type.name, status: @reinforcement_type.status } }
    assert_redirected_to reinforcement_type_url(@reinforcement_type)
  end

  test "should destroy reinforcement_type" do
    assert_difference('ReinforcementType.count', -1) do
      delete reinforcement_type_url(@reinforcement_type)
    end

    assert_redirected_to reinforcement_types_url
  end
end

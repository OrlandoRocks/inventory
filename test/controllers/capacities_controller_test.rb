require 'test_helper'

class CapacitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @capacity = capacities(:one)
  end

  test "should get index" do
    get capacities_url
    assert_response :success
  end

  test "should get new" do
    get new_capacity_url
    assert_response :success
  end

  test "should create capacity" do
    assert_difference('Capacity.count') do
      post capacities_url, params: { capacity: { model_part: @capacity.model_part, name: @capacity.name, status: @capacity.status } }
    end

    assert_redirected_to capacity_url(Capacity.last)
  end

  test "should show capacity" do
    get capacity_url(@capacity)
    assert_response :success
  end

  test "should get edit" do
    get edit_capacity_url(@capacity)
    assert_response :success
  end

  test "should update capacity" do
    patch capacity_url(@capacity), params: { capacity: { model_part: @capacity.model_part, name: @capacity.name, status: @capacity.status } }
    assert_redirected_to capacity_url(@capacity)
  end

  test "should destroy capacity" do
    assert_difference('Capacity.count', -1) do
      delete capacity_url(@capacity)
    end

    assert_redirected_to capacities_url
  end
end

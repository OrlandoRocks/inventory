require 'test_helper'

class TrailerHeightsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trailer_height = trailer_heights(:one)
  end

  test "should get index" do
    get trailer_heights_url
    assert_response :success
  end

  test "should get new" do
    get new_trailer_height_url
    assert_response :success
  end

  test "should create trailer_height" do
    assert_difference('TrailerHeight.count') do
      post trailer_heights_url, params: { trailer_height: { model_part: @trailer_height.model_part, name: @trailer_height.name, status: @trailer_height.status } }
    end

    assert_redirected_to trailer_height_url(TrailerHeight.last)
  end

  test "should show trailer_height" do
    get trailer_height_url(@trailer_height)
    assert_response :success
  end

  test "should get edit" do
    get edit_trailer_height_url(@trailer_height)
    assert_response :success
  end

  test "should update trailer_height" do
    patch trailer_height_url(@trailer_height), params: { trailer_height: { model_part: @trailer_height.model_part, name: @trailer_height.name, status: @trailer_height.status } }
    assert_redirected_to trailer_height_url(@trailer_height)
  end

  test "should destroy trailer_height" do
    assert_difference('TrailerHeight.count', -1) do
      delete trailer_height_url(@trailer_height)
    end

    assert_redirected_to trailer_heights_url
  end
end

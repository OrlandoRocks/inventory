require 'test_helper'

class TrailerWidthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trailer_width = trailer_widths(:one)
  end

  test "should get index" do
    get trailer_widths_url
    assert_response :success
  end

  test "should get new" do
    get new_trailer_width_url
    assert_response :success
  end

  test "should create trailer_width" do
    assert_difference('TrailerWidth.count') do
      post trailer_widths_url, params: { trailer_width: { model_part: @trailer_width.model_part, name: @trailer_width.name, status: @trailer_width.status } }
    end

    assert_redirected_to trailer_width_url(TrailerWidth.last)
  end

  test "should show trailer_width" do
    get trailer_width_url(@trailer_width)
    assert_response :success
  end

  test "should get edit" do
    get edit_trailer_width_url(@trailer_width)
    assert_response :success
  end

  test "should update trailer_width" do
    patch trailer_width_url(@trailer_width), params: { trailer_width: { model_part: @trailer_width.model_part, name: @trailer_width.name, status: @trailer_width.status } }
    assert_redirected_to trailer_width_url(@trailer_width)
  end

  test "should destroy trailer_width" do
    assert_difference('TrailerWidth.count', -1) do
      delete trailer_width_url(@trailer_width)
    end

    assert_redirected_to trailer_widths_url
  end
end

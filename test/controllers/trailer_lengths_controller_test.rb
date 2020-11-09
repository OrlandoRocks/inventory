require 'test_helper'

class TrailerLengthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trailer_length = trailer_lengths(:one)
  end

  test "should get index" do
    get trailer_lengths_url
    assert_response :success
  end

  test "should get new" do
    get new_trailer_length_url
    assert_response :success
  end

  test "should create trailer_length" do
    assert_difference('TrailerLength.count') do
      post trailer_lengths_url, params: { trailer_length: { model_part: @trailer_length.model_part, name: @trailer_length.name, status: @trailer_length.status } }
    end

    assert_redirected_to trailer_length_url(TrailerLength.last)
  end

  test "should show trailer_length" do
    get trailer_length_url(@trailer_length)
    assert_response :success
  end

  test "should get edit" do
    get edit_trailer_length_url(@trailer_length)
    assert_response :success
  end

  test "should update trailer_length" do
    patch trailer_length_url(@trailer_length), params: { trailer_length: { model_part: @trailer_length.model_part, name: @trailer_length.name, status: @trailer_length.status } }
    assert_redirected_to trailer_length_url(@trailer_length)
  end

  test "should destroy trailer_length" do
    assert_difference('TrailerLength.count', -1) do
      delete trailer_length_url(@trailer_length)
    end

    assert_redirected_to trailer_lengths_url
  end
end

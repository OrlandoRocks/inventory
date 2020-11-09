require 'test_helper'

class TrailerTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trailer_type = trailer_types(:one)
  end

  test "should get index" do
    get trailer_types_url
    assert_response :success
  end

  test "should get new" do
    get new_trailer_type_url
    assert_response :success
  end

  test "should create trailer_type" do
    assert_difference('TrailerType.count') do
      post trailer_types_url, params: { trailer_type: { image: @trailer_type.image, name: @trailer_type.name, status: @trailer_type.status } }
    end

    assert_redirected_to trailer_type_url(TrailerType.last)
  end

  test "should show trailer_type" do
    get trailer_type_url(@trailer_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_trailer_type_url(@trailer_type)
    assert_response :success
  end

  test "should update trailer_type" do
    patch trailer_type_url(@trailer_type), params: { trailer_type: { image: @trailer_type.image, name: @trailer_type.name, status: @trailer_type.status } }
    assert_redirected_to trailer_type_url(@trailer_type)
  end

  test "should destroy trailer_type" do
    assert_difference('TrailerType.count', -1) do
      delete trailer_type_url(@trailer_type)
    end

    assert_redirected_to trailer_types_url
  end
end

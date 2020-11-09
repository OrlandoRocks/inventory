require 'test_helper'

class RedilaTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @redila_type = redila_types(:one)
  end

  test "should get index" do
    get redila_types_url
    assert_response :success
  end

  test "should get new" do
    get new_redila_type_url
    assert_response :success
  end

  test "should create redila_type" do
    assert_difference('RedilaType.count') do
      post redila_types_url, params: { redila_type: { model_part: @redila_type.model_part, name: @redila_type.name, status: @redila_type.status } }
    end

    assert_redirected_to redila_type_url(RedilaType.last)
  end

  test "should show redila_type" do
    get redila_type_url(@redila_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_redila_type_url(@redila_type)
    assert_response :success
  end

  test "should update redila_type" do
    patch redila_type_url(@redila_type), params: { redila_type: { model_part: @redila_type.model_part, name: @redila_type.name, status: @redila_type.status } }
    assert_redirected_to redila_type_url(@redila_type)
  end

  test "should destroy redila_type" do
    assert_difference('RedilaType.count', -1) do
      delete redila_type_url(@redila_type)
    end

    assert_redirected_to redila_types_url
  end
end

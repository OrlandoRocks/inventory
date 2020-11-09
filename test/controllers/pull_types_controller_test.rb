require 'test_helper'

class PullTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pull_type = pull_types(:one)
  end

  test "should get index" do
    get pull_types_url
    assert_response :success
  end

  test "should get new" do
    get new_pull_type_url
    assert_response :success
  end

  test "should create pull_type" do
    assert_difference('PullType.count') do
      post pull_types_url, params: { pull_type: { model_part: @pull_type.model_part, name: @pull_type.name, status: @pull_type.status } }
    end

    assert_redirected_to pull_type_url(PullType.last)
  end

  test "should show pull_type" do
    get pull_type_url(@pull_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_pull_type_url(@pull_type)
    assert_response :success
  end

  test "should update pull_type" do
    patch pull_type_url(@pull_type), params: { pull_type: { model_part: @pull_type.model_part, name: @pull_type.name, status: @pull_type.status } }
    assert_redirected_to pull_type_url(@pull_type)
  end

  test "should destroy pull_type" do
    assert_difference('PullType.count', -1) do
      delete pull_type_url(@pull_type)
    end

    assert_redirected_to pull_types_url
  end
end

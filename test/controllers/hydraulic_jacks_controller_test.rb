require 'test_helper'

class HydraulicJacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hydraulic_jack = hydraulic_jacks(:one)
  end

  test "should get index" do
    get hydraulic_jacks_url
    assert_response :success
  end

  test "should get new" do
    get new_hydraulic_jack_url
    assert_response :success
  end

  test "should create hydraulic_jack" do
    assert_difference('HydraulicJack.count') do
      post hydraulic_jacks_url, params: { hydraulic_jack: { model_part: @hydraulic_jack.model_part, name: @hydraulic_jack.name, status: @hydraulic_jack.status } }
    end

    assert_redirected_to hydraulic_jack_url(HydraulicJack.last)
  end

  test "should show hydraulic_jack" do
    get hydraulic_jack_url(@hydraulic_jack)
    assert_response :success
  end

  test "should get edit" do
    get edit_hydraulic_jack_url(@hydraulic_jack)
    assert_response :success
  end

  test "should update hydraulic_jack" do
    patch hydraulic_jack_url(@hydraulic_jack), params: { hydraulic_jack: { model_part: @hydraulic_jack.model_part, name: @hydraulic_jack.name, status: @hydraulic_jack.status } }
    assert_redirected_to hydraulic_jack_url(@hydraulic_jack)
  end

  test "should destroy hydraulic_jack" do
    assert_difference('HydraulicJack.count', -1) do
      delete hydraulic_jack_url(@hydraulic_jack)
    end

    assert_redirected_to hydraulic_jacks_url
  end
end

require 'test_helper'

class SparePartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spare_part = spare_parts(:one)
  end

  test "should get index" do
    get spare_parts_url
    assert_response :success
  end

  test "should get new" do
    get new_spare_part_url
    assert_response :success
  end

  test "should create spare_part" do
    assert_difference('SparePart.count') do
      post spare_parts_url, params: { spare_part: { instock: @spare_part.instock, measurement: @spare_part.measurement, sub_category_id: @spare_part.sub_category_id, unit_cost: @spare_part.unit_cost } }
    end

    assert_redirected_to spare_part_url(SparePart.last)
  end

  test "should show spare_part" do
    get spare_part_url(@spare_part)
    assert_response :success
  end

  test "should get edit" do
    get edit_spare_part_url(@spare_part)
    assert_response :success
  end

  test "should update spare_part" do
    patch spare_part_url(@spare_part), params: { spare_part: { instock: @spare_part.instock, measurement: @spare_part.measurement, sub_category_id: @spare_part.sub_category_id, unit_cost: @spare_part.unit_cost } }
    assert_redirected_to spare_part_url(@spare_part)
  end

  test "should destroy spare_part" do
    assert_difference('SparePart.count', -1) do
      delete spare_part_url(@spare_part)
    end

    assert_redirected_to spare_parts_url
  end
end

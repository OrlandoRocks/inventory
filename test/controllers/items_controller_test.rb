require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post :create, item: { brand_id: @item.brand_id, department_id: @item.department_id, description: @item.description, in_service_date: @item.in_service_date, model: @item.model, name: @item.name, price: @item.price, provider_id: @item.provider_id, purchased_date: @item.purchased_date, serial_number: @item.serial_number, status_item_id: @item.status_item_id, sub_category_id: @item.sub_category_id, time_quantity_depreciation: @item.time_quantity_depreciation, time_quantity_service: @item.time_quantity_service, time_unit_depreciation: @item.time_unit_depreciation, time_unit_service: @item.time_unit_service, user_id: @item.user_id }
    end

    assert_redirected_to item_path(assigns(:item))
  end

  test "should show item" do
    get :show, id: @item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item
    assert_response :success
  end

  test "should update item" do
    patch :update, id: @item, item: { brand_id: @item.brand_id, department_id: @item.department_id, description: @item.description, in_service_date: @item.in_service_date, model: @item.model, name: @item.name, price: @item.price, provider_id: @item.provider_id, purchased_date: @item.purchased_date, serial_number: @item.serial_number, status_item_id: @item.status_item_id, sub_category_id: @item.sub_category_id, time_quantity_depreciation: @item.time_quantity_depreciation, time_quantity_service: @item.time_quantity_service, time_unit_depreciation: @item.time_unit_depreciation, time_unit_service: @item.time_unit_service, user_id: @item.user_id }
    assert_redirected_to item_path(assigns(:item))
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete :destroy, id: @item
    end

    assert_redirected_to items_path
  end
end

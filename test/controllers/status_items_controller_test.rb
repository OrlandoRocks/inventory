require 'test_helper'

class StatusItemsControllerTest < ActionController::TestCase
  setup do
    @status_item = status_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:status_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create status_item" do
    assert_difference('StatusItem.count') do
      post :create, status_item: { description: @status_item.description, name: @status_item.name, status: @status_item.status }
    end

    assert_redirected_to status_item_path(assigns(:status_item))
  end

  test "should show status_item" do
    get :show, id: @status_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @status_item
    assert_response :success
  end

  test "should update status_item" do
    patch :update, id: @status_item, status_item: { description: @status_item.description, name: @status_item.name, status: @status_item.status }
    assert_redirected_to status_item_path(assigns(:status_item))
  end

  test "should destroy status_item" do
    assert_difference('StatusItem.count', -1) do
      delete :destroy, id: @status_item
    end

    assert_redirected_to status_items_path
  end
end

require 'test_helper'

class WorkArticlesControllerTest < ActionController::TestCase
  setup do
    @work_article = work_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_article" do
    assert_difference('WorkArticle.count') do
      post :create, work_article: { name: @work_article.name }
    end

    assert_redirected_to work_article_path(assigns(:work_article))
  end

  test "should show work_article" do
    get :show, id: @work_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_article
    assert_response :success
  end

  test "should update work_article" do
    patch :update, id: @work_article, work_article: { name: @work_article.name }
    assert_redirected_to work_article_path(assigns(:work_article))
  end

  test "should destroy work_article" do
    assert_difference('WorkArticle.count', -1) do
      delete :destroy, id: @work_article
    end

    assert_redirected_to work_articles_path
  end
end

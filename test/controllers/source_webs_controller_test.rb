require 'test_helper'

class SourceWebsControllerTest < ActionController::TestCase
  setup do
    @source_web = source_webs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:source_webs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create source_web" do
    assert_difference('SourceWeb.count') do
      post :create, source_web: { project_id: @source_web.project_id, scheduler_type_id: @source_web.scheduler_type_id, url_collection: @source_web.url_collection, url_collection_name: @source_web.url_collection_name }
    end

    assert_redirected_to source_web_path(assigns(:source_web))
  end

  test "should show source_web" do
    get :show, id: @source_web
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @source_web
    assert_response :success
  end

  test "should update source_web" do
    patch :update, id: @source_web, source_web: { project_id: @source_web.project_id, scheduler_type_id: @source_web.scheduler_type_id, url_collection: @source_web.url_collection, url_collection_name: @source_web.url_collection_name }
    assert_redirected_to source_web_path(assigns(:source_web))
  end

  test "should destroy source_web" do
    assert_difference('SourceWeb.count', -1) do
      delete :destroy, id: @source_web
    end

    assert_redirected_to source_webs_path
  end
end

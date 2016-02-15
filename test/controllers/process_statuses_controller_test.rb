require 'test_helper'

class ProcessStatusesControllerTest < ActionController::TestCase
  setup do
    @process_status = process_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:process_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create process_status" do
    assert_difference('ProcessStatus.count') do
      post :create, process_status: { process_status: @process_status.process_status }
    end

    assert_redirected_to process_status_path(assigns(:process_status))
  end

  test "should show process_status" do
    get :show, id: @process_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @process_status
    assert_response :success
  end

  test "should update process_status" do
    patch :update, id: @process_status, process_status: { process_status: @process_status.process_status }
    assert_redirected_to process_status_path(assigns(:process_status))
  end

  test "should destroy process_status" do
    assert_difference('ProcessStatus.count', -1) do
      delete :destroy, id: @process_status
    end

    assert_redirected_to process_statuses_path
  end
end

require 'test_helper'

class WebProcessLogsControllerTest < ActionController::TestCase
  setup do
    @web_process_log = web_process_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:web_process_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create web_process_log" do
    assert_difference('WebProcessLog.count') do
      post :create, web_process_log: { process_status_id: @web_process_log.process_status_id, project_id: @web_process_log.project_id, source_web_id: @web_process_log.source_web_id, user_id: @web_process_log.user_id }
    end

    assert_redirected_to web_process_log_path(assigns(:web_process_log))
  end

  test "should show web_process_log" do
    get :show, id: @web_process_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @web_process_log
    assert_response :success
  end

  test "should update web_process_log" do
    patch :update, id: @web_process_log, web_process_log: { process_status_id: @web_process_log.process_status_id, project_id: @web_process_log.project_id, source_web_id: @web_process_log.source_web_id, user_id: @web_process_log.user_id }
    assert_redirected_to web_process_log_path(assigns(:web_process_log))
  end

  test "should destroy web_process_log" do
    assert_difference('WebProcessLog.count', -1) do
      delete :destroy, id: @web_process_log
    end

    assert_redirected_to web_process_logs_path
  end
end

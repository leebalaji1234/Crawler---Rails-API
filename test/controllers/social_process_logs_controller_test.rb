require 'test_helper'

class SocialProcessLogsControllerTest < ActionController::TestCase
  setup do
    @social_process_log = social_process_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:social_process_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create social_process_log" do
    assert_difference('SocialProcessLog.count') do
      post :create, social_process_log: { process_status_id: @social_process_log.process_status_id, project_id: @social_process_log.project_id, source_social_id: @social_process_log.source_social_id, user_id: @social_process_log.user_id }
    end

    assert_redirected_to social_process_log_path(assigns(:social_process_log))
  end

  test "should show social_process_log" do
    get :show, id: @social_process_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @social_process_log
    assert_response :success
  end

  test "should update social_process_log" do
    patch :update, id: @social_process_log, social_process_log: { process_status_id: @social_process_log.process_status_id, project_id: @social_process_log.project_id, source_social_id: @social_process_log.source_social_id, user_id: @social_process_log.user_id }
    assert_redirected_to social_process_log_path(assigns(:social_process_log))
  end

  test "should destroy social_process_log" do
    assert_difference('SocialProcessLog.count', -1) do
      delete :destroy, id: @social_process_log
    end

    assert_redirected_to social_process_logs_path
  end
end

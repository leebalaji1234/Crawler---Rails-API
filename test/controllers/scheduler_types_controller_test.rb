require 'test_helper'

class SchedulerTypesControllerTest < ActionController::TestCase
  setup do
    @scheduler_type = scheduler_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scheduler_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scheduler_type" do
    assert_difference('SchedulerType.count') do
      post :create, scheduler_type: { scheduler_name: @scheduler_type.scheduler_name }
    end

    assert_redirected_to scheduler_type_path(assigns(:scheduler_type))
  end

  test "should show scheduler_type" do
    get :show, id: @scheduler_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scheduler_type
    assert_response :success
  end

  test "should update scheduler_type" do
    patch :update, id: @scheduler_type, scheduler_type: { scheduler_name: @scheduler_type.scheduler_name }
    assert_redirected_to scheduler_type_path(assigns(:scheduler_type))
  end

  test "should destroy scheduler_type" do
    assert_difference('SchedulerType.count', -1) do
      delete :destroy, id: @scheduler_type
    end

    assert_redirected_to scheduler_types_path
  end
end

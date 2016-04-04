require 'test_helper'

class ProjectDomainsControllerTest < ActionController::TestCase
  setup do
    @project_domain = project_domains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_domains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_domain" do
    assert_difference('ProjectDomain.count') do
      post :create, project_domain: { domain_id: @project_domain.domain_id, project_id: @project_domain.project_id, user_id: @project_domain.user_id }
    end

    assert_redirected_to project_domain_path(assigns(:project_domain))
  end

  test "should show project_domain" do
    get :show, id: @project_domain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_domain
    assert_response :success
  end

  test "should update project_domain" do
    patch :update, id: @project_domain, project_domain: { domain_id: @project_domain.domain_id, project_id: @project_domain.project_id, user_id: @project_domain.user_id }
    assert_redirected_to project_domain_path(assigns(:project_domain))
  end

  test "should destroy project_domain" do
    assert_difference('ProjectDomain.count', -1) do
      delete :destroy, id: @project_domain
    end

    assert_redirected_to project_domains_path
  end
end

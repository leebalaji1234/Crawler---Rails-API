require 'test_helper'

class ProjectOntologiesControllerTest < ActionController::TestCase
  setup do
    @project_ontology = project_ontologies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_ontologies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_ontology" do
    assert_difference('ProjectOntology.count') do
      post :create, project_ontology: { ontology_id: @project_ontology.ontology_id, project_id: @project_ontology.project_id, user_id: @project_ontology.user_id }
    end

    assert_redirected_to project_ontology_path(assigns(:project_ontology))
  end

  test "should show project_ontology" do
    get :show, id: @project_ontology
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_ontology
    assert_response :success
  end

  test "should update project_ontology" do
    patch :update, id: @project_ontology, project_ontology: { ontology_id: @project_ontology.ontology_id, project_id: @project_ontology.project_id, user_id: @project_ontology.user_id }
    assert_redirected_to project_ontology_path(assigns(:project_ontology))
  end

  test "should destroy project_ontology" do
    assert_difference('ProjectOntology.count', -1) do
      delete :destroy, id: @project_ontology
    end

    assert_redirected_to project_ontologies_path
  end
end

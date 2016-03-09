require 'test_helper'

class NlpConfigsControllerTest < ActionController::TestCase
  setup do
    @nlp_config = nlp_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nlp_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nlp_config" do
    assert_difference('NlpConfig.count') do
      post :create, nlp_config: { disambiguation: @nlp_config.disambiguation, entities_extract: @nlp_config.entities_extract, general_annotations: @nlp_config.general_annotations, language: @nlp_config.language, linking_method: @nlp_config.linking_method, lod: @nlp_config.lod, opendata: @nlp_config.opendata, project_id: @nlp_config.project_id, spotting_method: @nlp_config.spotting_method }
    end

    assert_redirected_to nlp_config_path(assigns(:nlp_config))
  end

  test "should show nlp_config" do
    get :show, id: @nlp_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nlp_config
    assert_response :success
  end

  test "should update nlp_config" do
    patch :update, id: @nlp_config, nlp_config: { disambiguation: @nlp_config.disambiguation, entities_extract: @nlp_config.entities_extract, general_annotations: @nlp_config.general_annotations, language: @nlp_config.language, linking_method: @nlp_config.linking_method, lod: @nlp_config.lod, opendata: @nlp_config.opendata, project_id: @nlp_config.project_id, spotting_method: @nlp_config.spotting_method }
    assert_redirected_to nlp_config_path(assigns(:nlp_config))
  end

  test "should destroy nlp_config" do
    assert_difference('NlpConfig.count', -1) do
      delete :destroy, id: @nlp_config
    end

    assert_redirected_to nlp_configs_path
  end
end

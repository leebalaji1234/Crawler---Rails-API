require 'test_helper'

class SourceSocialsControllerTest < ActionController::TestCase
  setup do
    @source_social = source_socials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:source_socials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create source_social" do
    assert_difference('SourceSocial.count') do
      post :create, source_social: { access_secret: @source_social.access_secret, access_token: @source_social.access_token, channel_id: @source_social.channel_id, collection_name: @source_social.collection_name, consumer_key: @source_social.consumer_key, consumer_secret: @source_social.consumer_secret, fb_feed_limit: @source_social.fb_feed_limit, fb_like_page_id: @source_social.fb_like_page_id, geo_lat: @source_social.geo_lat, geo_lon: @source_social.geo_lon, instagram_end_time: @source_social.instagram_end_time, instagram_start_time: @source_social.instagram_start_time, instagram_tags: @source_social.instagram_tags, project_id: @source_social.project_id, twitter_hastags: @source_social.twitter_hastags }
    end

    assert_redirected_to source_social_path(assigns(:source_social))
  end

  test "should show source_social" do
    get :show, id: @source_social
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @source_social
    assert_response :success
  end

  test "should update source_social" do
    patch :update, id: @source_social, source_social: { access_secret: @source_social.access_secret, access_token: @source_social.access_token, channel_id: @source_social.channel_id, collection_name: @source_social.collection_name, consumer_key: @source_social.consumer_key, consumer_secret: @source_social.consumer_secret, fb_feed_limit: @source_social.fb_feed_limit, fb_like_page_id: @source_social.fb_like_page_id, geo_lat: @source_social.geo_lat, geo_lon: @source_social.geo_lon, instagram_end_time: @source_social.instagram_end_time, instagram_start_time: @source_social.instagram_start_time, instagram_tags: @source_social.instagram_tags, project_id: @source_social.project_id, twitter_hastags: @source_social.twitter_hastags }
    assert_redirected_to source_social_path(assigns(:source_social))
  end

  test "should destroy source_social" do
    assert_difference('SourceSocial.count', -1) do
      delete :destroy, id: @source_social
    end

    assert_redirected_to source_socials_path
  end
end

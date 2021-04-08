require 'test_helper'

class TweetTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tweet_tag = tweet_tags(:one)
  end

  test "should get index" do
    get tweet_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_tweet_tag_url
    assert_response :success
  end

  test "should create tweet_tag" do
    assert_difference('TweetTag.count') do
      post tweet_tags_url, params: { tweet_tag: { tag_id: @tweet_tag.tag_id, tweet_id: @tweet_tag.tweet_id } }
    end

    assert_redirected_to tweet_tag_url(TweetTag.last)
  end

  test "should show tweet_tag" do
    get tweet_tag_url(@tweet_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_tweet_tag_url(@tweet_tag)
    assert_response :success
  end

  test "should update tweet_tag" do
    patch tweet_tag_url(@tweet_tag), params: { tweet_tag: { tag_id: @tweet_tag.tag_id, tweet_id: @tweet_tag.tweet_id } }
    assert_redirected_to tweet_tag_url(@tweet_tag)
  end

  test "should destroy tweet_tag" do
    assert_difference('TweetTag.count', -1) do
      delete tweet_tag_url(@tweet_tag)
    end

    assert_redirected_to tweet_tags_url
  end
end

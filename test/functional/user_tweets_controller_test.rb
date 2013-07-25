require 'test_helper'

class UserTweetsControllerTest < ActionController::TestCase
  setup do
    @user_tweet = user_tweets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_tweets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_tweet" do
    assert_difference('UserTweet.count') do
      post :create, user_tweet: { tweet: @user_tweet.tweet, user_id: @user_tweet.user_id }
    end

    assert_redirected_to user_tweet_path(assigns(:user_tweet))
  end

  test "should show user_tweet" do
    get :show, id: @user_tweet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_tweet
    assert_response :success
  end

  test "should update user_tweet" do
    put :update, id: @user_tweet, user_tweet: { tweet: @user_tweet.tweet, user_id: @user_tweet.user_id }
    assert_redirected_to user_tweet_path(assigns(:user_tweet))
  end

  test "should destroy user_tweet" do
    assert_difference('UserTweet.count', -1) do
      delete :destroy, id: @user_tweet
    end

    assert_redirected_to user_tweets_path
  end
end

class UserTweetsController < ApplicationController
  # GET /user_tweets
  # GET /user_tweets.json
  def index
    @user_tweets = UserTweet.all
    @users = User.all
    @relations = Relation.all
    logger.debug("^^^^^^^#{@relations}")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_tweets }
    end
  end

  # GET /user_tweets/1
  # GET /user_tweets/1.json
  def show
    @user_tweet = UserTweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_tweet }
    end
  end

  # GET /user_tweets/new
  # GET /user_tweets/new.json
  def new
    @user_tweet = UserTweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_tweet }
    end
  end

  # GET /user_tweets/1/edit
  def edit
    @user_tweet = UserTweet.find(params[:id])
  end

  # POST /user_tweets
  # POST /user_tweets.json
  def create
    @user_tweet = UserTweet.new(params[:user_tweet])

    respond_to do |format|
      if @user_tweet.save
        format.html { redirect_to @user_tweet, notice: 'User tweet was successfully created.' }
        format.json { render json: @user_tweet, status: :created, location: @user_tweet }
      else
        format.html { render action: "new" }
        format.json { render json: @user_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_tweets/1
  # PUT /user_tweets/1.json
  def update
    @user_tweet = UserTweet.find(params[:id])

    respond_to do |format|
      if @user_tweet.update_attributes(params[:user_tweet])
        format.html { redirect_to @user_tweet, notice: 'User tweet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_tweets/1
  # DELETE /user_tweets/1.json
  def destroy
    @user_tweet = UserTweet.find(params[:id])
    @user_tweet.destroy

    respond_to do |format|
      format.html { redirect_to user_tweets_url }
      format.json { head :no_content }
    end
  end
end

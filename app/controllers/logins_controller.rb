class LoginsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(login_params)
  	if @user.registered?
  		session[:login] = @user.id
  		redirect_to user_tweets_path
  	else
  		render action: "new"
  	end
  end

  def destroy
  	session[:login] = nil
   	redirect_to logins_new_path
  end

  def login_params
  	params.require(:user).permit(:name, :password)
  end
end

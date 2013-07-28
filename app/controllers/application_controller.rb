# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_user, except: [:new, :create]

  def current_user
  	unless session[:login]
  		redirect_to logins_new_path, notice: "please login!"
  	end
  end
end

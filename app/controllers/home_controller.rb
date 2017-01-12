class HomeController < ApplicationController
  def index
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end

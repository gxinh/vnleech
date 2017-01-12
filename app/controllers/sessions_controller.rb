class SessionsController < ApplicationController
  def index
  end
  
  def new
  end

  def create
    byebug
    @user = User.find_by(name: params[:name]).try(:authenticate, params[:password])  
    if @user.nil?
      flash.now[:error] = "Invalid Username / Password combination"
      redirect_to root_path
    else
      sign_in @user

      if is_admin
        redirect_to admin_dashboard_index_path
      else
        redirect_to root_path
      end
    end
    
  end

  def destroy
  end
end

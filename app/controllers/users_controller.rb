class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @memberRole = Role.find_by(name: "Free")
    @user.role_id = @memberRole.id
    @user.delete_flag = 0
    byebug
  	if @user.save
  		redirect_to root_path, notice: 'User was save successfull created'
  	else
  		render action: 'new'
  	end
  end

  def edit
  end

  def update
  end

  def index
  end

  def show
  end

  def destroy
  end
  
  private 
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end

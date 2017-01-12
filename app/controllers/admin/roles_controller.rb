class Admin::RolesController < Admin::ApplicationController
  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    @role.delete_flag = 0
    
    if @role.save
      redirect_to admin_roles_path, notice: 'Role was save successfull created'
    else
      render 'new'
    end
    
  end

  def edit
  end

  def update
  end

  def index
    @roles = Role.where(delete_flag: 0).all
  end

  def show
  end

  def destroy
  end
  
  def role_params
      params.require(:role).permit(:name, :delete_flag)
    end
end

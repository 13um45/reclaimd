class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new admin_params

    if @admin.save
      redirect_to root_path, notice: "Created Administrator"
    else
      render action: 'new'
    end
  end

  private
  def admin_params
    params.
    require(:user).
    permit(:username, :password, :password_confirmation)
  end

end

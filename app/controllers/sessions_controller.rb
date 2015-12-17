class SessionsController < ApplicationController

  def new
    if current_admin || current_user
      redirect_to root_path
    end
  end

  def create
    @admin = Admin.
      find_by(username: params[:username]).
      try(:authenticate, params[:password])

    @user = User.
      find_by(username: params[:username]).
      try(:authenticate, params[:password])

    if @admin
      # logged in, hooray
      session[:admin_id] = @admin.id
      redirect_to products_path
    elsif @user
      session[:user_id] = @user.id
      redirect_to products_path

    else
      flash[:notice] = "Form is invalid"
      flash[:color] = "invalid"
      render action: 'new'
      end
    end

  def destroy
    session[:admin_id] = nil
    session[:user_id] = nil
    redirect_to '/login'
  end
end

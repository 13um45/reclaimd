class SessionsController < ApplicationController

  def new
  end

  def create
    @admin = Admin.
      find_by(username: params[:username]).
      try(:authenticate, params[:password])

    if @admin
      # logged in, hooray
      session[:admin_id] = @admin.id
      redirect_to products_path
    else
      render action: 'new'
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to '/login'
  end

end

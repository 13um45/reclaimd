class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_order
  helper_method :current_admin
  helper_method :current_user

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def admin_privilege
    return true if current_admin

    redirect_to root_path
    return false
  end

  def require_user_login
    return true if current_user

    redirect_to root_path
    return false
  end

end


class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_admin

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

  def require_logged_in
    return true if current_admin

    redirect_to root_path
    return false
  end
end


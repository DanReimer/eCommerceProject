module SessionsHelper
  # Starts session with passed user
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def admin_logout_path
    log_out
    root_path
  end

  # Returns current user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_admin
    logged_in? ? current_user.admin : false
  end

  def logged_in?
    !!current_user
  end
end

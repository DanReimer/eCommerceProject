module SessionsHelper
  # Starts session with passed user
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Returns current user (with caching)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end

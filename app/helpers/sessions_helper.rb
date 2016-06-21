module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    # rails method: make temporary cookies using the session method that are automatically encrypted and expire automatically on browser close
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    # storing in a instance variable, which hits the db the 1st time but
    # returns the instance variable immediately on subsequents invocations
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the given user is the current user, also replaces the current_user method
  def current_user?(user)
    user == current_user
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end

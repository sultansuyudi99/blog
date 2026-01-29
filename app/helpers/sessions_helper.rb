# typed: true

module SessionsHelper
  extend T::Sig

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    reset_session
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  sig { returns(T::Boolean) }
  def is_logged_in?
    !current_user.nil?
  end
end

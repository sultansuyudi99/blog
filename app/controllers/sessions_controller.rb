# typed: true

class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user&.authenticate(params[:session][:password])
      forwarding_url = session[:forwarding_url]
      reset_session
      params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
      log_in @user
      redirect_to forwarding_url || @user, notice: "Successfully logged in!"
    else
      flash.now[:danger] = "Invalid credentials."
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    log_out if is_logged_in?
    redirect_to root_path, notice: "Successfully logged out!"
  end

  private
  def session_params
    params.expect(session: [ :email, :password, :remember_me ])
  end
end

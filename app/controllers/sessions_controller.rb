# typed: true

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      reset_session
      log_in user
      redirect_to user, notice: "Successfully logged in!"
    else
      flash.now[:danger] = "Invalid credentials."
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_path, notice: "Successfully logged out!"
  end

  private
  def session_params
    params.expect(session: [ :email, :password ])
  end
end

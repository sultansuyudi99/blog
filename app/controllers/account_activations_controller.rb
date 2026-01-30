# typed: true

class AccountActivationsController < ApplicationController
  def edit
    activation_token = params[:id]
    user = User.find_by(email: params[:email])

    if !user&.activated && user&.authenticated?(activation_token, attribute: :activation)
      user.activate
      log_in(user)
      flash[:success] = "Congratulations! Your account has been activated."
      redirect_to(user)
    else
      flash[:danger] = "Invalid activation link."
      redirect_to(root_url)
    end
  end
end

class SessionsController < ApplicationController
	def create
    user = User.from_omniauth(env["omniauth.auth"])
    sign_in user
    redirect_to root_path
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end

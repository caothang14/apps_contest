class SessionsController < ApplicationController
	def create
		if params[:session]
			user = User.find_by(phone_number: params[:session][:phone_number])
			if user && user.authenticate(params[:session][:password])
        sign_in user
	      redirect_to root_path
      else
        flash[:error] = 'Invalid phone number/password combination' # Not quite right!
        render 'new'
      end
		else
	    user = User.from_omniauth(env["omniauth.auth"])
	    sign_in user
	    redirect_to root_path
	  end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end

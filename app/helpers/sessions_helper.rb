module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user= user
    @current_user = user
  end
  
  def sign_in user
    session[:user_id] = user.id
    self.current_user = user
  end

  def sign_out
    self.current_user = nil
    session[:user_id] = nil
  end

  def signed_in?
    !current_user.nil?
  end

  def check_logged_in?
    redirect_to '/auth/facebook' and return unless current_user
  end
end

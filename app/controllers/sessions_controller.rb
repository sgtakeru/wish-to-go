class SessionsController < ApplicationController
  def new
    
  end

  def create

    auth = request.env["omniauth.auth"].symbolize_keys
    
    user = User.where(auth.slice(:provider, :uid)).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id

    redirect_to places_path
  end

  def destroy
    sessions[:user_id] = nil
    redirect_to signin_path
             
  end

  def failure

    flash[:error] = "Authentication error: #{params[:message].humanize}"
    redirect_to signin_path
  end
end

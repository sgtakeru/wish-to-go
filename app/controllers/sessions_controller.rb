class SessionsController < ApplicationController
  def new
    
  end

  def create
    
    auth = request.env["omniauth.auth"].symbolize_keys
    
    user = User.where(auth.slice(:provider, :uid)).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id

    respond_to do |format|
      if params[:format]
        format.json { head :ok }
      else
        format.html { redirect_to places_path }
      end
    end
    
    
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to signin_path
             
  end

  def failure

    flash[:error] = "Authentication error: #{params[:message].humanize}"
    redirect_to signin_path
  end
end

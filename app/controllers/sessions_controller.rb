class SessionsController < ApplicationController
  def index
  	if user_signed_in
  		redirect_to dashboard_index_path
  	end
  end
  
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)    
    session[:user_id] = @user.id
    redirect_to dashboard_index_path
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
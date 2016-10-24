class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include FivehundredHelper

  def current_user
    access_token = get_access_token()
    username ||= session[:username] if session[:username]
    token ||= access_token.token if access_token

    @current_user = {'username' => username, 'token' => token}
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
    redirect_to '/login' unless get_access_token != nil
  end
end
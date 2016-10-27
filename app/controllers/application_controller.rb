class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    include FivehundredHelper

    # Gets the current logged user if any and sends it into the view to be loaded in app js
    # @return [Object] - the current logged user username and token
    def current_user
        access_token = get_access_token()
        username ||= session[:username] if session[:username]
        token ||= access_token.token if access_token

        @current_user = {'username' => username, 'token' => token}
    end
    helper_method :current_user

    # Checks if we have a logged user and redirects the action to login if we do not have any
    # Checks fi we have the access_token object, if not answer with 401 unauthorized
    def authorize
        redirect_to '/login' unless current_user['username']

        @access_token = get_access_token()

        if not @access_token
            respond_to do |format|
                format.json { render :json => [], :status => 401 }
            end
            return
        end

    end
end

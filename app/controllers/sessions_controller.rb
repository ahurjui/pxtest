class SessionsController < ApplicationController

    include FivehundredHelper

    # The authenticate action for the application. The app uses the 500px api to login
    #
    # params(username, password)
    #   username - string - the username from the 500px account
    #   password - string - the password from the 500px account
    #
    # If the username or password ar incorect than the method will redirect the user to the login page with an error message,
    # otherwise it will set the username in session and redirect the user to langing page of the app
    def create
        access_token = get_access_token params[:username], params[:password]

        if access_token
            session[:username] = params[:username]
            redirect_to '/'
        else
            flash[:error] = "Wrong username and password!"
            redirect_to '/login'
        end
    end

    # The logout action
    def destroy
        session[:username] = nil
        redirect_to '/login'
    end

    # The login landing page, it will redirect the user to the app landing page if user already logged in
    def login
        if session[:username]
            redirect_to '/'
        end
    end

end

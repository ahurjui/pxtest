class SessionsController < ApplicationController

    include FivehundredHelper

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

    def destroy
        session[:username] = nil
        redirect_to '/login'
    end

    def login
        if session[:username]
            redirect_to '/'
        end
    end

end

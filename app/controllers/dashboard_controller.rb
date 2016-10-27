class DashboardController < ApplicationController

    # the base root of the application
    def index
        if @@access_token == nil
            redirect_to '/login'
        end
    end

end

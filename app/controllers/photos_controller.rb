class PhotosController < ApplicationController

    include FivehundredHelper

    before_filter :authorize

    def index
        access_token = get_access_token()

        photos = MultiJson.decode(access_token.get('/v1/photos.json?feature=popular&rpp=100').body)['photos']

        respond_to do |format|
            format.json { render :json => photos }
        end
    end

end

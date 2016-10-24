class PhotosController < ApplicationController

    include FivehundredHelper

    before_filter :authorize

    def index
        access_token = get_access_token()
        if access_token == nil
            resp = Array.new
            respond_to do |format|
                format.json { render :json => [], :status => 401 }
            end
            return
        end

        fiveundred_photos = access_token.get('/v1/photos.json?feature=popular&rpp=100')

        photos = MultiJson.decode(fiveundred_photos.body)['photos']

        respond_to do |format|
            format.json { render :json => photos }
        end
    end

    def vote
        access_token = get_access_token()
        if access_token == nil
            resp = Array.new
            respond_to do |format|
                format.json { render :json => [], :status => 401 }
            end
            return
        end

        vote_value = params[:value]
        photo_id = params[:photo_id]

        photo_vote_result = access_token.post('/v1/photos/'+photo_id+'/vote?vote=' + vote_value)
        photo = MultiJson.decode(photo_vote_result.body)

        respond_to do |format|
            format.json { render :json => photo, :status => photo['status'] }
        end


    end

end

class PhotosController < ApplicationController

    include FivehundredHelper

    before_filter :authorize

    # Gets the list of the most 100 popular photos and sends it to the client
    # @return [json] - list of the most 100 popular photos
    def index
        fiveundred_photos = @access_token.get('/v1/photos.json?feature=popular&rpp=100')
        photos = MultiJson.decode(fiveundred_photos.body)['photos']

        respond_to do |format|
            format.json { render :json => photos }
        end
    end

    # Vote action for a phot0, like or dislike
    #
    # params(value, photo_id)
    #   value - int - the value of the vote 0 or 1
    #   photo_id - int - the id of photo to be voted
    #
    # @return [json] - the response object from the 500px api
    def vote
        vote_value = params[:value]
        photo_id = params[:photo_id]

        photo_vote_result = @access_token.post('/v1/photos/'+photo_id+'/vote?vote=' + vote_value)
        photo = MultiJson.decode(photo_vote_result.body)

        respond_to do |format|
            format.json { render :json => photo, :status => photo['status'] }
        end
    end

    def new

    end

    def create

    end

    def show

    end

    def edit

    end

    def update

    end

    def destroy

    end

end

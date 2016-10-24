App = Fivehundred.Test
$ = App.$

App.module 'Views.Fivehundred',
    PhotosList: class extends App.View
        el: '#photos-list'
        template: 'fivehundred/photos_list'
        events:
            'click .image-small-list': 'showNormalImageSizeAction'
            'click .action-vote-photo': 'voteAction'

        initialize: ->
            super

        showNormalImageSizeAction: (e) ->
            window.open e.target.src, '_blank'

        voteAction: (e) ->
            self = @
            photo_id = $(e.target).attr('data-id')
            vote_value = $(e.target).attr('data-vote')

            @photoModel = new App.Models.Photo()
            @photoModel.urlRoot = @photoModel.urlRoot + '/' +photo_id + '/vote/' + vote_value

            @photoModel.save {},
                success: (model, response) ->
                    alert 'Your vote has been registerd!'
                error: (model, response) ->
                    if response.responseJSON.error_code != undefined && response.responseJSON.error_code != ''
                        alert(response.responseJSON.error);
                    else
                        alert 'There has been an error voting for this photo!'
                wait: true
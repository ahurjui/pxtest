App = Fivehundred.Test
$ = App.$

App.module 'Views.Fivehundred',
    PhotosList: class extends App.View
        el: '#photos-list'
        template: 'fivehundred/photos_list'
        events:
            'click .image-small-list': 'showNormalImageSizeAction'
            'click .action-like': 'likeAction'

        initialize: ->
            super

        showNormalImageSizeAction: (e) ->
            window.open e.target.src, '_blank'

        likeAction: (e) ->
            photo_id = $(e.target).attr('data-id')

            photoModel = new App.Models.Photo()
            photoModel.vote(photo_id)

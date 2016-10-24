App = Fivehundred.Test
$ = App.$

App.module 'Views.Fivehundred',
    Photos: class extends App.View
        el: '#page-content'
        template: 'fivehundred/photos'
        events:
            'click #get-photos': 'getPhotosEvent'

        initialize: ->
            super

        getPhotosEvent: ->
            unless @photosCollection
                @photosCollection = new App.Collections.Photos()
            @photosCollection.fetch({'dataType': 'json', async:false})

            unless @photosTableView
                @photosTableView = new App.Views.Fivehundred.PhotosList()

            @photosTableView.render(@photosCollection.models)
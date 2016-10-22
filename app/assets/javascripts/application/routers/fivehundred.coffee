App = Fivehundred.Test
$ = App.$

App.module 'Routers',
    Fivehundred: class extends App.Router
        routes:
            "dashboard/fivehundred/photos"      : "showFivehundredPhotosPage"

        initialize: ->
            super

        showFivehundredPhotosPage: ->
            unless @fivehundredPhotosPage
                @fivehundredPhotosPage = new App.Views.Fivehundred.Photos();
            @fivehundredPhotosPage.render()

new App.Routers.Fivehundred()
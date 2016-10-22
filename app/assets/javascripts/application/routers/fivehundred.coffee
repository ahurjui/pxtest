App = Fivehundred.Test
$ = App.$

App.module 'Routers',
    Fivehundred: class extends App.Router
        routes:
            "dashboard/fivehundred/login"       : "showFivehundredLoginPage"
            "dashboard/fivehundred/photos"      : "showFivehundredPhotosPage"
            "dashboard/fivehundred/credentials" : "showFivehundredCredentialsPage"

        initialize: ->
            super

        showFivehundredLoginPage: (e) ->
            unless @fivehundredLoginPage
                @fivehundredLoginPage = new App.Views.Fivehundred.Login();
            @fivehundredLoginPage.render()

        showFivehundredPhotosPage: ->
            unless @fivehundredPhotosPage
                @fivehundredPhotosPage = new App.Views.Fivehundred.Photos();
            @fivehundredPhotosPage.render()

        showFivehundredCredentialsPage: ->
            unless @fivehundredCredentialsPage
                @fivehundredCredentialsPage = new App.Views.Fivehundred.Credentials();
            @fivehundredCredentialsPage.render()


new App.Routers.Fivehundred()
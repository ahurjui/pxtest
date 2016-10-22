App = Fivehundred.Test
$ = App.$

App.module 'Views.Fivehundred',
    Login: class extends App.View
        el: '#page-content'
        template: 'fivehundred/login'
        fbSdkIsLoaded: false

        events:
            'submit #facebook-app-login': 'actionFivehundredLogin'
            'click #get-users-from-application': 'actionGetUsersFromApplication'

        initialize: ->
            super

        actionFivehundredLogin: (e)->
            e.preventDefault()
            e.stopPropagation()

            FB.login (response) ->
                App.Models.Fivehundred = new App.Models.Providers.Fivehundred(response.authResponse)


        updateFivehundredStatus: ->
            $("#logged-message").show();


        actionGetUsersFromApplication: ->
            FB.api '/' + $("#app-id").val(), (response) ->
                if response and !response.error
                    console.log response

new App.Views.Fivehundred.Login()
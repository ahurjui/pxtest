App = Fivehundred.Test
$ = App.$

App.module 'Views.Fivehundred',
    Credentials: class extends App.View
        el: '#page-content'
        template: 'fivehundred/credentials'

        initialize: ->
            super

new App.Views.Fivehundred.Credentials()
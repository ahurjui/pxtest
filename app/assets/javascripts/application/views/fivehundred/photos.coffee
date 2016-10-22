App = Fivehundred.Test
$ = App.$

App.module 'Views.Fivehundred',
    Photos: class extends App.View
        el: '#page-content'
        template: 'fivehundred/photos'

        initialize: ->
            super

new App.Views.Fivehundred.Photos()
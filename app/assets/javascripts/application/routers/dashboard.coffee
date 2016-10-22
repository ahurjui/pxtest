App = Fivehundred.Test
$ = App.$

App.module 'Routers',
    Dashboard: class extends App.Router
        routes:
            ""   : "showIndexPage"

        initialize: ->
            super

        showIndexPage: ->
            true

new App.Routers.Dashboard()
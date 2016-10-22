App = Fivehundred.Test
$ = App.$

App.module 'Views.Sidebar',
    Navigation: class extends App.View
        el: '#sidebar-collapse'

        events:
            'click #facebook-login-page': 'gotoFacebookLoginRoute'

        initialize: ->
            super

        gotoFacebookLoginRoute: (e)=>
            e.stopPropagation()
            e.preventDefault()

            facebookRoute = new App.Routers.Dashboard()
            facebookRoute.navigate($(e.target).attr("href"), true)

new App.Views.Sidebar.Navigation()
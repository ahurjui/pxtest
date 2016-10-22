App = Fivehundred.Test
$ = App.$

App.module 'Collections',
    Users: class extends App.Collection
        klass: 'Users'
        model: App.Models.User
        url: App.rootUrl() + 'users'
App = Fivehundred.Test
$ = App.$

App.module 'Collections',
    Photos: class extends App.Collection
        klass: 'Photos'
        model: App.Models.Photo
        url: App.rootUrl() + 'photos.json'
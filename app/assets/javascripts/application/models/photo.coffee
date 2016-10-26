App = Fivehundred.Test
$ = App.$

App.module 'Models',
  Photo: class extends App.Model
      klass: 'photo'
      urlRoot: App.rootUrl() + '/photos'
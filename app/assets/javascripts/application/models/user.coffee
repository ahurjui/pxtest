App = Fivehundred.Test
$ = App.$

App.module 'Models',
  User: class extends App.Model
      klass: 'User'
      urlRoot: '/users'

      defaults:
          asd: 1
          bcd: 3

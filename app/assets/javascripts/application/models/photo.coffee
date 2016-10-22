App = Fivehundred.Test
$ = App.$

App.module 'Models',
  Photo: class extends App.Model
      klass: 'photo'
      urlRoot: App.FivehundredBaseUrl + '/photos/'

      vote: (photo_id) ->
          @urlRoot = @urlRoot + photo_id + '/vote?vote=1&oauth_token=' + App.LoggedUser.get('token')

          console.log @urlRoot

          @save()
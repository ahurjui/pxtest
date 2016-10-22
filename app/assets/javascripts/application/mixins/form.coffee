App = Fivehundred.Test
$ = App.$

App.module 'Mixins.Form',
    serializeObject: (form) ->
      serializedArray = $(form).serializeArray()
      _(serializedArray).reduce(
        (h, f) ->
          if h[f.name]
            h[f.name] = [h[f.name]] unless _.isArray(h[f.name])
            h[f.name].push(f.value)
          else
            h[f.name] = f.value
          h
        {})

    closeSubmisisonErrorBox: () ->
      $('.error-group').remove()
    

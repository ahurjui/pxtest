App = Fivehundred.Test

_sync = Backbone.sync
class App.Collection extends Backbone.Collection
    # gets around rails's json wrapper by just using the first array
    # in the response to build the collection
    parse: (res) ->
        if _.isArray(res)
            parsed = super(res)
        else
            for k, v of res when _.isArray(v)
                parsed = super(v)

        parsed
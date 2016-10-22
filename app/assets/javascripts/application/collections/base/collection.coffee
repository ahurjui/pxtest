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

    sync: (method, collection, options) ->
        if collection and (method == 'create' or method == 'update' or method == 'patch' or method == "save" or method == "update")
            options.contentType = 'application/json'
            options.data = JSON.stringify(options.attrs or collection.toJSON())

        _.extend options.data, 'access_token': App.LoggedUser.get("access_token")

        if collection and (method == "read")
            collection.urlRoot = collection.url + "?access_token=" + App.LoggedUser.get("access_token")

        if options.url
            options.url = options.url + "?access_token=" + App.LoggedUser.get("access_token")
        else
            options.url = collection.urlRoot

        _sync.call this, method, collection, options
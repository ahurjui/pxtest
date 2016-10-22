App = Fivehundred.Test
$ = App.$

_sync = Backbone.sync

# App.Model extends the standard Backbone.Model
# and provides one-to-one, one-to-many relations
# it also support relation serialization
class App.Model extends Backbone.Model
    initialize: (options) ->
        super
        for option in ['hasOne', 'hasMany']
            if @[option] and _.isString(@[option])
                @[option] = [@[option]]

        if @hasMany or @hasOne
            for k, v of @attributes
                if @hasMany
                    if k in @hasMany
                        collectionKlass = App.Collections[App.Util.String.classify(k)]

                        if collectionKlass?
                            collection = null
                            if _.isArray(v)
                                collection = new collectionKlass(v)

                            if v instanceof collectionKlass
                                collection = v

                            if collection?
                                @[App.Util.String.camelize(k)] = @attributes[k] = collection


                if @hasOne
                    attributeKey = null
                    if k in @hasOne
                        attributeKey = k

                    # Why do we consider _id as a relation?
                    # keyWithoutId = k.replace(/_id$/, '')
                    # if keyWithoutId in @hasOne
                    #   attributeKey = keyWithoutId

                    if attributeKey?
                        modelClass = App.Models[App.Util.String.classify(attributeKey)]

                        if modelClass?
                            model = null
                            if v instanceof modelClass
                                model = v
                            else
                                model = new modelClass(v)

                            if model?
                                @[App.Util.String.camelize(attributeKey)] = @attributes[attributeKey] = model

    toJSON: ->
        json = super
        if @hasMany
            for k in @hasMany
                json[k] = @get(k).toJSON() if @has(k)
        super
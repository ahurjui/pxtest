App = Fivehundred.Test
$ = App.$

class App.View extends Backbone.View

    el: '#page-content'

    defaultEvents:
        'click [data-action]': 'triggerAction'

    initialize: (options = {}) ->

        @events = _.extend(@events || {}, @defaultEvents)
        App.Event.trigger('view:initialize', this)

    getHbsTemplate: (path) =>


    triggerAction: (event) ->
        $target = $(event.currentTarget)
        action = $target.attr('data-action')

        if action
            @trigger('action:'+action, event, $target.data('action-data'))
        return false


    getTemplateVars: ->
        if @model
            return @model.toJSON() if 'toJSON' of @model
            return @model
        else if @collection
            return @collection.toJSON() if 'toJSON' of @collection
            return @collection
        else
            {}

    mapEnumForSelect: (enumeration) =>
        collection = new App.Collection()

        keys =  Object.keys(enumeration)
        for key in keys
            model = new App.Model()
            model.set("select_key", key)
            model.set("select_value", enumeration[key])

            collection.add(model)

        collection.toJSON()


    mapCollectionForSelect: (collection, key_property, value_property) =>
        _.object _.map(collection.models, (model) ->
            model.set("select_key", model.get(key_property))
            model.set("select_value", model.get(value_property))
        )
        collection.toJSON()

    ###
        @desc Humanize the camel case values from enumeration key
        @param model that contains the enumeration
        @return model that contains the enumeration humanized
    ###
    humanizeEnumKeys: (enumeration) ->
        _.each enumeration, (property) ->
            property.select_key = App.Util.String.humanizeCamelCase(property.select_key)

        enumeration

    setKeyValueForSelect: () =>
        model

    renderCsv: ->
        if @csv_template
            if @getCsvTemplateVars then @csv_template(@getCsvTemplateVars()) else @csv_template(@getTemplateVars())
        else
            ""

    render: (options={}) =>
        if @$el.selector == "#page-content"
            if App.CurrentView
                App.CurrentView.undelegateEvents()
            App.CurrentView = @

        @$el.html HandlebarsTemplates[@template](options) if @template

        @trigger('render') unless options.silent
        @

    renderApiErrors: (data) ->
        $("#success-container").html()
        model = new App.Model(data)
        errorsView = new App.Views.Errors.Api.Validation(model: model)
        errorsView.render()

    renderApiStoreSuccessMessage: ->
        $("#error-container").html()
        successViews = new App.Views.Success.Api.Created(model: new App.Model())
        successViews.render()

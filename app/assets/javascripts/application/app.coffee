#= require_self

#= require_tree ./helpers
#= require_tree ./templates

#= require_tree ./mixins

#= require ./models/base/model
#= require_tree ./models/base
#= require_tree ./models

#= require ./collections/base/collection
#= require_tree ./collections/base
#= require_tree ./collections

#= require      ./routers/base/router
#= require_tree ./routers/base
#= require_tree ./routers

#= require      ./views/base/view
#= require_tree ./views/base
#= require_tree ./views

#= require      ./config

App = Fivehundred.Test

_(App).extend
    Event: _.extend({}, Backbone.Events)
    Models: {},
    Views: {},
    Routers: {},
    Collections: {},
    Mixins: {},
    Helpers: {},
    Templates: Handlebars.templates
    LoggedUser: {}
    CurrentView: null
    $: jQuery

    rootUrl: =>
        pathArray = location.href.split( '/' )
        protocol = pathArray[0]
        host = pathArray[2]
        url = protocol + '//' + host
        url = url + "/api/v1/"
        url

    getBaseUrl: () =>
        pathArray = location.href.split( '/' )
        protocol = pathArray[0]
        host = pathArray[2]
        url = protocol + '//' + host
        url

    templateFor: (path) ->
        HandlebarsTemplates[path]

    partialFor: (path) ->
        last = undefined
        parts = undefined
        parts = path.split('/')
        last = parts[parts.length - 1]

        if last.slice(0, 1) != '_'
            last = '_' + last
        path = parts.slice(0, parts.length - 1).concat([ last ]).join('/')
        if !Handlebars.partials[path]
            throw new Error('Missing partial: ' + path)
        Handlebars.partials[path]
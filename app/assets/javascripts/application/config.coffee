$(document).ajaxError (event, xhr) ->
    if xhr.status == 401
        if !location.origin
            location.origin = location.protocol + '//' + location.host

        window.location.href = location.origin + '/logout'
    return

$ ->
    Backbone.history.start pushState: true

    $(document).on 'click', 'a:not([data-action])', (e) ->
        e.preventDefault()
        e.stopPropagation()

        # This is important
        href = $(e.currentTarget).attr('href')

        router = new Backbone.Router
        router.navigate href, true

        return
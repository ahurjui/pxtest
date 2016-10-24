$(document).ajaxError (event, xhr) ->
    if xhr.status == 401
        window.location.href = 'logout'
    return

$ ->
    Backbone.history.start pushState: true

    $(document).on 'click', 'a:not([data-action])', (e) ->
        e.preventDefault()
        e.stopPropagation()

        # This is important
        href = $(e.currentTarget).attr('href')

        router = new Backbone.Router
        router.navigate href, true # <- this part will pass the path to your router

        return
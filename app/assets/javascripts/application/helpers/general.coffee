App = Fivehundred.Test

Handlebars.registerHelper 'enumeConstat', (enumPath) ->
    enumValue = eval(enumPath)
    enumValue

Handlebars.registerHelper 'debug', (value) ->
    console.log("Current Context", this)
    if (value)
        console.log("Value", value)
    console.log "++++++++++++++"

Handlebars.registerHelper 'consolelog', (value) ->
    console.log("consolelog", value)

# inline helper
Handlebars.registerHelper 'render_handlebars', (name, context) ->
    # we need the sub template compiled here
    # in order to be able to generate the top level template
    template =  App.Templates[name](context)
    template
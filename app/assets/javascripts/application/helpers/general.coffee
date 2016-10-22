App = Fivehundred.Test

Handlebars.registerHelper 'eachWithIndex', (array, options) ->
    buffer = for item, idx in array
        options.fn(_.extend(item, {
            _idx: idx,
            _first: (idx is 0),
            _last: (idx is array.length - 1)
        }))

    buffer.join('')

Handlebars.registerHelper 'ifEquals', (a, b, options) ->
    if a is b
        options.fn(this)
    else
        options.inverse(this)

Handlebars.registerHelper 'ifIntEquals', (a, b, options) ->
    if parseInt(a) is parseInt(b)
        options.fn(this)
    else
        options.inverse(this)

Handlebars.registerHelper 'ifLessThan', (a, b, options) ->
    if a < b
        options.fn(this)
    else
        options.inverse(this)

Handlebars.registerHelper 'ifMoreThan', (a, b, options) ->
    if a > b
        options.fn(this)
    else
        options.inverse(this)

Handlebars.registerHelper 'unlessEquals', (a, b, options) ->
    unless a is b
        options.fn(this)
    else
        options.inverse(this)

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
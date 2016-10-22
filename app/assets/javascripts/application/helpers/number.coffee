Mixins = Fivehundred.Test.Mixins

Handlebars.registerHelper 'currency', (str, options) ->
  number = parseFloat(str) / 100
  number = 0 if _.isNaN(number)
  if options and options.hash
    options = options.hash
  else
    options = {}

  _(options).defaults(displayCents: true)

  new Handlebars.SafeString(Util.Number.numberToCurrency(number, options))

Handlebars.registerHelper 'csvCleanCurrency', (str) ->
  number = parseFloat(str) / 100
  options = {displayCents: true, currency: "", commas: false, precision: 2}
  new Handlebars.SafeString(Util.Number.numberToCurrency(number, options))

Handlebars.registerHelper 'dollars', (str, options) ->
  number = parseFloat(str)
  if options and options.hash
    options = options.hash
  else
    options = {}

  _(options).defaults(displayCents: true)

  new Handlebars.SafeString(Util.Number.numberToCurrency(number, options))

Handlebars.registerHelper 'percentage', (str, options) ->
  number = parseFloat(str)
  if options and options.hash
    options = options.hash

  new Handlebars.SafeString(Util.Number.numberToPercentage(number, options))

Handlebars.registerHelper 'round', (str, options) ->
  number = parseFloat(str)

  options = options?.hash or {}
  precision = options.precision

  new Handlebars.SafeString(Util.Number.round(number, precision))

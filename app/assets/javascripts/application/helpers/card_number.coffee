Handlebars.registerHelper 'cardNumber', (last_four_digits, options) ->
  formatted = if last_four_digits
    '**** **** **** '+last_four_digits
  else
    ''

  new Handlebars.SafeString(formatted)


Handlebars.registerHelper 'formatDate', (date, format, options) ->
  if not options?
    options = format
    format = 'M/D/YYYY h:mm a'

  date = moment(date)
  formattedDate = date.format(format)

  new Handlebars.SafeString(formattedDate)


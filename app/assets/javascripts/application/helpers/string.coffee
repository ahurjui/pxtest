Mixins = Fivehundred.Test.Mixins

Handlebars.registerHelper 'capitalize', (str = '') ->
  new Handlebars.SafeString(Util.String.capitalize(str))

Handlebars.registerHelper 'titleize', (str = '') ->
  new Handlebars.SafeString(Util.String.titleize(str))

Handlebars.registerHelper 'humanize', (str = '') ->
  new Handlebars.SafeString(Util.String.humanize(str))

Handlebars.registerHelper 'trim', (str = '') ->
  new Handlebars.SafeString(Util.String.trim(str))

Handlebars.registerHelper 'truncate', (str = '', len, ellipsis = '&hellip;') ->
  unless _.isString(ellipsis)
    ellipsis = '&hellip;'
  new Handlebars.SafeString(Util.String.truncate(str, len, ellipsis))

Handlebars.registerHelper 'pluralize', (count, singular = '', plural, options) ->
  if count > 1 or count is 0
    unless _.isString(plural)
      plural = singular + 's'

    str = "#{count} #{plural}"
  else
    str = "#{count} #{singular}"

  new Handlebars.SafeString(str)


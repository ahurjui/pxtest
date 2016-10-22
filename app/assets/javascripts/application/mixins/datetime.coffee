App = Fivehundred.namespace("Test")
App.module "Mixins.Datetime",
  format: (date, format, options) ->
    format ||= 'M/D/YYYY h:mm a'
    date = moment(date)
    formattedDate = date.format(format)

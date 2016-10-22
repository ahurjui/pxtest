App = Fivehundred.namespace("Test")
App.module "Mixins.Number",
  numberToCurrency: (number, options) ->
    options = $.extend(
      currency: "$"
      displayCents: true
      precision: 2
      commas: true
    , options or {})
    number = Math.round(number * Math.pow(10, options.precision)) / Math.pow(10, options.precision)
    match = number.toString().match(/^-?(\d+)(\.\d+)?$/)
    return unless match
    zeroFill = ""
    i = 0

    while i < options.precision
      zeroFill += "0"
      i++
    cents = (if match[2] then ((if match[2].length <= 3 then (match[2] + zeroFill).substr(1, options.precision) else match[2].substr(1))) else zeroFill)
    if options.commas
      dollars = match[1].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
    else
      dollars = match[1]
    result = options.currency + dollars + ((if options.displayCents then ((if cents.match(/^\s*$/) then "" else "." + cents)) else ""))
    result = "-" + result  if number < 0
    result

  isPositiveNumber: (number) ->
    if isNaN(number) == true or number < 0
      return false
    return true

  numberToPercentage: (number, options) ->
    options = $.extend(
      precision: 2
    , options or {})
    number = Math.round(number * Math.pow(10, options.precision)) / Math.pow(10, options.precision)
    number + "%"

  round: (number, precision) ->
    precision = (if not precision? then 2 else precision)
    Math.round(number * Math.pow(10, precision)) / Math.pow(10, precision)


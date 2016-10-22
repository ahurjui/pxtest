App = Fivehundred.namespace('Test')

App.module 'Mixins.String',
    capitalize: (str = '') ->
        str = str.toString()
        str.charAt(0).toUpperCase() + str.substr(1).toLowerCase()

    titleize: (str = '') ->
        str = str.toString()
        str.replace(/[-_]+/g, ' ').replace(/\w*/g, App.Util.String.capitalize)

    camelize: (str = '') ->
        str = str.toString()
        str = App.Util.String.titleize(str).replace(/\s+/g, '')
        str.charAt(0).toLowerCase() + str.substr(1)

    classify: (str = '') ->
        str = str.toString()
        str = App.Util.String.camelize(str)
        str.charAt(0).toUpperCase() + str.substr(1)

    humanize: (str = '') ->
        str = str.toString()
        str.replace(/[_]+/g, ' ').replace(/\w*/g, App.Util.String.capitalize)

    lpad: (str = '', len, character) ->
        str = str.toString()
        character = character.toString()
        str = character + str while str.length < len
        str

    rpad: (str = '', len, character) ->
        str = str.toString()
        character = character.toString()
        str += character while str.length < len
        str

    zeropad: (str = '', len) ->
        App.Util.String.lpad(str.toString(), len, '0')

    truncate: (str = '', len, ellipsis = '&hellip;') ->
        if str.length > len
          str = str.substr(0, len) + ellipsis
        str

    removeHyphens: (str = '') ->
        str = str.toString()
        str.replace(/-/g, " ")

    trim: (str) ->
        return '' if str is null
        nativeTrim = String.prototype.trim
        if nativeTrim
          return nativeTrim.call(str)

        return String(str).replace(new RegExp('\^\\s+|\\s+\$', 'g'), '')

    ltrim: (str) ->
        str = str.replace(/^\s+/,"")
        str

    rtrim: (str) ->
        str = str.replace(/\s+$/,"")
        str

    humanizeCamelCase: (str) ->
        str = str.replace(/([A-Z]+)/g, " $1").replace(/([A-Z][a-z])/g, " $1")
        str = App.Util.String.ltrim(str)
        str = App.Util.String.rtrim(str)
        str



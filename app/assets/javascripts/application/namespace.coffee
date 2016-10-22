Fivehundred = Fivehundred || {}

Fivehundred.namespace = (ns, context) ->
  path = ns.split('.')
  parent = context || Fivehundred

  for part, i in path
    parent[part] = {} unless parent[part]?
    parent = parent[part]

  return parent

App = Fivehundred.namespace('Test')
_(App).extend
  module: (ns, obj) ->
    _(Fivehundred.namespace(ns, App)).extend(obj)

window.Fivehundred = Fivehundred
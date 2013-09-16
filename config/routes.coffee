exports.routes = (map) ->

     map.post  '/webid/new', 'application#generateId'

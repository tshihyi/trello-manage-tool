function auth => new Promise (resolve, reject) ->
  Trello.authorize do
    type: \redirect name: 'Project Progress'
    scope: read: \true
    expiration: \never
    success: resolve, error: reject

function load-cards board-id => new Promise (resolve, reject) ->
  options =
    fields: \name
    cards: \all
    card_fields: 'name,idList'
    lists: \all
    list_fields: 'name,pos'
  Trello.boards.get board-id, options, resolve, reject

export {auth, load-cards}

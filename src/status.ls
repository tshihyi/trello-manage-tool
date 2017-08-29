import
  \./link : {h, link}
  \./status-view : status-view

function status-state
  it.data

function status-props {lists={} cards={}}
  card-list = Object.values cards
  total = card-list.length
  count = [{}]concat card-list .reduce (count, {id-list}) ->
    Object.assign {} count, (id-list): (count[id-list] || 0) + 1
  items = Object.values lists .map ({id, name}) ->
    {name, count: count[id] || 0}
  ratio = items.slice -1 .0?count * 100 / total
  {items, total, progress-value: Math.round ratio || 0}

Status = link status-view, status-state, status-props

export default: Status

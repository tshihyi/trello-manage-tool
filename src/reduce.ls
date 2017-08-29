import
  redux: {combine-reducers}
  linking: {handle-actions}

function load-board state, payload
  Object.assign ...<[lists cards]>map ->
    (it): Object.assign ...payload[it]map (values) -> (values.id): values

update-data = \load-board : load-board

function compose-reduce
  handlers =
    data: handle-actions update-data
  combine-reducers handlers

export default: compose-reduce

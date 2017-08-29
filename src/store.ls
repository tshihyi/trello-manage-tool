import
  redux: {create-store}
  \./reduce : compose-reduce
  \./preload-state : preload-state
  \./trello : {auth, load-cards}

function initial-load
  auth!then -> load-cards \RBWNmBQu
  .then -> type: \load-board payload: it

function start
  enhancer = window.__REDUX_DEVTOOLS_EXTENSION__?!
  store = create-store compose-reduce!, preload-state!, enhancer
  if module.hot
    that.accept \./src/reduce.ls ->
      store.replace-reducer <| require \./reduce .default!
  initial-load!then store.dispatch .catch -> console.log it
  store

export default: start

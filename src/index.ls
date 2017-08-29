import
  \./link : {link, h, render}
  \./store : create-store
  \./main : main

function start
  navigator.service-worker?register \service-worker.js
  store = create-store!

  root = void
  container = document.query-selector \#root
  init = ->
    seed = link it
    app = h seed, {store}
    root := render app, container, root
  init main

  require \../style/index
  if module.hot
    require \preact/devtools
    that.accept \./src/main.jsx ->
      init <| require \./main .default

start!

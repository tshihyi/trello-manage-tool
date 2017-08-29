path = require \path
webpack = require \webpack
public-path = path.join __dirname, \www
using-dev-server = process.argv.slice 1 .join ' ' .includes \webpack-dev-server

base =
  entry: \./src/index.ls
  module:
    rules:
      * test: /\.(ls|jsx|js)$/
        exclude: /node_modules/
        use: loader: \babel-loader options: require \./.babelrc
      * test: /\.sass$/
        use: <[style-loader css-loader sass-loader]>
  resolve: extensions: [\.ls \.jsx \.js \.sass]

extra = if using-dev-server
  devtool: \cheap-module-eval-source-map
  plugins:
    new webpack.NamedModulesPlugin
    new webpack.HotModuleReplacementPlugin
  dev-server:
    content-base: public-path
    hot: true
else
  MinifyPlugin = require \babel-minify-webpack-plugin
  WorkboxPlugin = require \workbox-webpack-plugin
  output:
    path: public-path
    filename: \bundle.js
  plugins:
    new MinifyPlugin
    new WorkboxPlugin options =
      glob-directory: public-path
      glob-patterns: ['**/*.{html,js,css}']
      sw-dest: "#public-path/sw.js"

export Object.assign {} base, extra

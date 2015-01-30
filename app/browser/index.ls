require! app
require! path
require! watch
BrowserWindow = require 'browser-window'

require('crash-reporter').start()

mainWindow = null

app.on 'window-all-closed', ->
  app.quit() if process.platform != 'darwin'

app.on 'ready', ->
  windowConfig =
    width: 320
    height: 600
    frame: false
    resizable: false
    show: false
    'dark-theme': true
    icon: path.resolve(__dirname, '../client/img/icon.png')
  mainWindow = new BrowserWindow windowConfig
  mainWindow.loadUrl 'file://' + path.resolve __dirname, '../client/index.html'
  mainWindow.on 'close', ->
    mainWindow = null

  watch.watchTree do
    path.resolve __dirname, '../client'
    ignoreDotFiles: true
    ignoreUnreadableDir: true
    -> mainWindow.reload()


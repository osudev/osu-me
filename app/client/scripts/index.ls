require! fs
require! nib
require! path
require! stylus
require! remote

global.thisWindow = remote.getCurrentWindow()
thisWindow.setMinimumSize 250, 450

$ = require 'jquery'
React = require 'react'

require! './login-view'

do
  sourcePath = path.resolve __dirname, '../styles/index.styl'
  textContent = stylus fs.readFileSync sourcePath, 'utf8'
  .set 'filename', sourcePath
  .use nib()
  .render()
  styleElement = document.createElement 'style'
  styleElement.{sourcePath, textContent} = {sourcePath, textContent}
  document.head.appendChild styleElement

$ do
  React.render do
    React.createElement loginView
    document.body
  thisWindow.show() unless thisWindow.isVisible()

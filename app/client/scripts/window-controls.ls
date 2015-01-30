React = require 'react'
{section, button} = require 'reactively'

WindowControlButton = React.createClass do
  displayName: 'WindowControlButton'

  render: ->
    button do
      className: 'window-control-button window-control-' + @props.tag
      onClick: @props.action

module.exports = do
  WindowControls = React.createClass do
    displayName: 'WindowControls'

    closeWindow: -> do thisWindow.close
    minimizeWindow: -> do thisWindow.minimize
    openDevWindow: -> do thisWindow.openDevTools

    render: ->
      section do
        className: 'window-control-box'
        React.createElement do
          WindowControlButton
          tag: 'dev'
          action: @openDevWindow
        React.createElement do
          WindowControlButton
          tag: 'minimize'
          action: @minimizeWindow
        React.createElement do
          WindowControlButton
          tag: 'close'
          action: @closeWindow

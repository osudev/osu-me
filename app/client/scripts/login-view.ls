React = require 'react'
{div, section, form, span, input, button} = require 'reactively'

require! './window-controls'

IconTextBox = React.createClass do
  displayName: 'IconTextBox'

  componentDidMount: ->
    @refs.input.getDOMNode().focus() if @props.autoFocus

  render: ->
    span do
      className: 'input-icon fa fa-' + @props.icon
      input do
        className: 'input-' + @props.tag
        ref: 'input'
        type: if @props.password? then 'password' else 'text'
        placeholder: @props.placeholder

LoginForm = React.createClass do
  displayName: 'LoginForm'

  render: ->
    form do
      className: 'login-form'
      div do
        className: 'control-group'
        div className: 'avatar'
      div do
        className: 'control-group'
        React.createElement do
          IconTextBox
          icon: 'user'
          tag: 'username'
          placeholder: 'Username'
          autoFocus: true
        React.createElement do
          IconTextBox
          icon: 'lock'
          tag: 'password'
          password: true
          placeholder: 'Password'
      div do
        className: 'control-group'
        button do
          className: 'btn btn-blue'
          type: 'submit'
          'Login'

module.exports = do
  LoginView = React.createClass do
    displayName: 'LoginView'

    render: ->
      div do
        className: 'app'
        React.createElement windowControls
        section do
          className: 'login'
          React.createElement LoginForm

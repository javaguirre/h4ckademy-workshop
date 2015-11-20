{div, input, label} = React.DOM

ChatInput = React.createClass
  render: ->
    div
      className: 'form-group',
      label(className: 'control-label col-sm-2', 'Message')
      div(
        className: 'col-sm-8',
        input(type: 'text', className: 'form-control', ref: 'message')
      )
      div(
        className: 'col-sm-2',
        input(
          type: 'button',
          className: 'btn',
          value: 'send',
          id: 'send',
          onClick: @sendMessage
        )
      )

  sendMessage: ->
    message = @refs.message.value
    @props.onSendMessage(message)

module.exports = ChatInput

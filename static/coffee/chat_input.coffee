{div, input} = React.DOM

ChatInput = React.createClass
  render: ->
    div
      className: 'row',
      input(type: 'text', ref: 'message')
      input(
        type: 'button',
        className: 'btn',
        value: 'send',
        id: 'send',
        onClick: @sendMessage
      )

  sendMessage: ->
    # TODO Emit send message event
    message = @refs.message.value
    @props.onSendMessage(message)

module.exports = ChatInput

ChatInput = require('./chat_input')
ChatList = require('./chat_list')

{div} = React.DOM

ChatBox = React.createClass
  displayName: 'ChatBox'

  getInitialState: ->
    {messages: []}

  onHandleSendMessage: (message) ->
    updated_messages = @state.messages
    updated_messages.push message
    @setState(messages: updated_messages)

  render: ->
    div null,
      React.DOM.h4(key: 'header', 'chat')
      React.createElement(ChatList, messages: @state.messages)
      React.createElement(ChatInput, onSendMessage: @onHandleSendMessage)

module.exports = ChatBox

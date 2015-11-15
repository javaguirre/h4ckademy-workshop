ChatInput = require('./chat_input')
ChatList = require('./chat_list')
ChatConnection = require('./chat_connection')

{div} = React.DOM

ChatBox = React.createClass
  displayName: 'ChatBox'

  getInitialState: ->
    {
      messages: [],
      connection: null
    }

  componentDidMount: ->
    URL = 'ws://localhost:3000/ws';
    @setState({connection: new ChatConnection(URL)})

  onHandleSendMessage: (message) ->
    updated_messages = @state.messages
    updated_messages.push message
    @setState(messages: updated_messages)
    @state.connection.send(message)

  render: ->
    div null,
      React.DOM.h4(key: 'header', 'chat')
      React.createElement(ChatList, messages: @state.messages)
      React.createElement(ChatInput, onSendMessage: @onHandleSendMessage)

module.exports = ChatBox

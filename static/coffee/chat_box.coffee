ChatInput = require('./chat_input')
ChatList = require('./chat_list')
ChatConnection = require('./chat_connection')

{div} = React.DOM

ChatBox = React.createClass
  displayName: 'ChatBox'

  getInitialState: ->
    messages: [],
    author: 'anonymous',
    connection: null

  componentDidMount: ->
    URL = 'ws://localhost:3000/ws';
    @setState(connection: new ChatConnection(URL))

  onHandleSendMessage: (message) ->
    new_message = @getMessage(message)
    @state.messages.push new_message
    @setState(messages: @state.messages)
    @state.connection.send(new_message)

  getMessage: (message) ->
      author: @state.author
      text: message

  render: ->
    div null,
      React.DOM.h4(key: 'header', 'chat')
      React.createElement(ChatList, messages: @state.messages)
      React.createElement(ChatInput, onSendMessage: @onHandleSendMessage)

module.exports = ChatBox

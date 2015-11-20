ChatInputAuthor = require('./chat_input_author')
ChatInput = require('./chat_input')
ChatList = require('./chat_list')
ChatConnection = require('./chat_connection')

{div, form} = React.DOM

URL = 'ws://localhost:3000/ws'

ChatBox = React.createClass
  displayName: 'ChatBox'

  getInitialState: ->
    messages: [],
    author: 'anonymous',
    connection: null

  componentDidMount: ->
    @setState(connection: new ChatConnection(URL))

  onHandleSendMessage: (message) ->
    new_message = @getMessage(message)
    @state.messages.push new_message
    @setState(messages: @state.messages)
    @state.connection.send(JSON.stringify(new_message))

  onHandleSetAuthor: (author) ->
    @setState(author: author)

  getMessage: (message) ->
      author: @state.author
      text: message

  render: ->
    div null,
      React.DOM.h4(key: 'header', 'chat')
      form(
        className: "form-horizontal",
        React.createElement(ChatInputAuthor, onSetAuthor: @onHandleSetAuthor)
        React.createElement(ChatList, messages: @state.messages)
        React.createElement(ChatInput, onSendMessage: @onHandleSendMessage)
      )

module.exports = ChatBox

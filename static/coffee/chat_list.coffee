ChatItem = require('./chat_item')

{div} = React.DOM

ChatList = React.createClass
  getChatItem: (message) ->
    React.createElement(
      ChatItem,
      message: message.text,
      author: message.author,
      key: Math.random()
    )

  loadMessages: ->
    messages = @props.messages.map (message) =>
      @getChatItem(message)

    messages

  render: ->
    messages = @loadMessages()

    div
      className: '',
      messages

module.exports = ChatList

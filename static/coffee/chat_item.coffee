{div, span} = React.DOM

ChatItem = React.createClass
  render: ->
    div
      className: 'row',
      span(null, @props.author.concat(': '))
      span(null, @props.message)

module.exports = ChatItem

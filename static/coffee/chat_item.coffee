{div, span} = React.DOM

ChatItem = React.createClass
  render: ->
    div(
      className: 'row',
      div(
        className: 'col-md-offset-2 col-md-8'
        span(null, @props.author.concat(': '))
        span(null, @props.message)
      )
    )

module.exports = ChatItem

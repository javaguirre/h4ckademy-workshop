{div, input, span, select, option, label} = React.DOM

ChatInputAuthor = React.createClass
  getInitialState: ->
    author: null
    authorColor: null
    colors:
      turquoise: '#1cc9a8'
      emerald: '#2fcc72'
      peter_river: '#379adb'
      wisteria: '#8e44ad'
      alizarin: '#e74c3c'
      midnight: '#2c3e50'
      pumpkin: '#d35400'
      sunflower: '#f1c40f'
      asbestos: '#7f8c8d'

  getOptions: ->
    options = []

    for name, color of @state.colors
      options.push option(
        'data-background': color,
        key: Math.random(),
        name
      )

    options

  render: ->
    options = @getOptions()
    authorLabel = div(
      className: 'form-group',
      label(className: 'control-label col-sm-2', 'Author')
      span(null, 'author: '.concat(@state.author))
    )

    authorInput = div(
      null,
      div(
        className: 'form-group',
        label(className: 'control-label col-sm-2', 'Color')
        div(
          className: 'col-sm-10',
          select(className: 'form-control', ref: 'color', onChange: @changeColor, options)
        )
      )
      div(
        className: 'form-group',
        label(className: 'control-label col-sm-2', 'Author')
        div(
          className: 'col-sm-8',
          input(className: 'form-control', type: 'text', ref: 'author')
        )
        div(
          className: 'col-sm-2',
          input(
            type: 'button',
            className: 'btn',
            value: 'ok',
            onClick: @setAuthor
          )
        )
      )
    )

    div(
      null,
      if @state.author then authorLabel else authorInput
    )

  changeColor: (e) ->
    backgroundColor = @state.colors[e.target.value]
    $(@refs.color).css('background-color', backgroundColor)
    @setState(authorColor: e.target.value)

  setAuthor: ->
    author = @refs.author.value
    @setState(author: author)
    @props.onSetAuthor(author)

module.exports = ChatInputAuthor

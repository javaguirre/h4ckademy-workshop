module.exports =
  class ChatConnection
    constructor: (url) ->
      @client = new WebSocket(url)

    send: (data) ->
      @client.send data

    onmessage: (data) ->
      # TODO Emit message received
      console.log data

      return data

    onopen: ->
      console.log "open"

    onclose: ->
      console.log "close"

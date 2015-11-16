module.exports =
  class ChatConnection
    CLOSED_STATES = [WebSocket.CLOSED, WebSocket.CLOSING]
    REOPEN_TIMEOUT = 5000

    constructor: (url) ->
      @url = url
      @initWebsocket()

    initWebsocket: ->
      @client = new WebSocket(@url)
      @client.onopen = @onopen
      @client.onclose = @onclose
      @client.onmessage = @onmessage

    send: (data) =>
      @client.send data

    onmessage: (data) =>
      # TODO Emit message received
      console.log data

      return data

    onopen: =>
      console.log "open"

    onclose: =>
      setTimeout @initWebsocket(), @REOPEN_TIMEOUT

    isClosed: ->
      @CLOSED_STATES.indexOf(@client.readyState) != -1

    isOpen: ->
      @client.readyState == WebSocket.OPEN

package main

import (
	"log"
	"net/http"

	"github.com/asaskevich/EventBus"
	"github.com/gorilla/websocket"
	"github.com/javaguirre/h4ckademy-workshop/app/lib"
)

const DEVICE_ID_HEADER string = "X-DEVICE-ID"

var websocketUpgrader = websocket.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
}

func websocketHandler(writer http.ResponseWriter, request *http.Request, bus *EventBus.EventBus) {
	connection, err := websocketUpgrader.Upgrade(writer, request, nil)
	if err != nil {
		log.Fatal("Failed to get websocket upgrade")
		return
	}

	for {
		typeMessage, message, err := connection.ReadMessage()
		bus.Publish(lib.NEW_MESSAGE_EVENT, string(message[:]))

		device_header := request.Header[DEVICE_ID_HEADER]

		if len(device_header) > 0 && device_header[0] != "" {
			bus.Publish(lib.NEW_DEVICE_EVENT, device_header[0])
		}

		if err != nil {
			log.Fatal(err)
			break
		}

		connection.WriteMessage(typeMessage, message)
	}
}

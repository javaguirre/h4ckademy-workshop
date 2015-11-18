package main

import (
	"log"
	"net/http"

	"github.com/asaskevich/EventBus"
	"github.com/gorilla/websocket"
	"github.com/javaguirre/h4ckademy-workshop/app/lib"
)

var websocketUpgrader = websocket.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
}

func websocketHandler(w http.ResponseWriter, r *http.Request, bus *EventBus.EventBus) {
	log.Println(lib.NEW_MESSAGE_EVENT)

	conn, err := websocketUpgrader.Upgrade(w, r, nil)
	if err != nil {
		log.Fatal("Failed to get websocket upgrade")
		return
	}

	for {
		t, msg, err := conn.ReadMessage()
		bus.Publish(lib.NEW_MESSAGE_EVENT, string(msg[:]))

		if err != nil {
			log.Fatal(err)
			break
		}

		conn.WriteMessage(t, msg)
	}
}

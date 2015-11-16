package main

import (
	"log"
	"net/http"

	"github.com/asaskevich/EventBus"
	"github.com/gorilla/websocket"
	"github.com/javaguirre/h4ckademy-workshop/app/lib"
)

var wsupgrader = websocket.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
}

func wshandler(w http.ResponseWriter, r *http.Request, bus *EventBus.EventBus) {
	log.Println(lib.NEW_MESSAGE_EVENT)

	conn, err := wsupgrader.Upgrade(w, r, nil)
	if err != nil {
		log.Fatal("Failed to get websocket upgrade")
		return
	}

	for {
		t, msg, err := conn.ReadMessage()
		bus.Publish(lib.NEW_MESSAGE_EVENT, string(msg[:]))

		if err != nil {
			break
		}

		conn.WriteMessage(t, msg)
	}
}

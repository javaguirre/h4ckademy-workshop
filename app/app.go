package main

import (
	"log"

	"github.com/asaskevich/EventBus"
	"github.com/javaguirre/h4ckademy-workshop/app/lib"
)

// TODO Move listeners to a different file
func newMessage(msg string) {
	log.Println("new websocket message")
	log.Println(msg)
}

func main() {

	// TODO init listeners
	bus := EventBus.New()
	bus.Subscribe(lib.NEW_MESSAGE_EVENT, newMessage)

	engine := initEngine(bus)
	engine.Run(":3001")
}

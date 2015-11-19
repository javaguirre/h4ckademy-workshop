package main

import (
	"log"

	"github.com/asaskevich/EventBus"
	"github.com/javaguirre/h4ckademy-workshop/app/lib"
)

func newMessage(msg string) {
	log.Println("new websocket message")
	log.Println(msg)
}

func initBus() (bus *EventBus.EventBus) {
	bus = EventBus.New()
	bus.Subscribe(lib.NEW_MESSAGE_EVENT, newMessage)

	return
}

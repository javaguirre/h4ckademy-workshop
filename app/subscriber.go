package main

import (
	"log"

	"github.com/asaskevich/EventBus"
	"github.com/javaguirre/h4ckademy-workshop/app/lib"
)

func persistMessage(message string) {
	service := lib.NewPersistService()
	service.Save(message)
}

func countMessage(message string) {
	service := lib.NewAnalyticsService()
	service.Update(message)
}

func logMessage(message string) {
	log.Println("new websocket message")
	log.Println(message)
}

func logNewDevice(device string) {
	log.Println("new device arrived")
	log.Println(device)
}

func initBus() (bus *EventBus.EventBus) {
	bus = EventBus.New()
	bus.Subscribe(lib.NEW_MESSAGE_EVENT, persistMessage)
	bus.Subscribe(lib.NEW_MESSAGE_EVENT, countMessage)
	bus.Subscribe(lib.NEW_MESSAGE_EVENT, logMessage)
	bus.Subscribe(lib.NEW_DEVICE_EVENT, logNewDevice)

	return
}

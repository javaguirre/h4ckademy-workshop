package lib

import (
	"bytes"
	"encoding/json"
	"net/http"

	"gopkg.in/redis.v3"
)

// DB key where messages will be persisted
const chatHistoryKey string = "chat_history"

type Persistence interface {
	Save(message string)
}

type Analytics interface {
	Update(message string)
}

type PersistService struct {
	databaseName int64
}

type AnalyticsService struct {
	widgetEndpoint string
}

func NewPersistService(databaseName int64) *PersistService {
	return &PersistService{databaseName}
}

func (service *PersistService) Save(message string) {
	client := redis.NewClient(&redis.Options{
		Addr:     "localhost:6379",
		Password: "",
		DB:       service.databaseName,
	})
	client.LPush(chatHistoryKey, message)
}

func NewAnalyticsService(widgetEndpoint string) *AnalyticsService {
	return &AnalyticsService{widgetEndpoint}
}

func (service *AnalyticsService) Update(message string) {
	var newMessage map[string]string
	json.Unmarshal([]byte(message), &newMessage)
	// TODO
	data := []byte("")

	http.NewRequest("POST", service.widgetEndpoint, bytes.NewBuffer(data))
}

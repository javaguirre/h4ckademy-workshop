package main

import (
	"net/http"

	"github.com/asaskevich/EventBus"
	"github.com/gin-gonic/gin"
)

func initEngine(bus *EventBus.EventBus) (engine *gin.Engine) {
	engine = gin.Default()
	engine.LoadHTMLGlob("./templates/*")
	engine.Static("/public", "../public")

	engine.GET("/", func(context *gin.Context) {
		context.HTML(http.StatusOK, "index.html", gin.H{})
	})

	engine.GET("/ws", func(context *gin.Context) {
		wshandler(context.Writer, context.Request, bus)
	})

	return
}

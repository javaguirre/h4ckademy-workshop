package main

func main() {
	bus := initBus()
	engine := initEngine(bus)
	engine.Run(":3001")
}

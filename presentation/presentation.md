class: center, middle, inverse

# Event-driven H4ckademy

#### Javier Aguirre [@javaguirre](https://javaguirre.net)

---

class: inverse

# Who am I?

![Who Am I](./images/caterpillar.jpg)

---

class: inverse

# Event-driven architecture (EDA)

- Tiempo real, consumir lo + rápido al producir el evento
- Flujo de datos unidireccional (más fácil de controlar)
- Desarrollo sistema desacoplado
- Fácil de escalar
- Distribuido
- Puede agregar complejidad si no hay buena organización

---

class: inverse

![EDA](./images/eda.jpg)

---

class: inverse

# Service oriented architecture (SOA)

- Encapsular funcionalidad
- Independientes de lógica de otras partes de la aplicación
- Servicios que se suscriben a eventos
- Aislamiento de servicios, fácil de eliminar/refactorizar si bien definido
- Fácil de testear

---

class: inverse

![EDA](./images/eda-soa.jpg)


---

class: inverse

# Armas

- Git
- Vagrant
- Ansible
- Go
- Gulp
- Coffeescript
- ReactJS
- Websocket

---

class: inverse

# Git

```bash
git clone https://github.com/javaguirre/h4ckademy-workshop.git
```

---

class: inverse

# Entorno de desarrollo

## Dependencias

Virtualbox

```bash
sudo apt-get install virtualbox
```

[Vagrant](https://www.vagrantup.com/)

```bash
sudo apt-get install vagrant
```

[Ansible](http://www.ansible.com/)

```bash
sudo apt-get install ansible
```

---

class: inverse

# Entorno de desarrollo

## Instalación

```bash
cd h4ckademy-workshop
ansible-galaxy install (--ignore-errors) -r requirements.yml
vagrant up
```

---

class: inverse

# Entorno desarrollo

## Autocompletado Go y linter

```bash
cd h4ckademy-workshop
ansible-playbook -c local -i host \
  --tags godeps, goinstall ansible/site.yml -vv
```

---

class: inverse

# Entorno de desarrollo

## Lanzar servidor

```bash
vagrant ssh
cd hack/app
gin r app.go
```

## Lanzar compilación de archivos estáticos

```bash
vagrant ssh
cd hack
gulp
```

---

class: inverse

# Backend

[Gin framework](https://github.com/gin-gonic/gin)

```go
import (
	"log"
	"github.com/gin-gonic/gin"
)

func main() {
	engine = gin.Default()
	engine.LoadHTMLGlob("./templates/*")
	engine.Static("/public", "../public")

	engine.GET("/", func(context *gin.Context) {
		context.HTML(http.StatusOK, "index.html", gin.H{})
	})

	engine.GET("/ws", func(context *gin.Context) {
		websocketHandler(context.Writer, context.Request)
	})

	engine.Run(":3001")
}
```

---

class: inverse

# Frontend

## Coffeescript

```coffeescript
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
```

---

class: inverse

# Frontend

## React

```coffeescript
ChatBox = React.createClass
  displayName: 'ChatBox'

  getInitialState: ->
    {
      messages: [],
      connection: null
    }

  componentDidMount: ->
    URL = 'ws://localhost:3000/ws';
    @setState({connection: new ChatConnection(URL)})

  render: ->
    div null,
      React.DOM.h4(key: 'header', 'chat')
      React.createElement(ChatList, messages: @state.messages)
      React.createElement(ChatInput, onSendMessage: @onHandleSendMessage)
```

---

class: inverse

# Frontend

## Browserify

```coffeescript
ChatInput = require('./chat_input')
ChatList = require('./chat_list')
ChatConnection = require('./chat_connection')
```

---

class: inverse

# Frontend

## Gulp

```javascript
gulp.task('styles', function() {
  gulp.src(STYLES_STATIC_PATH)
    .pipe(debug({title: 'styles:'}))
    .pipe(concat('style.css'))
    .pipe(gulp.dest(PUBLIC_CSS_STATIC_PATH));
});

gulp.task('watch', function() {
  livereload.listen(35729);
  gulp.watch(COFFEE_STATIC_PATH, ['scripts']);
  gulp.watch(STYLES_STATIC_PATH, ['styles']);
});

gulp.task('default', ['scripts', 'styles', 'watch']);
```

---

class: center, inverse

# Let's do this!

![Do It!](./images/x-wing-2.0.gif)

---

class: inverse

# TODO

- Definir mejor las estructuras de datos para Persistencia, Analytics
- Definir configuración de la aplicación
- Validación de campos en React
- El bloque de enviar mensaje debería salir únicamente una vez introducido el nombre
- Dejar funcionando Cyfe, enviar mensaje por autor

---

class: inverse, center, middle

# Gracias

#### Javier Aguirre [@javaguirre](https://javaguirre.net)
#### [Github](https://github.com/javaguirre) | [Twitter](https://twitter.com/javaguirre) | [Blog](https://javaguirre.net)

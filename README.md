# ribagin

A Simple golang http framework.


# Example



```go
package main

import (
	"github.com/riba2534/ribagin"
	"net/http"
)

func main() {
	r := ribagin.New()
	r.GET("/", func(c *ribagin.Context) {
		c.HTML(http.StatusOK, "<h1>Hello ribagin</h1>")
	})
	r.GET("/hello", func(c *ribagin.Context) {
		// expect /hello?name=riba2534
		c.String(http.StatusOK, "hello %s, you're at %s\n", c.Query("name"), c.Path)
	})

	r.POST("/login", func(c *ribagin.Context) {
		c.JSON(http.StatusOK, ribagin.H{
			"username": c.PostForm("username"),
			"password": c.PostForm("password"),
		})
	})

	r.Run(":9999")
}
```

run:

```
go run main.go
```


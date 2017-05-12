package main

import (
  "log"
//  "net/http"

  "github.com/chromatixau/gocore"
)

func main() {
  core := gocore.NewCore()

  core.HandleRender()

  /*
    Register plugins that have routes here
  */

  /*
    Use the following template to add more routes here
    core.Mux.HandleFunc( "/", func( w http.ResponseWriter, req *http.Request ) {
      your logic
    })
  */

  /*
    Bind plugin middleware here for ones before core
  */
  core.BindMiddleware()
  /*
    Bind plugin middleware here for ones after core
  */

  log.Fatal( core.StartServer() )
}

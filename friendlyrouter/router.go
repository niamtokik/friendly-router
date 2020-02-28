package friendlyrouter

import (
	"fmt"
	"net/http"
)

func index(write http.ResponseWriter, request *http.Request) {
	fmt.Fprintf(write, "index")
}

func ping(write http.ResponseWriter, request *http.Request) {
	fmt.Fprintf(write, "pong")
}

func Route(mux *http.ServeMux) {
	files := http.FileServer(http.Dir("/public"))
	mux.Handle("/static", http.StripPrefix("/static/", files))
	mux.HandleFunc("/", index)
	mux.HandleFunc("/ping", ping)
}


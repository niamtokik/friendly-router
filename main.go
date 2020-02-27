package main

import (
	"fmt"
	"net/http"
	// "html/template"
	"github.com/niamtokik/friendly-router/router"
	// "github.com/aws/aws-sdk-go/service/dynamodb" 
)

func index(write http.ResponseWriter, request *http.Request) {
	fmt.Fprintf(write, "index")
}

func ping(write http.ResponseWriter, request *http.Request) {
	fmt.Fprintf(write, "pong")
}

func route(mux *http.ServeMux) {
	files := http.FileServer(http.Dir("/public"))
	mux.Handle("/static", http.StripPrefix("/static/", files))
	mux.HandleFunc("/", index)
	mux.HandleFunc("/ping", ping)
}

func main() {
	mux := http.NewServeMux()
	route(mux)
	server := &http.Server{
		Addr: "0.0.0.0:8080",
		Handler: mux,
	}
	server.ListenAndServe()
}

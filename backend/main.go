package main

import (
	"net/http"

	"github.com/gorilla/mux"
)

func Handler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello world :)"))
}

func main() {
	mux := mux.NewRouter()

	mux.HandleFunc("/", Handler).Methods("GET")
	http.ListenAndServe(":7777", mux)
}

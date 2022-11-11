package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

var db *sql.DB

func Handler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello world :)"))
}

func main() {
	db, err := sql.Open("mysql", "dbuser:qweasd@tcp(localhost:3306)/restaurant")
	if err != nil {
		log.Fatal(err)
		return
	}
	fmt.Println("MySQL connection succesful")
	defer db.Close()
	mux := mux.NewRouter()

	mux.HandleFunc("/", Handler).Methods("GET")
	http.ListenAndServe(":7777", mux)
}

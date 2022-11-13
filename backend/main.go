package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
)

func SendResponse(w http.ResponseWriter, i any, wrapper ...string) {
	data, err := json.Marshal(i)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	if len(wrapper) > 0 {
		data = append([]byte("{\""+wrapper[0]+"\":"), data...)
		data = append(data, []byte("}")...)
	}
	w.Header().Set("Content-Type", "application/json")
	w.Write(data)
}

var db *sql.DB

func main() {
	var err error
	db, err = sql.Open("mysql", "root:@tcp(localhost:3306)/restaurant")

	if err != nil {
		log.Fatal(err)
		return
	}

	fmt.Println("MySQL connection succesful")
	defer db.Close()
	mux := mux.NewRouter()

	header := handlers.AllowedHeaders([]string{"X-Requested-With", "Content-Type", "Authorization", "X-Content-Type-Options"})
	methods := handlers.AllowedMethods([]string{"GET"})
	origins := handlers.AllowedOrigins([]string{"*"})

	mux.HandleFunc("/meals", Controller_Meal).Methods("GET")
	mux.HandleFunc("/drinks", Controller_Drink).Methods("GET")
	mux.PathPrefix("/images/").Handler(http.StripPrefix("/images/", http.FileServer(http.Dir("../images/")))) //The HTML file in the images directory is a dirty fix to not display a directory listing, instead send an empty html.
	http.ListenAndServe(":7777", handlers.CORS(header, methods, origins)(mux))
}

package main

import (
	"fmt"
	"log"
	"net/http"
	"time"
)

func main() {

	http.HandleFunc("/delay", func(w http.ResponseWriter, r *http.Request) {
		time.Sleep(90 * time.Second)
		w.Write([]byte("The application responds after 90 seconds"))

	})
	fmt.Println("start server on port 3333")
	log.Fatal(http.ListenAndServe(":3333", nil))
}

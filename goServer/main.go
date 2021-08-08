package main

import (
	"fmt"
	"github.com/farzad80rad/ghanari/goServer/db"
	"github.com/farzad80rad/ghanari/goServer/handlers"
	"github.com/joho/godotenv"
	"log"
	"os"
)

func main() {
	err := godotenv.Load(".env")
	if err != nil{
		fmt.Println(err)
	}
	db.InitDB(os.Getenv("DB_USER"), os.Getenv("DB_PASS"), "ghanari")
	handlers.InitApp()
	log.Fatal(handlers.Start())
}

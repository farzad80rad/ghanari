package db

import (
	"database/sql"
	"time"

	_ "github.com/go-sql-driver/mysql"
)

var SqlDB *DB

type DB struct {
	db *sql.DB
}

func InitDB(user, password, dbName string) {
	var err error
	db, _:= sql.Open("mysql", user+":"+password+"@/"+dbName)
	SqlDB = &DB{db}
	err = SqlDB.db.Ping()
	state := err != nil
	if state {
		panic(err)
	}
	SqlDB.db.SetConnMaxLifetime(time.Minute * 60)
}

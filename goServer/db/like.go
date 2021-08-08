package db

import (
	"errors"
	"math"
)

const (
	like           = `call like_voice(?)`
	getLikers      = `call userlist_of_liked(?)`
	getLikersCount = `call get_count_like_on_voice(?)`
)

func (db *DB) Like(a Ava) error {
	var err error
	res, err := db.db.Exec(like, a.ID)
	state := err != nil
	if state {
		return err
	}
	rows, err := res.RowsAffected()
	state = rows <= 0
	if state {
		return errors.New("Ava not found")
	}
	state = err != nil
	if state {
		return err
	}
	return nil
}

func (db *DB) GetLikers(a Ava) ([]User, error) {
	var err error
	rows, err := db.db.Query(getLikers, a.ID)
	state := err != nil
	if state {
		return nil, err
	}
	likers := make([]User, 0)
	for rows.Next() {
		var curr User
		err = rows.Scan(&curr.ID, &curr.Username)
		state = err != nil
		if state {
			return nil, err
		}
		likers = append(likers, curr)
	}
	rows.Close()
	return likers, nil
}

func (db *DB) GetLikesCount(a Ava) (int, error) {
	var err error
	rows, err := db.db.Query(getLikersCount, a.ID)
	state := err!=nil
	if state {
		return math.MinInt32, err
	}
	var count int
	for rows.Next() {
		err = rows.Scan(&count)
		state = err!=nil
		if state {
			return math.MinInt32, err
		}
	}
	return count, nil
}

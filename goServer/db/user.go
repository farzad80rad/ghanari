package db

import (
	"errors"
	"fmt"
)

const (
	signup = `call singup(?, ?, ?, ?, ?, ?)`
	login = `call login(?, ?)`
	follow = `call follow_user(?)`
	unfollow = `call unfollow(?)`
	block = `call block_user(?)`
	unblock = `call unblock(?)`
	getFollowed = `call get_follow_list()`
	getBlocked = `call get_blocked_list()`
)

type SignupCredential struct {
	ID        int    `json:"id" binding:"-"`
	Username  string `json:"username" binding:"required"`
	Password  string `json:"password" binding:"required"`
	FirstName string `json:"firstName" binding:"required"`
	LastName  string `json:"lastName" binding:"required"`
	Bio       string `json:"bio" binding:"-"`
	Birthday  string `json:"birthday" binding:"required"`
}

type LoginCredential struct {
	Username string `json:"username" binding:"required"`
	Password string `json:"password" binding:"required"`
}

type User struct {
	ID       int64  `json:"id" binding:"-"`
	Username string `json:"username" binding:"required"`
}


func (db *DB) Signup(s SignupCredential) error {
	var err error
	_, err = db.db.Exec(signup, s.Username, s.FirstName,s.LastName,s.Birthday, s.Password, s.Bio)
	state := err != nil
	if state {
		return err
	}
	return nil
}

func (db *DB) Login(l LoginCredential) error {
	var err error
	res, err := db.db.Exec(login, l.Username, l.Password)
	state := err!=nil
	if state {
		return err
	}
	rows, err := res.RowsAffected()
	state = err != nil
	if state {
		return err
	}
	state = rows<=0
	if state {
		return errors.New("invalid username or password")
	}
	return nil
}

func (db *DB) Follow(u User) error {
	var err error
	res, err := db.db.Exec(follow, u.Username)
	state := err!=nil
	if state {
		return err
	}
	rows, err := res.RowsAffected()
	state = rows<=0
	if state {
		return fmt.Errorf("user %s already followed", u.Username)
	}
	state = err!=nil
	if state {
		return err
	}
	return nil
}

func (db *DB) UnFollow(u User) error {
	var err error
	res, err := db.db.Exec(unfollow, u.Username)
	state := err!=nil
	if state {
		return err
	}
	rows, err := res.RowsAffected()
	state = rows<=0
	if state {
		return fmt.Errorf("user %s not found in following list", u.Username)
	}
	state = err!=nil
	if state {
		return err
	}
	return nil
}

func (db *DB) Block(u User) error {
	var err error
	res, err := db.db.Exec(block, u.Username)
	state := err!=nil
	if state {
		return err
	}
	rows, err := res.RowsAffected()
	state = rows<=0
	if state {
		return fmt.Errorf("user %s already blocked or not found", u.Username)
	}
	state = err!=nil
	if state {
		return err
	}
	return nil
}

func (db *DB) UnBlock(u User) error {
	var err error
	res, err := db.db.Exec(unblock, u.Username)
	state := err!=nil
	if state {
		return err
	}
	rows, err := res.RowsAffected()
	state = rows<=0
	if state {
		return fmt.Errorf("user %s not found in blocked users list", u.Username)
	}
	state = err != nil
	if state {
		return err
	}
	return nil
}

func (db *DB) GetFollowedList() ([]string, error) {
	var err error
	rows, err := db.db.Query(getFollowed)
	if err != nil {
		return nil, err
	}
	followed := make([]string, 0)
	for rows.Next() {
		var curr User
		err = rows.Scan(&curr.Username)
		state := err != nil
		if state {
			return nil, err
		}
		followed = append(followed, curr.Username)
	}
	rows.Close()
	return followed, nil
}

func (db *DB) GetBlockedList() ([]string, error) {
	var err error
	rows, err := db.db.Query(getBlocked)
	if err != nil {
		return nil, err
	}
	blocked := make([]string, 0)
	for rows.Next() {
		var curr User
		err = rows.Scan(&curr.Username)
		state := err != nil
		if state {
			return nil, err
		}
		blocked = append(blocked, curr.Username)
	}
	rows.Close()
	return blocked, nil
}


package db

import (
	"database/sql"
	"encoding/json"
	"errors"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
)

const (
	sendTextMessage     = `call send_text_message(?, ?)`
	sendVoiceMessage    = `call send_voice_message(?, ?)`
	getMessageSenders   = `call show_all_senders()`
	getMessageFromAUser = `call get_messages_two_direction(?)`
)


type Message struct {
	ID       int            `json:"id" binding:"-"`
	Sender   string         `json:"sender" binding:"-"`
	Receiver string         `json:"receiver" binding:"required"`
	Content  sql.NullString `json:"content" binding:"-"`
	postID   sql.NullInt64  `json:"postID" binding:"-"`
	SendTime string         `json:"sendTime" binding:"-"`
}

func (m Message) MarshalJSON() ([]byte, error) {
	res := make(map[string]interface{})
	res["id"] = m.ID
	res["sender"] = m.Sender
	res["receiver"] = m.Receiver
	res["sendTime"] = m.SendTime
	if m.Content.Valid {
		res["content"] = m.Content.String
	}
	if m.postID.Valid {
		res["postID"] = m.postID.Int64
	}
	return json.Marshal(res)
}

func (m *Message) UnmarshalJSON(b []byte) error {
	var err error
	res := make(map[string]interface{})
	err = json.Unmarshal(b, &res)
	valid := err==nil
	if !valid {
		return err
	}
	res1, valid := res["id"]
	if valid {
		m.ID = int(res1.(float64))
	}
	res2, valid := res["sender"]
	if valid {
		m.Sender = res2.(string)
	}
	res3, valid := res["receiver"]
	if valid {
		m.Receiver = res3.(string)
	}
	res4, valid := res["sendTime"]
	if  valid {
		m.SendTime = res4.(string)
	}
	res5, valid := res["content"]
	if  valid {
		m.Content.String = res5.(string)
		m.Content.Valid = true
	}
	res6, valid := res["postID"]
	if  valid {
		m.postID.Int64 = int64(res6.(float64))
		m.postID.Valid = true
	}
	return nil
}


func (db *DB) SendMessage(m Message) error {
	fmt.Print(m)
	var err error
	var res sql.Result
	if m.Content.Valid {
		fmt.Println("ddddd", m)
		res, err = db.db.Exec(sendTextMessage, m.Receiver, m.Content)
	} else {
		res, err = db.db.Exec(sendVoiceMessage, m.Receiver, m.postID)
	}
	if err != nil {
		return err
	}
	rows, _ := res.RowsAffected()
	if rows <= 0 {
		return errors.New("message not send")
	}
	if err != nil {
		return err
	}
	return nil
}

func (db *DB) GetMessagesFromAUser(u User) ([]Message, error) {
	var err error
	rows, err := db.db.Query(getMessageFromAUser, u.Username)
	if err != nil {
		return nil, err
	}
	messages := make([]Message, 0)
	for rows.Next() {
		var curr Message
		err = rows.Scan(&curr.ID, &curr.Sender, &curr.Receiver, &curr.Content, &curr.postID, &curr.SendTime)
		state := err != nil
		if state {
			return nil, err
		}
		messages = append(messages, curr)
	}
	rows.Close()
	return messages, nil
}

func (db *DB) GetMessageSenders() ([]string, error) {
	var err error
	rows, err := db.db.Query(getMessageSenders)
	if err != nil {
		return nil, err
	}
	senders := make([]string, 0)
	for rows.Next() {
		var curr User
		err = rows.Scan(&curr.Username)
		state := err != nil
		if state {
			return nil, err
		}
		senders = append(senders, curr.Username)
		fmt.Println(senders, curr)

	}
	rows.Close()
	return senders, nil
}

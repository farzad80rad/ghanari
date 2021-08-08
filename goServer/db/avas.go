package db

import (
	"database/sql"
	"encoding/json"
	"fmt"
)

const (
	postAVA        = `call make_voice(?,?)`
	postComment    = `call submit_comment( ?, ?)`
	getTimeLine    = `call get_followed_voices()`
	getComment     = `call get_comments(?)`
	getPersonalAva = `call get_self_voice()`
	getUserAva     = `call get_user_voices(?)`
	getAvaByTag    = `call get_voices_by_hashtag(?)`
	getAvaByLike   = `call get_top_ratings( ? )`
)


type Ava struct {
	ID           int           `json:"id" binding:"-"`
	Sender       string        `json:"sender" binding:"-"`
	Content      string        `json:"content" binding:"-"`
	SorceVoiceId sql.NullInt64 `json:"sorcevoiceid" binding:"-"`
	Date         string        `json:"date" binding:"-"`
	Likes        int           `json:"likes" binding:"-"`
}

func (a Ava) MarshalJSON() ([]byte, error) {
	res := make(map[string]interface{})
	res["id"] = a.ID
	res["sender"] = a.Sender
	res["content"] = a.Content
	res["date"] = a.Date
	res["likes"] = a.Likes
	if a.SorceVoiceId.Valid {
		res["sorcevoiceid"] = a.SorceVoiceId.Int64
	}
	return json.Marshal(res)
}

func (a *Ava) UnmarshalJSON(b []byte) error {
	var err error
	res := make(map[string]interface{})
	err = json.Unmarshal(b, &res)
	valid := err == nil
	if !valid {
		return err
	}
	res1, valid := res["id"]
	if valid {
		a.ID = int(res1.(float64))
	}
	res2, valid := res["sender"];
	if  valid {
		a.Sender = res2.(string)
	}
	res3, valid := res["content"];
	if  valid {
		a.Content = res3.(string)
	}
	res4, valid := res["date"]
	if valid {
		a.Date = res4.(string)
	}
	res5, valid := res["likes"];
	if  valid {
		a.Likes = int(res5.(float64))
	}
	res6, valid := res["sorcevoiceid"];
	if  valid {
		a.SorceVoiceId.Valid = true
		a.SorceVoiceId.Int64 = int64(res6.(float64))
	}
	return nil
}


func (db *DB) PostAva(a Ava) error {
	var err error
	voiceId := int(1)
	_, err = db.db.Exec(postAVA, a.Content, voiceId)
	state := err != nil
	if state {
		return err
	}
	return nil
}

func (db *DB) PostComment(a Ava) error {
	var err error
	_, err = db.db.Exec(postComment, a.SorceVoiceId, a.Content)
	state := err != nil
	if state {
		return err
	}
	return nil
}

func (db *DB) GetTimeLine() ([]Ava, error) {
	var err error
	rows, err := db.db.Query(getTimeLine)
	state := err != nil
	if state {
		return nil, err
	}
	var timeLine []Ava
	for rows.Next() {
		var curr Ava
		err = rows.Scan(&curr.ID, &curr.Sender, &curr.Content, &curr.Date)
		state = err != nil
		if state {
			return nil, err
		}
		timeLine = append(timeLine, curr)
	}
	rows.Close()
	return timeLine, nil
}

func (db *DB) GetComments(a Ava) ([]Ava, error) {
	var err error
	rows, err := db.db.Query(getComment, a.ID)
	state := err != nil
	if state {
		return nil, err
	}
	var timeLine []Ava
	for rows.Next() {
		var curr Ava
		err = rows.Scan(&curr.ID, &curr.Sender, &curr.Content, &curr.Date)
		state = err != nil
		if state {
			return nil, err
		}
		timeLine = append(timeLine, curr)
	}
	rows.Close()
	return timeLine, nil
}

func (db *DB) GetPersonalAvas() ([]Ava, error) {
	var err error
	rows, err := db.db.Query(getPersonalAva)
	state := err != nil
	if state {
		return nil, err
	}
	var timeLine []Ava
	for rows.Next() {
		var curr Ava
		err = rows.Scan(&curr.ID, &curr.Sender, &curr.Content, &curr.Date)
		state := err != nil
		if state {
			return nil, err
		}
		timeLine = append(timeLine, curr)
	}
	rows.Close()
	return timeLine, nil
}

func (db *DB) GetUserAvas(u User) ([]Ava, error) {
	var err error
	rows, err := db.db.Query(getUserAva, u.Username)
	state := err != nil
	if state {
		return nil, err
	}
	var timeLine []Ava
	for rows.Next() {
		fmt.Println("errrr", err)
		var curr Ava
		err = rows.Scan(&curr.ID, &curr.Sender, &curr.Content, &curr.Date)
		state = err!=nil
		if state {
			return nil, err
		}
		timeLine = append(timeLine, curr)
	}
	rows.Close()
	return timeLine, nil
}

func (db *DB) GetAvasByTags(tag Tag) ([]Ava, error) {
	var err error
	rows, err := db.db.Query(getAvaByTag, tag.Tag)
	state := err != nil
	if state {
		return nil, err
	}
	var timeLine []Ava
	for rows.Next() {
		var curr Ava
		err = rows.Scan(&curr.ID, &curr.Sender, &curr.Content, &curr.Date)
		state = err != nil
		if state {
			return nil, err
		}
		timeLine = append(timeLine, curr)
	}
	rows.Close()
	return timeLine, nil
}

func (db *DB) GetAvasByLikes() ([]Ava, error) {
	var err error
	count := 10
	rows, err := db.db.Query(getAvaByLike, count)
	state := err != nil
	if state {
		return nil, err
	}
	var timeLine []Ava
	for rows.Next() {
		var curr Ava
		err = rows.Scan(&curr.ID, &curr.Sender, &curr.Content, &curr.Likes, &curr.Date)
		state = err!=nil
		if state {
			return nil, err
		}
		timeLine = append(timeLine, curr)
	}
	rows.Close()
	return timeLine, nil

}

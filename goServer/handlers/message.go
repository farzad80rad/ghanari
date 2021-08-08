package handlers

import (
	"fmt"
	"net/http"

	"github.com/farzad80rad/ghanari/goServer/db"
	"github.com/gin-gonic/gin"
)

func getSendMessageHandler(c *gin.Context) {
	var err error
	var state bool
	var msg db.Message
	err = c.ShouldBindJSON(&msg)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusBadRequest, err)
		return
	}
	err = db.SqlDB.SendMessage(msg)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": "message was sent successfully",
	})
	return
}

func getMessagesFromAUserHandler(c *gin.Context) {
	var err error
	var state bool
	var user db.User
	err = c.ShouldBindJSON(&user)
	state = err != nil
	if state {
		fmt.Println("errrrrrr", err)
		c.AbortWithError(http.StatusBadRequest, err)
		return
	}
	messages, err := db.SqlDB.GetMessagesFromAUser(user)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"messages": messages,
	})
}

func getMessageSendersHandler(c *gin.Context) {
	var err error
	var state bool
	users, err := db.SqlDB.GetMessageSenders()
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"senders": users,
	})
	return
}


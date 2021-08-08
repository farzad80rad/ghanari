package handlers

import (
	"fmt"
	"net/http"

	"github.com/farzad80rad/ghanari/goServer/db"
	"github.com/gin-gonic/gin"
)

func getLikeHandler(c *gin.Context) {
	var err error
	var state bool
	var ava db.Ava
	err = c.ShouldBindJSON(&ava)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusBadRequest, err)
		return
	}
	fmt.Println(ava)
	err = db.SqlDB.Like(ava)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": "successful",
	})
}

func getLikersHandler(c *gin.Context) {
	var err error
	var state bool
	var ava db.Ava
	err = c.ShouldBindJSON(&ava)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusBadRequest, err)
		return
	}
	likers, err := db.SqlDB.GetLikers(ava)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"likers": likers,
	})
}

func getLikesCountHandler(c *gin.Context) {
	var err error
	var state bool
	var ava db.Ava
	err = c.ShouldBindJSON(&ava)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusBadRequest, err)
		return
	}
	likes, err := db.SqlDB.GetLikesCount(ava)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"likes": likes,
	})
	return
}

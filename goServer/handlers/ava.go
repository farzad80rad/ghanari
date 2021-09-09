package handlers

import (
	"fmt"
	"github.com/farzad80rad/ghanari/goServer/db"
	"github.com/gin-gonic/gin"
	"net/http"
)

func getPostAvaHandler(c *gin.Context) {
	var ava db.Ava
	var err error
	var state bool
	err = c.ShouldBindJSON(&ava)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusBadRequest, err)
		return
	}
	err = db.SqlDB.PostAva(ava)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": "post ava successfully",
	})
	return
}

func getPostCommentHandler(c *gin.Context) {
	var comment db.Ava
	var err error
	var state bool
	err = c.ShouldBindJSON(&comment)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusBadRequest, err)
		return
	}
	err = db.SqlDB.PostComment(comment)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": "post comment successfully",
	})
	fmt.Println("should be done" , comment)
	return
}

func getTimeLineHandler(c *gin.Context) {
	var err error
	var state bool
	avas, err := db.SqlDB.GetTimeLine()
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"timeLine": avas,
	})
	return
}

func getAvasCommentHandler(c *gin.Context) {
	var ava db.Ava
	var err error
	var state bool
	err = c.ShouldBindJSON(&ava)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusBadRequest, err)
		return
	}
	comments, err := db.SqlDB.GetComments(ava)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"comments": comments,
	})
	return
}

func getPersonalAvasHandler(c *gin.Context) {
	var err error
	var state bool
	avas, err := db.SqlDB.GetPersonalAvas()
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"avas": avas,
	})
	return
}

func getUserAvasHandler(c *gin.Context) {
	var err error
	var state bool
	var user db.User
	err = c.ShouldBindJSON(&user)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusBadRequest, err)
		return
	}
	avas, err := db.SqlDB.GetUserAvas(user)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"avas": avas,
	})
	return
}

func getAvasByTagHandler(c *gin.Context) {
	var err error
	var state bool
	var tag db.Tag
	err = c.ShouldBindJSON(&tag)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusBadRequest, err)
		return
	}
	avas, err := db.SqlDB.GetAvasByTags(tag)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"avas": avas,
	})
	return
}

func getAvasByLikesHandler(c *gin.Context) {
	var err error
	var state bool
	avas, err := db.SqlDB.GetAvasByLikes()
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"avas": avas,
	})
	return
}

package handlers

import (
	"fmt"
	"net/http"

	"github.com/farzad80rad/ghanari/goServer/db"
	"github.com/gin-gonic/gin"
)

func getSingUpHandler(c *gin.Context) {
	var err error
	var state bool
	var form db.SignupCredential
	err = c.ShouldBindJSON(&form)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusBadRequest, err)
		return
	}
	err = db.SqlDB.Signup(form)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	return
}

func getLoginHandler(c *gin.Context) {
	var err error
	var state bool
	var form db.LoginCredential
	err = c.ShouldBindJSON(&form)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusBadRequest, err)
		return
	}
	err = db.SqlDB.Login(form)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": "Login successfully",
	})
	return
}


func getListFollowedUserHandler(c *gin.Context) {
	var err error
	var state bool
	users, err := db.SqlDB.GetFollowedList()
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"followed": users,
	})
	return
}

func getListBlockedUserHandler(c *gin.Context) {
	var err error
	var state bool
	users, err := db.SqlDB.GetBlockedList()
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"blocked": users,
	})
	return
}

func getFollowHandler(c *gin.Context) {
	var err error
	var state bool
	var user db.User
	err = c.ShouldBindJSON(&user)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusBadRequest, err)
		return
	}
	err = db.SqlDB.Follow(user)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": fmt.Sprintf("user %s followed successfully", user.Username),
	})
	return
}

func getUnfollowHandler(c *gin.Context) {
	var err error
	var state bool
	var user db.User
	err = c.ShouldBindJSON(&user)
	state = err != nil
	if state {
		fmt.Println("errr",err);
		c.AbortWithError(http.StatusBadRequest, err)
		return
	}
	err = db.SqlDB.UnFollow(user)
	state = err != nil
	if state {
		fmt.Println("errr",err);
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": fmt.Sprintf("user %s Unfollowed successfully", user.Username),
	})
	return
}

func getBlockHandler(c *gin.Context) {
	var err error
	var state bool
	var user db.User
	err = c.ShouldBindJSON(&user)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusBadRequest, err)
		return
	}
	err = db.SqlDB.Block(user)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": fmt.Sprintf("user %s blocked successfully", user.Username),
	})
	return
}

func getUnblockHandler(c *gin.Context) {
	var err error
	var state bool
	var user db.User
	err = c.ShouldBindJSON(&user)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusBadRequest, err)
		return
	}
	err = db.SqlDB.UnBlock(user)
	state = err != nil
	if state {
		c.AbortWithError(http.StatusInternalServerError, err)
		return
	}
	c.JSON(http.StatusOK, gin.H{
		"message": fmt.Sprintf("user %s unblocked successfully", user.Username),
	})
	return
}

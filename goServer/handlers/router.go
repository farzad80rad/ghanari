package handlers

import (
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
)

type App struct {
	route *gin.Engine
}

var Router *App

func InitApp() {
	r := gin.Default()
	initRouter(r)
	Router = &App{
		route: r,
	}
}
func CORSMiddleware(c *gin.Context) {
	c.Header("Access-Control-Allow-Methods", "POST, OPTIONS, GET, PUT")
	c.Header("Access-Control-Allow-Origin", "*")
	c.Header("Access-Control-Allow-Headers", "Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, accept, origin, Cache-Control, X-Requested-With, content-type, method, x-pingother")
	c.Header("Access-Control-Allow-Credentials", "true")
	if strings.EqualFold("OPTIONS", c.Request.Method) {
		c.JSON(http.StatusOK, struct{}{})
		return
	}
	c.Next()
}

func initRouter(r *gin.Engine) {
	r.Use(gin.Recovery())
	r.Use(CORSMiddleware)

	r.POST("/signup", getSingUpHandler)
	r.POST("/login", getLoginHandler)
	r.POST("/follow", getFollowHandler)
	r.POST("/unfollow", getUnfollowHandler)
	r.POST("/block", getBlockHandler)
	r.POST("/unblock", getUnblockHandler)
	r.POST("/sendMessage", getSendMessageHandler)
	r.POST("/getMessages", getMessagesFromAUserHandler)
	r.GET("/chatList", getMessageSendersHandler)
	r.GET("/followdUserList", getListFollowedUserHandler)
	r.GET("/blockedUserList", getListBlockedUserHandler)
	r.POST("/postAVA", getPostAvaHandler)
	r.POST("/postComment", getPostCommentHandler)
	r.GET("/followedVoices", getTimeLineHandler)
	r.POST("/comments", getAvasCommentHandler)
	r.GET("/myAva", getPersonalAvasHandler)
	r.POST("/userAva", getUserAvasHandler)
	r.POST("/tag", getAvasByTagHandler)
	r.GET("/popular", getAvasByLikesHandler)
	r.POST("/doLike", getLikeHandler)
	r.POST("/likerList", getLikersHandler)
	r.GET("/likeCount", getLikesCountHandler)

}

func Start() error {
	return Router.route.Run()
}


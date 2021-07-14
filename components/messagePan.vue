<template>
  <section>
    <div class="container my-container chat-pan pt-2">
      <div class="title">
        <img
          src="avatar.jpeg"
          alt="John Doe"
          @click="$store.dispatch('getVoiceOfUser',selectedChatName)"
          class="mr-3 rounded-circle"
          style="width: 50px"
        />
        <h4 class="d-inline-block">{{ selectedChatName }}</h4>
      </div>
      <div class="chat-body">
        <div v-for="message in selectedMessage" :key="message.id">
          <div style="width: 100%">
            <div :class="messageClass(message)">
              <div v-if="message.postID > 1">
                <small>forwarded </small> 
                <div  class="d-flex justify-content-between align-items-center">
                {{ message.postID }} <small>{{ message.sendTime }}</small>
              </div>
              </div >
              <div v-else class="d-flex justify-content-between align-items-center">
                {{ message.content }} <small>{{ message.sendTime }}</small>
              </div>
            </div>
            &nbsp;
          </div>

          <div :class="opositSide(message.sender)"></div>
        </div>
      </div>
      <div class="input-group comment-form pr-2 pl-2">
        <textarea
          class="form-control"
          name="chatTextArea"
          id="chatTextArea"
          cols="100"
          v-model="textToSend"
          rows="1"
          placeholder="new message"
        ></textarea>
        <div class="input-group-append">
          <button class="btn btn-primary" @click="$store.dispatch('sendMessage',textToSend)">sent</button>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { mapState } from 'vuex'

export default {
  computed: {
    ...mapState([
      'selectedMessage',
      'userName',
      'selectedChatName',
      'followed',
    ]),
    followUnfollow() {
      return this.followed.includes(this.selectedChatName)
        ? 'unfollow'
        : 'follow'
    },
  },
  data() {
    return {
      textToSend: '',
    }
  },
  methods: {
    messageClass(message) {
      return {
        selfMessage: message.sender === this.userName,
        otherMessage: message.sender !== this.userName,
       // forwardedMessage: message.sender.length !== 0,
      }
    },
    opositSide(sender) {
      return {
        left: sender === this.userName,
        right: sender !== this.userName,
      }
    },
  },
}
</script>

<style lang="css" scoped>
.comment-form {
  box-shadow: 0px -7px 5px 0 rgba(0, 0, 0, 0.2);
}

.chat-body {
  overflow-y: scroll;
  max-height: 81vh;
}

.chat-pan {
}

.selfMessage {
  width: 60%;
  float: right;
  padding: 10px;
  margin: 10px;
  background-color: dodgerblue;
  border-radius: 8px;
}

.otherMessage {
  width: 60%;
  float: left;
  padding: 10px;
  margin: 10px;
  border: 1px solid rgb(228, 228, 228);
  background-color: rgb(255, 255, 255);
  border-radius: 8px;
}

.title {
  width: 100%;
  padding: 5px 20px;
  margin-bottom: 10px;
  border-bottom-style: solid;
  border-radius: 5px;
  background-color: white;
  box-shadow: 0px 0px 15px rgb(156, 156, 156);
}
.forwardedMessage {
  border: 2px dashed blanchedalmond;
}

.my-container {
  background-color: whitesmoke;
}
</style>

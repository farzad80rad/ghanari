<template>
  <section>
    <div class="container my-container chat-pan pt-2">
      <div class="title">
        <img
          src="download.jfif"
          alt="John Doe"
          @click="$store.dispatch('getVoiceOfUser', selectedChatName)"
          class="mr-3 rounded-circle"
          style="width: 50px;"
        />
        <h4 class="d-inline-block">{{ selectedChatName }}</h4>
      </div>
      <div class="chat-body">
        <div v-for="message in selectedMessage" :key="message.id">
          <div style="width: 100%;">
            <div :class="messageClass(message)">
              <div v-if="message.postID > 1">
                <small>forwarded </small>
                <div class="d-flex justify-content-between align-items-center">
                  {{ message.postID }} <small>{{ message.sendTime }}</small>
                </div>
              </div>
              <div
                v-else
                class="d-flex justify-content-between align-items-center"
              >
                {{ message.content }} <small>{{ message.sendTime }}</small>
              </div>
            </div>
            &nbsp;
          </div>

          <div :class="opositSide(message.sender)"></div>
        </div>
      </div>
    </div>
    <div class="container">
      <!-- The Modal -->
      <div class="modal fade" id="typeNewVoice">
        <div class="modal-dialog">
          <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">
                ×
              </button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
              <div class="overflow-auto container text-wrap">
                <div class="input-group comment-form pr-2 pl-2">
                  <textarea
                    class="form-control"
                    name="chatTextArea"
                    id="chatTextArea"
                    v-model="textToSend"
                    cols="100"
                    rows="1"
                    placeholder="new comment"
                  ></textarea>
                  <div class="input-group-append">
                    <button
                      class="btn btn-primary"
                      data-dismiss="modal"
                      @click="$store.dispatch('sendMessage', textToSend)"
                    >
                      sent
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <button
      type="button"
      class="btn sendBtn ml-3 mr-3 btn-primary"
      data-toggle="modal"
      data-target="#typeNewVoice"
    >
      +
    </button>
  </section>
</template>

<script>
import { mapState } from "vuex";

export default {
  computed: {
    ...mapState([
      "selectedMessage",
      "userName",
      "selectedChatName",
      "followed",
    ]),
    followUnfollow() {
      return this.followed.includes(this.selectedChatName)
        ? "unfollow"
        : "follow";
    },
  },
  data() {
    return {
      textToSend: "",
    };
  },
  methods: {
    messageClass(message) {
      return {
        selfMessage: message.sender === this.userName,
        otherMessage: message.sender !== this.userName,
        // forwardedMessage: message.sender.length !== 0,
      };
    },
    opositSide(sender) {
      return {
        left: sender === this.userName,
        right: sender !== this.userName,
      };
    },
  },
};
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

.sendBtn {
  position: fixed;
  right: 30px;
  bottom: 30px;
}
.my-container {
  background: rgba(76, 175, 80, 0.1);
}
</style>

<template>
  <section>
    <div class="my-container container mt-3">
      <br />
      <div class="media border p-3">
        <div class="media-body">
          <div class="main-voice shadow p-4 mb-4 bg-white">
            <h4 class="d-flex justify-content-between align-items-center">
              <span
                ><img
                  src="download.jfif"
                  alt="John Doe"
                  class="mr-2 rounded-circle"
                  style="width: 40px;"
                />
                {{ selecteduser.name }}</span
              >

              <small v-if="selecteduser.name !== userName"
                ><button
                  v-if="!followed.includes(selecteduser.name)"
                  class="btn btn-success"
                  @click="followUser()"
                >
                  follow
                </button>
                <button v-else class="btn btn-primary" @click="unfollowUser()">
                  unfollow
                </button>
                <button
                  v-if="!blocked.includes(selecteduser.name)"
                  class="btn btn-danger"
                  @click="blockUser()"
                >
                  block
                </button>
                <button v-else class="btn btn-primary" @click="unblockUser()">
                  unblock
                </button>
                <button class="btn btn-primary" @click="enterChat()">
                  chat
                </button></small
              >
            </h4>
            <p class="ml-5 pl-2">
              {{ selecteduser.biography }}
            </p>
          </div>
          <div class="comment-body">
            <div
              v-for="currentComment in selecteduser.voices"
              :key="currentComment.id"
              class="media pl-5 pt-3"
            >
              <div
                class="media-body voice-card shadow p-3 bg-white"
                @click="$store.dispatch('openVoicePan', currentComment)"
              >
                <h4 class="d-flex justify-content-between align-items-center">
                  <span>
                    <img
                      src="download.jfif"
                      alt="John Doe"
                      class="mr-2 rounded-circle"
                      style="width: 40px;"
                    />
                    {{ currentComment.publisher }}</span
                  >
                  <small class="mr-4"
                    ><i
                      ><small>Posted on {{ currentComment.publishTime }}</small>
                    </i></small
                  >
                </h4>
                <p class="ml-5 pl-3">
                  {{ currentComment.content }}
                </p>
              </div>
            </div>
          </div>
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
                    v-model="newVoiceContent"
                    cols="100"
                    rows="1"
                    placeholder="new ava"
                  ></textarea>
                  <div class="input-group-append">
                    <button
                      class="btn btn-primary"
                      data-dismiss="modal"
                      @click="$store.dispatch('sendava', newVoiceContent)"
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
      v-if="selecteduser.name === userName"
      type="button"
      class="btn sendBtn ml-3 mr-3 btn-primary"
      data-toggle="modal"
      data-target="#typeNewVoice"
    >
      +
    </button>

    <div class="modal fade" id="logModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <!-- Modal Header -->
          <div class="modal-header">
            <h3 class="modal-title text-center">logins</h3>
            <button type="button" class="close" data-dismiss="modal">×</button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <div class="overflow-auto container text-wrap">
              <div v-for="log in loginLogs" class="list-group" :key="log">
                <div class="list-group-item list-group-item-action">
                  {{ log }}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { mapState } from "vuex";

export default {
  computed: {
    ...mapState([
      "selecteduser",
      "followed",
      "userName",
      "blocked",
      "loginLogs",
    ]),
    followCheck() {
      if (this.followed.includes(this.selecteduser.name)) return "unfollow";
      return "follow";
    },
    blockCheck() {
      if (this.blocked.includes(this.selecteduser.name)) return "unblock";
      return "block";
    },
  },
  data() {
    return {
      textToComment: "",
      newVoiceContent: "",
    };
  },
  methods: {
    sendNewVoice() {
      this.$store.dispatch("sendava", this.newVoiceContent);
      this.newVoiceContent = "";
    },
    enterChat() {
      this.$store.commit("openChat", this.selecteduser.name);
    },
    followUser() {
      this.$store.dispatch("follow", this.selecteduser.name);
    },
    unfollowUser() {
      this.$store.dispatch("unfollow", this.selecteduser.name);
    },
    blockUser() {
      this.$store.dispatch("block", this.selecteduser.name);
    },
    unblockUser() {
      this.$store.dispatch("unblock", this.selecteduser.name);
    },
    openVoicePan(id) {
      this.$store.commit("openVoicePan");
    },
  },
};
</script>

<style lang="css" scoped>
.comment-form {
  box-shadow: 0px -7px 5px 0 rgba(0, 0, 0, 0.2);
}

.my-container {
  background: rgba(76, 175, 80, 0.1);
}

.comment-body {
  overflow-y: scroll;
  max-height: 65vh;
}

.main-voice {
  padding: 5px;
  border: 2px solid;
  border-radius: 5px;
}

.voice-card:hover {
  cursor: pointer;
}
.voice-card {
  opacity: 0.8;
  border-radius: 10px;
}
.sendBtn {
  position: fixed;
  right: 30px;
  bottom: 30px;
}
/* Bordered form */
</style>

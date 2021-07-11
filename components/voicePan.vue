<template>
  <section>
    <div class="container my-container mt-3">
      <br />
      <div class="media border p-3">
        <div class="media-body">
          <a>
            <div class="main-voice shadow p-2 mb-4 bg-white">
              <h4 class="d-flex justify-content-between align-items-center">
                <a class="btn" @click="openUserPan()">
                  <img
                    src="avatar.jpeg"
                    alt="John Doe"
                    class="mr-2 rounded-circle"
                    style="width: 40px"
                  />
                  {{ selectedVoice.sender }}
                </a>
                <small>
                  <button
                    type="button"
                    class="btn ml-3 mr-3 btn-primary"
                    data-toggle="modal"
                    data-target="#forwardModal"
                  >
                    forward
                  </button>
                  <button type="button" class="btn mr-3 btn-primary">
                    like
                  </button>
                  <em>
                    <small>Posted on {{ selectedVoice.date }}</small>
                  </em>
                  <!-- Button to Open the Modal -->
                </small>
              </h4>
              <p class="ml-5 pl-2">
                {{ selectedVoice.content }}
              </p>
              <div class="ml-5 pl-4">
                Likes {{ selectedVoice.liked }}
                <button
                  @click="showLikedBy"
                  type="button"
                  class="btn ml-3 btn-secondary"
                >
                  liked by
                </button>
                <span class="container" v-if="showLikedBool">
                  <a
                    v-for="person in likedBy"
                    class="text-secondary ml-3 user-text-liked"
                    :key="person"
                  >
                    {{ person }}
                  </a>
                </span>
              </div>
            </div></a
          >

          <div class="comment-body">
            <div
              v-for="currentComment in selectedVoice.comments"
              :key="currentComment.id"
              class="media pl-5 pt-3"
            >
              <div
                class="media-body comment-card shadow p-3 bg-white"
                @click="openVoicePan(currentComment.id)"
              >
                <h4 class="d-flex justify-content-between align-items-center">
                  <span>
                    <img
                      src="avatar.jpeg"
                      alt="John Doe"
                      class="mr-2 rounded-circle"
                      style="width: 40px"
                    />
                    {{ currentComment.sender }}</span
                  >
                  <small class="mr-4"
                    ><i
                      ><small>Posted on {{ currentComment.date }}</small>
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
    <div class="input-group comment-form pr-2 pl-2">
      <textarea
        class="form-control"
        name="chatTextArea"
        id="chatTextArea"
        cols="100"
        rows="1"
        placeholder="new comment"
      ></textarea>
      <div class="input-group-append">
        <button class="btn btn-primary">sent</button>
      </div>
    </div>
    <div class="container">
      <!-- The Modal -->
      <div class="modal" id="forwardModal">
        <div class="modal-dialog">
          <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
              <h3 class="modal-title">forward to</h3>
              <button type="button" class="close" data-dismiss="modal">
                ×
              </button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
              <div class="overflow-auto container text-wrap">
                <div v-for="item in contacts" class="list-group" :key="item">
                  <a
                    data-dismiss="modal"
                    @click="forwardMessage()"
                    class="list-group-item list-group-item-action"
                  >
                    <img
                      src="avatar.jpeg"
                      alt="John Doe"
                      class="mr-2 rounded-circle"
                      style="width: 30px"
                    />
                    {{ item }}
                  </a>
                </div>
              </div>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">
                Close
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { mapState } from 'vuex'

export default {
  computed: {
    ...mapState(['selectedVoice', 'likedBy', 'contacts']),
  },
  data() {
    return {
      textToComment: '',
      showLikedBool: false,
    }
  },
  methods: {
    showLikedBy() {
      this.showLikedBool = !this.showLikedBool
    },
    openUserPan() {
      this.$store.commit('openUserPan')
    },
    openVoicePan(id) {
      this.$store.commit('openVoicePan')
    },
    forwardMessage() {},
  },
}
</script>

<style lang="css" scoped>
.comment-form {
  box-shadow: 0px -7px 5px 0 rgba(0, 0, 0, 0.2);
}

.my-container {
  background-color: whitesmoke;
}

.comment-body {
  overflow-y: scroll;
  max-height: 60vh;
}

.main-voice {
  padding: 5px;
  border: 2px solid;
  border-radius: 5px;
}

.user-text-liked {
  border-bottom-style: solid;
}
.user-text-liked:hover {
  cursor: pointer;
}
.comment-card:hover {
  cursor: pointer;
  border: 1px solid rgb(139, 139, 139);
}
/* Bordered form */
</style>

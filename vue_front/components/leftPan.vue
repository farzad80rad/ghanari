<template>
  <section class="pt-3 my-container">
    <div class="container my-container">
      <small>
        <ul class="nav nav-tabs" role="tablist">
          <li>
            <a class="btn d-inline" @click="openSelfPanel()">
              <img
                src="download.jfif"
                alt="John Doe"
                class="mr-2 rounded-circle"
                style="width: 30px;"
              />
            </a>
          </li>
          <li class="nav-item">
            <a
              class="nav-link tap-pan active"
              @click="$store.dispatch('messageList')"
              data-toggle="tab"
              href="#chats"
              >Chats</a
            >
          </li>
          <li class="nav-item">
            <a
              class="nav-link tap-pan"
              @click="$store.dispatch('getHots')"
              data-toggle="tab"
              href="#hots"
              >Hots</a
            >
          </li>
          <li class="nav-item">
            <a
              class="nav-link tap-pan"
              @click="$store.dispatch('getFollowedVoices')"
              data-toggle="tab"
              href="#news"
              >News</a
            >
          </li>
          <li class="nav-item">
            <a class="nav-link tap-pan" data-toggle="tab" href="#hashTag"
              >hashTag</a
            >
          </li>
        </ul></small
      >

      <div class="tab-content mt-3">
        <!--  chats -->
        <div
          id="chats"
          class="overflow-auto container text-wrap tab-pane active"
        >
          <div v-for="item in contacts" class="list-group" :key="item">
            <a
              @click="openChat(item)"
              href="#"
              class="list-group-item mb-1 list-group-item-action"
            >
              <img
                src="download.jfif"
                alt="John Doe"
                class="mr-2 rounded-circle"
                style="width: 30px;"
              />
              {{ item }}
            </a>
          </div>
        </div>

        <!-- hots -->

        <div id="hots" class="overflow-auto container text-wrap tab-pane fade">
          <div v-for="item in hotVoice" class="list-group" :key="item.id">
            <a
              @click="openVoicePan(item)"
              class="list-group-item mb-1 d-flex list-group-item-action justify-content-between align-items-center"
            >
              <span
                >{{ item.sender }}
                <small class="pl-4">{{
                  shrinkString(item.content, 20)
                }}</small></span
              >
              <span class="badge badge-primary badge-pill">{{
                item.likes
              }}</span>
            </a>
          </div>
        </div>

        <!-- news -->

        <div
          id="news"
          class="overflow-auto container text-wrap text-break tab-pane fade"
        >
          <div v-for="item in newVoices" class="list-group" :key="item.id">
            <a
              @click="openVoicePan(item)"
              href="#"
              class="list-group-item mb-1 list-group-item-action"
              >{{ item.sender }}
              <small class="pl-4">{{
                shrinkString(item.content, 20)
              }}</small></a
            >
          </div>
        </div>

        <!-- hashtag -->

        <div
          id="hashTag"
          class="overflow-auto container text-wrap text-break tab-pane fade"
        >
          <div class="input-group pb-2">
            <div class="input-group-prepend">
              <span class="input-group-text">#</span>
            </div>
            <textarea
              class="form-control"
              name="hashtagSearch"
              id="hashtagSearch"
              v-model="hashtagToSearch"
              cols="50"
              rows="1"
              placeholder="hashtag"
            ></textarea>
            <div class="input-group-append">
              <button
                class="btn btn-success"
                @click="$store.dispatch('getHashtagAva', hashtagFormat)"
              >
                sreach
              </button>
            </div>
          </div>
          <div v-for="item in voicehashtags" class="list-group" :key="item.id">
            <a
              @click="$store.dispatch('openVoicePan', item)"
              href="#"
              class="list-group-item mb-1 list-group-item-action"
              >{{ item.sender }}
              <small class="pl-4">{{
                shrinkString(item.content, 20)
              }}</small></a
            >
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { mapState } from "vuex";

export default {
  data() {
    return { hashtagToSearch: "" };
  },
  computed: {
    ...mapState([
      "state",
      "followed",
      "hotVoice",
      "userName",
      "contacts",
      "newVoices",
      "voicehashtags",
    ]),
    hashtagFormat() {
      return "#" + this.hashtagToSearch;
    },
  },
  methods: {
    openSelfPanel() {
      this.$store.dispatch("getselfVoice");
    },
    shrinkString(s, size) {
      if (s == null) return s;
      if (s.length < 24) return s;
      return s.substring(0, 24) + "...";
    },
    openVoicePan(item) {
      this.$store.dispatch("openVoicePan", item);
    },
    openChat(name) {
      this.$store.dispatch("reciveMessage", name);
    },
    openUserPan() {
      this.$store.commit("openUserPan");
    },
  },
};
</script>

<style lang="css" scoped>
.my-container {
  background-color: rgb(15 32 49);
  max-height: 95vh;
  overflow: hidden;
}
.tab-content {
  height: 100vh;
  overflow-y: auto;
}
.tap-pan {
  color: white;
}

.tap-pan:hover {
  background-color: rgba(255, 255, 255, 0.911);
  color: black;
}

.tap-pan:active {
  color: black;
}
</style>

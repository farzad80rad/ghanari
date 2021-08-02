<template>
  <div class="body">
    <div class="row" v-if="state !== 'submit' && state !== 'login'">
      <div class="col-4">
        <leftPan />
      </div>
      <div class="col-8">
        <voicePan v-if="state === 'voice'" />
        <messagePan v-else-if="state == 'chat'" />
        <userPan v-else-if="state === 'user'" />
      </div>
    </div>
    <login v-else-if="state === 'login'" />
    <submit v-else />
  </div>
</template>

<script>
import leftPan from "@/components/leftPan.vue";
import { mapState } from "vuex";
import login from "@/components/login.vue";
import submit from "@/components/submit.vue";
import VoicePan from "../components/voicePan.vue";
import MessagePan from "../components/messagePan.vue";
import UserPan from "../components/userPan.vue";

export default {
  components: {
    submit,
    login,
    leftPan,
    VoicePan,
    MessagePan,
    UserPan,
  },
  computed: {
    ...mapState(["state"]),
  },
};
</script>

<style scoped>
html {
  box-sizing: border-box;
}

.body {
  height: 98vh;
  max-width: 99vw;
  background-image: url("../static/loginBack.jpg");
  background-size: cover;
  background-repeat: no-repeat;
}

html,
body,
.fullhight {
  min-height: 100%;
  height: 100%;
}
</style>

export const state = () => ({
  state: "login",
  validAuth: false,
  userName: null,
  signupInfo: {
    username: "",
    password: "",
    date: "",
    firstName: "",
    secondName: "",
    bio: "",
  },
  followed: [],
  blocked: [],
  likedBy: [],
  hotVoice: [],
  contacts: [],
  newVoices: [],
  voicehashtags: [],

  selectedVoice: {
    id: 0,
    sender: "farzad",
    content: "",
    liked: 0,
    date: "",
    comments: [],
  },

  selecteduser: {
    name: "farzad",
    biography: "",
    birthDate: "",
    joinDate: "",
    voices: [],
  },

  selecteduserName: "",
  selecteduser_voices: [],
  loginLogs: [
    "2020/10/04 20:10:03",
    "2020/10/04 20:10:04",
    "2020/10/04 20:10:05",
    "2020/10/04 20:10:06",
    "2020/10/04 20:10:07",
  ],
  selectedChatName: "",
  selectedMessage: [],
});

export const mutations = {
  loginByName: (state) => {
    state.userName = state.signupInfo.username;
    state.validAuth = true;
    state.state = "enterd";
  },
  goToSubmit: (state) => {
    state.state = "submit";
  },
  goTologin: (state) => {
    state.state = "login";
  },
  openVoicePan(state) {
    state.state = "voice";
  },
  openChat(state, name) {
    state.selectedChatName = name;
    state.state = "chat";
  },
  openUserPan(state) {
    state.state = "user";
  },

  // set userINfo
  setfirstName(state, fn) {
    state.signupInfo.firstName = fn;
  },
  setusername(state, un) {
    state.signupInfo.username = un;
  },
  setBirthDate(state, date) {
    state.signupInfo.date = date;
  },
  setpassword(state, pass) {
    state.signupInfo.password = pass;
  },
  setbio(state, bio) {
    state.signupInfo.bio = bio;
  },
  setsecondname(state, sn) {
    console.log(sn);
    state.signupInfo.secondName = sn;
  },

  //set messages info
  setContacts(state, array) {
    state.contacts = array;
  },

  //set hots
  sethotVoice(state, array) {
    console.log(array);
    state.hotVoice = array;
  },

  // set selected message
  setselectedVoice_sender(state, name) {
    state.selectedVoice.sender = name;
  },
  setselectedVoice_content(state, content) {
    state.selectedVoice.content = content;
  },
  setselectedVoice_liked(state, liked) {
    state.selectedVoice.liked = liked;
  },
  setselectedVoice_date(state, date) {
    state.selectedVoice.date = date;
  },
  setselectedVoice_comments(state, comments) {
    console.log(comments);
    state.selectedVoice.comments = comments;
  },
  setselectedVoice_id(state, id) {
    console.log(id);
    state.selectedVoice.id = id;
  },

  //set selected user
  setSelectedUser_Name(state, name) {
    console.log("setSelectedUser_Name");
    console.log(name);
    state.selecteduser.name = name;
    console.log("out setSelectedUser_Name");
  },

  setSelectedUser_voices(state, voices) {
    console.log("setSelectedUser_voices");
    console.log(voices);
    state.selecteduser.voices = voices;
    console.log("out setSelectedUser_voices");
  },

  setNews(state, news) {
    console.log(news);
    state.newVoices = news;
  },

  setVoiceHashtag(state, array) {
    console.log(array);
    state.voicehashtags = array;
  },

  setfollowed(state, array) {
    state.followed = array;
  },

  setlikedBy(state, array) {
    console.log("likedBy");
    console.log(array);
    state.likedBy = array;
  },

  setselectedMessage(state, array) {
    console.log(array);
    state.selectedMessage = array;
  },
};

export const actions = {
  openVoicePan({ commit, dispatch }, item) {
    commit("setselectedVoice_sender", item.publisher);
    commit("setselectedVoice_content", item.content);
    commit("setselectedVoice_liked", item.likes);
    commit("setselectedVoice_date", item.publishTime);
    commit("setselectedVoice_id", item.id);
    dispatch("getComments", item.id);
    commit("openVoicePan");
  },

  async signup({ state }) {
    console.log("username : " + state.signupInfo.username);
    console.log("fist name : " + state.signupInfo.firstName);
    console.log("lastname : " + state.signupInfo.secondName);
    console.log("password : " + state.signupInfo.password);
    console.log("bio : " + state.signupInfo.bio);
    console.log("birthday : " + state.signupInfo.date);

    let res = await this.$axios.post("http://localhost:8080/user/signup", {
      username: state.signupInfo.username,
      password: state.signupInfo.password,
      firstName: state.signupInfo.firstName,
      lastName: state.signupInfo.secondName,
      bio: state.signupInfo.bio,
      birthday: state.signupInfo.date,
    });
    console.log(res.status);
    return res;
  },

  async login({ dispatch, commit, state }) {
    console.log(state.signupInfo.username);
    console.log(state.signupInfo.password);
    let res = await this.$axios.post(
      "http://localhost:8080/user/login",
      {
        username: state.signupInfo.username,
        password: state.signupInfo.password,
      },
      {
        headers: {
          "Content-Type": "application/json",
        },
      }
    );
    console.log(res);
    if (res.status / 100 === 2) {
      await dispatch("messageList");
      commit("loginByName");
    }
    return res;
  },

  async follow({ state }, name) {
    console.log("follow");
    console.log(name);
    await this.$axios
      .post(
        "http://localhost:8080/user/follow",
        { username: name },
        {
          headers: {
            "Content-Type": "application/json",
          },
        }
      )
      .then((res) => console.log(res));
  },
  async unfollow({ state }, name) {
    await this.$axios
      .post(
        "http://localhost:8080/user/unfollow",
        { username: name },
        {
          headers: {
            "Content-Type": "application/json",
          },
        }
      )
      .then((res) => console.log(res));
  },

  async block({ state }, name) {
    await this.$axios
      .post(
        "http://localhost:8080/user/block",
        { username: name },
        {
          headers: {
            "Content-Type": "application/json",
          },
        }
      )
      .then((res) => console.log(res));
  },

  async unblock({ state }, name) {
    await this.$axios
      .post(
        "http://localhost:8080/user/unblock",
        { username: name },
        {
          headers: {
            "Content-Type": "application/json",
          },
        }
      )
      .then((res) => console.log(res));
  },

  async sendMessage({ state }, text) {
    ///////////////////////////////////////
    console.log("sendMessage");
    console.log(text);
    await this.$axios
      .post(
        "http://localhost:8080/user/message/send",
        { content: text, receiver: state.selectedChatName },
        {
          headers: {
            "Content-Type": "application/json",
          },
        }
      )
      .then((res) => console.log(res));
  },

  async forwardMessage({ state }, name) {
    ///////////////////////////////////////
    console.log("sendMessage");
    console.log(name);
    console.log(state.selectedVoice.id);
    await this.$axios
      .post(
        "http://localhost:8080/user/message/send",
        { postID: state.selectedVoice.id, receiver: name },
        {
          headers: {
            "Content-Type": "application/json",
          },
        }
      )
      .then((res) => console.log(res));
  },

  async reciveMessage({ state, commit }, name) {
    console.log("recie");
    console.log(name);
    commit("openChat", name);

    let res = await this.$axios
      .post(
        "http://localhost:8080/user/message/receive",
        { username: state.selectedChatName },
        {
          headers: { "Content-Type": "application/json" },
        }
      )
      .then((res) => commit("setselectedMessage", res.data.messages));
  },

  async messageList({ commit }) {
    try {
      await fetch("http://localhost:8080/user/message/list", {
        method: "GET",
      })
        .then((response) => response.json())
        .then((data) => {
          commit("setContacts", data.senders);
        });
    } catch (err) {
      console.log(err);
    }
  },

  async sendava({ state }, content) {
    await this.$axios.post(
      "http://localhost:8080/ava/postAVA",
      { content: content },
      { headers: { "Content-Type": "application/json" } }
    );
  },

  async sendComment({ state }, text) {
    console.log("sendComment");
    console.log(text);
    console.log(parseInt(state.selectedVoice.id));
    await this.$axios
      .post(
        "http://localhost:8080/ava/postComment",
        { content: text, replyTo: parseInt(state.selectedVoice.id) },
        { headers: { "Content-Type": "application/json" } }
      )
      .then((res) => console.log(res));
  },

  async getFollowedVoices({ commit }) {
    await this.$axios
      .get("http://localhost:8080/ava/timeline")
      .then((res) => commit("setNews", res.data.timeLine));
  },

  async getComments({ commit }, ava_id) {
    await this.$axios
      .post(
        "http://localhost:8080/ava/comments",
        { id: ava_id },
        { headers: { "Content-Type": "application/json" } }
      )
      .then((res) => commit("setselectedVoice_comments", res.data.comments));
  },

  async getVoiceOfUser({ commit }, name) {
    console.log("getVoiceOfUser");
    commit("setSelectedUser_Name", name);
    await this.$axios
      .post(
        "http://localhost:8080/ava/user",
        { username: name },
        { headers: { "Content-Type": "application/json" } }
      )
      .then((res) => commit("setSelectedUser_voices", res.data.avas));
    commit("openUserPan");

    console.log(" out getVoiceOfUser");
  },

  async getselfVoice({ commit, state }) {
    console.log("getselfVoice");
    commit("setSelectedUser_Name", state.signupInfo.username);
    console.log("getselfVoice");

    await this.$axios
      .get("http://localhost:8080/ava/me", {
        headers: { "Content-Type": "application/json" },
      })
      .then((res) => commit("setSelectedUser_voices", res.data.avas));

    commit("openUserPan");
  },

  async getHashtagAva({ commit }, title) {
    await this.$axios
      .post(
        "http://localhost:8080/ava/tag",
        { tag: title },
        {
          headers: { "Content-Type": "application/json" },
        }
      )
      .then((res) => commit("setVoiceHashtag", res.data.avas));
  },

  async getHots({ commit }) {
    await this.$axios
      .get("http://localhost:8080/ava/popular")
      .then((res) => commit("sethotVoice", res.data.avas));
  },

  async likeVoice({ state }) {
    await this.$axios.post(
      "http://localhost:8080/ava/like/doLike",
      { id: state.selectedVoice.id },
      {
        headers: { "Content-Type": "application/json" },
      }
    );
  },
  async getlikeList({ state, commit }) {
    await this.$axios
      .post(
        "http://localhost:8080/ava/like/list",
        { id: state.selectedVoice.id },
        {
          headers: { "Content-Type": "application/json" },
        }
      )
      .then((res) => commit("setlikedBy", res.data.likers));
  },
  async getCountLikes({ $axios }) {
    let res = await $axios.get("/ava/like/count");
    let jsonform = res.json();
    console.log(jsonForm);
    return res;
  },
};

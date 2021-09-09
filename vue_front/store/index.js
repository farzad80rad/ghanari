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

  setFollowed(state, array) {
    state.followed = array;
  },

  setBlocked(state, array) {
    state.blocked = array;
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
    console.log(item.publishTime);
    commit("setselectedVoice_sender", item.sender);
    commit("setselectedVoice_content", item.content);
    commit("setselectedVoice_liked", item.likes);
    commit("setselectedVoice_date", item.date);
    commit("setselectedVoice_id", item.id);
    dispatch("getComments", item.id);
    commit("openVoicePan");
  },

  async axiosPost({ state }, proces) {
    console.log("enter");
    console.log(proces);
    let res = await this.$axios.post(proces.url, proces.body, {
      headers: {
        "Content-Type": "application/json",
      },
    });
    console.log("res");
    (proces.resFunc || console.log)(res);
    return res;
  },

  async axiosGet({ state }, proces) {
    console.log("enter");
    console.log(proces);
    let res = await this.$axios.get(proces.url, {
      headers: {
        "Content-Type": "application/json",
      },
    });
    (proces.resFunc || console.log)(res);
    console.log(res);
    return res;
  },

  async signup({ state, dispatch }) {
    let proces = { body: {}, url: "" };
    proces.body = {
      username: state.signupInfo.username,
      password: state.signupInfo.password,
      firstName: state.signupInfo.firstName,
      lastName: state.signupInfo.secondName,
      bio: state.signupInfo.bio,
      birthday: state.signupInfo.date,
    };
    proces.url = "http://localhost:8080/signup";
    dispatch("axiosPost", proces);
  },

  async login({ dispatch, commit, state }) {
    let proces = { body: {}, url: "" };
    proces.body = {
      username: state.signupInfo.username,
      password: state.signupInfo.password,
    };
    proces.url = "http://localhost:8080/login";
    let res = await dispatch("axiosPost", proces);
    if (res.status / 100 === 2) {
      await dispatch("messageList");
      commit("loginByName");
    }
    return res;
  },

  async follow({ dispatch }, name) {
    let proces = { body: {}, url: "" };
    proces.body = { username: name };
    proces.url = "http://localhost:8080/follow";
    dispatch("axiosPost", proces);
  },

  async unfollow({ dispatch }, name) {
    let proces = { body: {}, url: "" };
    proces.body = { username: name };
    proces.url = "http://localhost:8080/unfollow";
    dispatch("axiosPost", proces);
  },

  async block({ dispatch }, name) {
    let proces = { body: {}, url: "" };
    proces.body = { username: name };
    proces.url = "http://localhost:8080/block";
    dispatch("axiosPost", proces);
  },

  async unblock({ dispatch }, name) {
    let proces = { body: {}, url: "" };
    proces.body = { username: name };
    proces.url = "http://localhost:8080/unblock";
    dispatch("axiosPost", proces);
  },

  async sendMessage({ dispatch, state }, text) {
    let proces = { body: {}, url: "" };
    proces.body = { content: text, receiver: state.selectedChatName };
    proces.url = "http://localhost:8080/sendMessage";
    dispatch("axiosPost", proces);
  },

  async forwardMessage({ dispatch, state }, name) {
    let proces = { body: {}, url: "" };
    proces.body = { postID: state.selectedVoice.id, receiver: name };
    proces.url = "http://localhost:8080/sendMessage";
    dispatch("axiosPost", proces);
  },

  async reciveMessage({ dispatch, state, commit }, name) {
    commit("openChat", name);
    let proces = { body: {}, url: "" };
    proces.url = "http://localhost:8080/getMessages";
    proces.body = { username: name };
    let res = await dispatch("axiosPost", proces);
    commit("setselectedMessage", res.data.messages);
    commit();
  },

  async messageList({ dispatch, commit }) {
    let proces = { body: {}, url: "" };
    proces.url = "http://localhost:8080/chatList";
    let res = await dispatch("axiosGet", proces);
    commit("setContacts", res.data.senders);
  },

  async sendava({ dispatch }, content) {
    let proces = { body: {}, url: "" };
    proces.body = { content: content };
    proces.url = "http://localhost:8080/postAVA";
    dispatch("axiosPost", proces);
  },

  async sendComment({ state, dispatch }, text) {
    let proces = { body: {}, url: "" };
    proces.body = {
      content: text,
      sorcevoiceid: parseInt(state.selectedVoice.id),
    };
    proces.url = "http://localhost:8080/postComment";
    dispatch("axiosPost", proces);
  },

  async getFollowedVoices({ dispatch, commit }) {
    ////////////////////////////////////////////////////////////
    let proces = { body: {}, url: "" };
    proces.url = "http://localhost:8080/followedVoices";
    let res = await dispatch("axiosGet", proces);
    commit("setNews", res.data.timeLine);
  },

  async getFollowedUsers({ dispatch, commit }) {
    let proces = { body: {}, url: "" };
    proces.url = "http://localhost:8080/followdUserList";
    let res = await dispatch("axiosGet", proces);
    commit("setFollowed", res.data.followed);
    console.log("followed");
    console.log(res);
  },

  async getBlockedUsers({ dispatch, commit }) {
    let proces = { body: {}, url: "" };
    proces.url = "http://localhost:8080/blockedUserList";
    let res = await dispatch("axiosGet", proces);
    commit("setBlocked", res.data.blocked);
  },

  async getComments({ dispatch, commit }, ava_id) {
    let proces = { body: {}, url: "" };
    proces.body = { id: ava_id };
    proces.url = "http://localhost:8080/comments";
    let res = await dispatch("axiosPost", proces);
    commit("setselectedVoice_comments", res.data.comments);
  },

  async getVoiceOfUser({ dispatch, commit }, name) {
    ////////////////////////////////////////////////////////////
    commit("setSelectedUser_Name", name);
    let proces = { body: {}, url: "" };
    proces.body = { username: name };
    proces.url = "http://localhost:8080/userAva";
    let res = await dispatch("axiosPost", proces);
    dispatch("getFollowedUsers");
    dispatch("getBlockedUsers");
    commit("setSelectedUser_voices", res.data.avas);
    commit("openUserPan");
  },

  async getselfVoice({ dispatch, commit, state }) {
    commit("setSelectedUser_Name", state.signupInfo.username);
    let proces = { body: {}, url: "" };
    proces.url = "http://localhost:8080/myAva";
    let res = await dispatch("axiosGet", proces);
    commit("setSelectedUser_voices", res.data.avas);
    commit("openUserPan");
  },

  async getHashtagAva({ dispatch, commit }, title) {
    let proces = { body: {}, url: "" };
    proces.body = { tag: title };
    proces.url = "http://localhost:8080/tag";
    let res = await dispatch("axiosPost", proces);
    commit("setVoiceHashtag", res.data.avas);
  },

  async getHots({ commit, dispatch }) {
    let proces = { body: {}, url: "" };
    proces.url = "http://localhost:8080/popular";
    let res = await dispatch("axiosGet", proces);
    commit("sethotVoice", res.data.avas);
  },

  async likeVoice({ state, dispatch }) {
    let proces = { body: {}, url: "" };
    proces.body = { id: state.selectedVoice.id };
    proces.url = "http://localhost:8080/doLike";
    dispatch("axiosPost", proces);
  },

  async getlikeList({ state, dispatch, commit }) {
    let proces = { body: {}, url: "" };
    proces.body = { id: state.selectedVoice.id };
    proces.url = "http://localhost:8080/likerList";
    let res = await dispatch("axiosPost", proces);
    commit("setlikedBy", res.data.likers);
  },
};

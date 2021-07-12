
export const state = () => ({
    state: "login",
    validAuth: false,
    userName: null,
    followed: ["p1", "p2", "p3", "p4", "p5"],
    blocked: ["p4", "p7", "p3"],
    likedBy: ["p1", "p2"],
    hotVoice: [{ "sender": "p1", "liked": 10, "id": 0, "content": "ey khodaaaa" },
    { "sender": "p1", "liked": 80, "id": 1, "content": "ey khodaaaa" },
    { "sender": "p2", "liked": 10, "id": 2, "content": "ey khodaaaa ajab zendigei shodeeee eeee eeeeee fff ffff fff ffff ffff ffff ffff ffff ffff ffff ffff eee" },
    { "sender": "p1", "liked": 130, "id": 3, "content": "ey khodaaaa heeeeeeeeey" },
    { "sender": "p4", "liked": 10, "id": 4, "content": "ey khodaaaa" },
    { "sender": "p1", "liked": 5, "id": 5, "content": "ey khodaaaa kslkdflask" },
    { "sender": "p1", "liked": 10, "id": 6, "content": "ey khodaaaa" },
    { "sender": "p5", "liked": 180, "id": 7, "content": "ey khodaaaa god bless me" }],
    contacts: ["p1", "p2", "p3", "p4", "p5", "p6", "p9"],
    newVoices: [{ "sender": "p1", "id": 1, "content": "ey khodaaaa" },
    { "sender": "p2", "id": 2, "content": "ey khodaaaa" },
    { "sender": "p1", "id": 3, "content": "ey khodaaaa" },],
    selectedVoice: {
        "sender": "p2", "content": "zooo must be zoo. and zoo cant be zooo . it means zoo cant be zooo", "liked": 20, "date": "2020/05/2 20:34:20", "comments": [
            { "sender": "p3", "content": "bulls hitskd flksdfj llskjalk fjlkasdj fksjdfkal", "date": "2020/05/2 20:34:20", "id": 1 },
            { "sender": "p6", "content": "bullshit", "date": "2020/04/2 20:34:20", "id": 2 },
            { "sender": "p4", "content": "bullshit", "date": "2020/05/2 26:34:20", "id": 3 },
            { "sender": "p3", "content": "bullshit", "date": "2020/06/2 20:34:20", "id": 4 },
            { "sender": "p9", "content": "bullshit", "date": "2020/09/2 23:34:20", "id": 5 },
        ]
    }, selecteduser: {
        "name": "p2", "biography": "im using ghanari", "birthDate": "2020/05/2 20:34:20", "joinDate": "2020/05/2 20:34:20", "voices": [
            { "sender": "p2", "content": "hi all", "date": "2020/05/2 20:34:20", "id": 1 },
            { "sender": "p2", "content": "this", "date": "2020/04/2 20:34:20", "id": 2 },
            { "sender": "p2", "content": "must", "date": "2020/05/2 26:34:20", "id": 3 },
            { "sender": "p2", "content": "be", "date": "2020/06/2 20:34:20", "id": 4 },
            { "sender": "p2", "content": "somthing", "date": "2020/09/2 23:34:20", "id": 5 },
        ]
    },
    loginLogs: ["2020/10/04 20:10:03", "2020/10/04 20:10:03", "2020/10/04 20:10:03", "2020/10/04 20:10:03", "2020/10/04 20:10:03"],
    selectedChatName: '',
    selectedMessage: [{ "id": 0, "sender": "p1", "voiceSender": "", "content": "hi", "date": "2020/10/04 20:10:03" },
    { "sender": "p2", "id": 1, "voiceSender": "", "content": "hi", "date": "2020/10/04 20:10:03" },
    { "sender": "p2", "id": 11, "voiceSender": "", "content": "hi", "date": "2020/10/04 20:10:03" },
    { "sender": "p2", "id": 13, "voiceSender": "", "content": "hi", "date": "2020/10/04 20:10:03" },
    { "sender": "p2", "id": 14, "voiceSender": "", "content": "hi", "date": "2020/10/04 20:10:03" },
    { "sender": "p1", "id": 2, "voiceSender": "", "content": "how are you?", "date": "2020/10/04 20:10:03" },
    { "sender": "p1", "id": 3, "voiceSender": "", "content": "hi", "date": "2020/10/04 20:10:03" },
    { "sender": "p2", "id": 4, "voiceSender": "", "content": "seid how are you?", "date": "2020/10/04 20:10:03" },
    { "sender": "p1", "id": 5, "voiceSender": "", "content": "hi", "date": "2020/10/04 20:10:03" },
    { "sender": "p2", "id": 6, "voiceSender": "", "content": "hiiiiii", "date": "2020/10/04 20:10:03" },
    { "sender": "p1", "id": 7, "voiceSender": "", "content": "hi", "date": "2020/10/04 20:10:03" },
    { "sender": "p1", "id": 8, "voiceSender": "p2", "content": "hiiiiii", "date": "2020/10/04 20:10:03" },
    ],

});

export const mutations = {
    loginByName: (state, username) => {
        state.userName = username;
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
        state.state = 'voice';
    },
    openChat(state, name) {
        state.selectedChatName = name;
        state.state = 'chat';
    },
    openUserPan(state) {
        state.state = 'user';
    },
};
export const actions = {
    tryToSubmit({ commit }) {
        commit('goToLogin');
    }
};



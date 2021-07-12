<template>
  <div class="body" id="login">
    <h3 class="text-center text-white pt-5">Ghanari</h3>
    <div class="container">
      <div id="login-row" class="row justify-content-center align-items-center">
        <div id="login-column" class="col-md-6">
          <div id="login-box" class="col-md-12">
            <form id="login-form" class="form" action="" method="post">
              <h3 class="text-center text-info">Login</h3>
              <div class="form-group">
                <label for="username" class="text-info">Username:</label><br />
                <input
                  type="text"
                  v-model="username"
                  name="username"
                  id="username"
                  class="form-control"
                />
              </div>
              <div class="form-group">
                <label for="password" class="text-info">Password:</label><br />
                <input
                  type="text"
                  name="password"
                  id="password"
                  v-model="password"
                  class="form-control"
                />
              </div>
              <div
                class="form-group row justify-content-center align-items-center"
              >
                <input
                  type="submit"
                  name="submit"
                  @click="tryToLogin()"
                  class="btn btn-info btn-md col-3"
                  value="submit"
                />
              </div>
              <br />
              <div id="register-link" @click="goToSubmit()" class="text-right">
                <a href="#" class="text-info">Register here</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: '',
      password: '',
    }
  },
  methods: {
    tryToLogin() {
      this.$store.commit('loginByName', this.username)
    },
    goToSubmit() {
      this.$store.commit('goToSubmit')
    },
  },
}
</script>

<style lang="css" scoped>
.body {
  margin: 0;
  padding: 0;
  background-color: #17a2b8;
  height: 100vh;
}
#login .container #login-row #login-column #login-box {
  margin-top: 120px;
  max-width: 600px;
  height: 320px;
  border: 1px solid #9c9c9c;
  background-color: #eaeaea;
}
#login .container #login-row #login-column #login-box #login-form {
  padding: 20px;
}
#login
  .container
  #login-row
  #login-column
  #login-box
  #login-form
  #register-link {
  margin-top: -85px;
}
</style>

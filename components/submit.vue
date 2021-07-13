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
                  required
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
                  required
                />
              </div>
              <div class="form-group">
                <label for="firstName" class="text-info">firstName:</label
                ><br />
                <input
                  type="text"
                  name="firstName"
                  id="firstName"
                  v-model="firstName"
                  class="form-control"
                  required
                />
                <label for="secondName" class="text-info">secondName:</label
                ><br />
                <input
                  type="text"
                  name="secondName"
                  id="secondName"
                  v-model="secondName"
                  class="form-control"
                  required
                />
              </div>
              <div class="form-group">
                <label for="biography" class="text-info">Biography:</label
                ><br />
                <input
                  type="text"
                  name="biography"
                  id="biography"
                  v-model="biography"
                  class="form-control"
                />
              </div>
              <div class="form-group">
                <label for="BirthDate" class="text-info">BirthDate:</label
                ><br />
                <input
                  type="Date"
                  name="BirthDate"
                  id="BirthDate"
                  v-model="BirthDate"
                  class="form-control"
                  required
                />
              </div>

              <div
                class="form-group row justify-content-center align-items-center"
              >
                <input
                  type="button"
                  name="submit"
                  @click="signup(username,fistName,secondName,password,biography,BirthDate)"
                  class="btn btn-info mb-4 btn-md col-3"
                  value="submit"
                />
              </div>
              <br />
              <div id="register-link" @click="goTologin()" class="text-right">
                <a href="#" class="text-info">back to login</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  data() {
    return {
      username: '',
      password: '',
      biography: '',
      firstName: '',
      secondName: '',
      BirthDate: '',
    }
  },
  methods: {
    ...mapActions([
      'signup', //also supports payload `this.nameOfAction(amount)`
    ]),
    goTologin() {
      this.$store.commit('goTologin')
    },
  },
}
</script>

<style lang="css" scoped>
.body {
  margin: 0;
  padding: 0;
  background-color: #17a2b8;
  height: 150vh;
}
#login .container #login-row #login-column #login-box {
  margin-top: 120px;
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

<template>
<div class="top_pad">
  <div class="container ">
	<div class="d-flex justify-content-center align-items-center text-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Sign In</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fab fa-facebook-square"></i></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>
			</div>
			<div class="card-body">
				<form>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" v-model="data_username" class="form-control" placeholder="username">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" v-model="data_password" class="form-control" placeholder="password">
					</div>
					<div class="form-group justify-content-center align-items-center row">
						<input type="button" @click="tryToLogin()" value="Login" class="btn col-3  float-right login_btn">
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					Don't have an account?<a @click="goToSubmit()" class="link" href="#" >Sign Up</a>
				</div>
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
      data_username: '',
      data_password: '',
    }
  },

  

  methods: {
    tryToLogin() {
      this.$store.commit('setpassword',this.data_password);
      this.$store.commit('setusername',this.data_username);
      this.$store.dispatch('login');
    },
    goToSubmit() {
      this.$store.commit('goToSubmit')
    },
  },
}

</script>

<style lang="css" scoped>

@import url('https://fonts.googleapis.com/css?family=Numans');

.top_pad{
  background-color: chocolate;
  height: 100vh;
  background-image: url('../static/loginBack.jpg');
  background-size: cover;
  background-repeat: no-repeat;
  font-family: 'Numans', sans-serif;

}

.container{
height: 100%;
align-content: center;
}

.card{
height: 370px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFC312;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h3{
color: white;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #FFC312;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color: #FFC312;
width: 100px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links:hover{
  color: white;
}

.links a{
margin-left: 4px;
}
</style>

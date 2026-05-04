<template>
	<div>
		<div class="login-container" :style="{'backgroundImage': indexBgUrl?`url(${$base.url + indexBgUrl})`:''}">
			<el-form class="login_form animate__animated animate__">
				<div class="login_form2">
					<div class="title-container">基于SpringBoot社区团购平台的设计与实现登录</div>
					<div v-if="loginType==1" class="list-item">
						<input placeholder="请输入账号：" name="username" type="text" v-model="rulesForm.username">
					</div>
					<div v-if="loginType==1" class="list-item">
						<div class="password-box">
							<input placeholder="请输入密码：" name="password" :type="showPassword?'text':'password'" v-model="rulesForm.password">
							<span class="icon iconfont" :class="showPassword?'icon-liulan13':'icon-liulan17'" @click="showPassword=!showPassword"></span>
						</div>
					</div>

					<div class="list-item select" v-if="roles.length>1&&loginType<=2">
						<el-select v-model="rulesForm.role" placeholder="请选择角色：">
							<el-option v-if="loginType==1||(loginType==2&&item.role!='users')" v-for="item in roles" :key="item.roleName" :label="item.roleName" :value="item.roleName" />
						</el-select>
					</div>

		
					<div class="login-btn">
						<div class="login-btn1">
							<el-button v-if="loginType==1||loginType==3||loginType==4" type="primary" @click="login()" class="loginInBt">登录</el-button>
						</div>
						<div class="login-btn2">
							<el-button type="primary" @click="register('shangjia')" class="register">
								注册商家							</el-button>
						</div>
						<div class="login-btn3">
						</div>
					</div>
				</div>
				<div class="idea-box1">欢迎使用</div>
				<div class="idea-box2">欢迎您登录系统</div>
			</el-form>
		</div>
	</div>
</template>
<script>
	import 'animate.css'
	import menu from "@/utils/menu";
	export default {
		data() {
			return {
				verifyCheck2: false,
				flag: false,
				baseUrl:this.$base.url,
				loginType: 1,
				rulesForm: {
					username: "",
					password: "",
					role: "",
				},
				menus: [],
				roles: [],
				tableName: "",
				showPassword: false,
				indexBgUrl: '',
			};
		},
		mounted() {
			let menus = menu.list();
			this.menus = menus;

			for (let i = 0; i < this.menus.length; i++) {
				if (this.menus[i].hasBackLogin=='是') {
					this.roles.push(this.menus[i])
				}
			}

		},
		created() {
			this.$http.get('config/info?name=bLoginBackgroundImg',).then(rs=>{this.indexBgUrl = rs.data.data?rs.data.data.value:''})
		},
		destroyed() {
		},
		components: {
		},
		methods: {

			//注册
			register(tableName){
				this.$storage.set("loginTable", tableName);
				this.$router.push({path:'/register',query:{pageFlag:'register'}})
			},
			// 登陆
			login() {
				if(this.loginType==1) {

					if (!this.rulesForm.username) {
						this.$message.error("请输入用户名");
						return;
					}
					if (!this.rulesForm.password) {
						this.$message.error("请输入密码");
						return;
					}
					if(this.roles.length>1) {
						if (!this.rulesForm.role) {
							this.$message.error("请选择角色");
							return;
						}
					
						for (let i = 0; i < this.roles.length; i++) {
							if (this.roles[i].roleName == this.rulesForm.role) {
								this.tableName = this.roles[i].tableName;
							}
						}
					} else {
						this.tableName = this.roles[0].tableName;
						this.rulesForm.role = this.roles[0].roleName;
					}
				}
		
				this.loginPost()
			},
			loginPost() {
				this.$http({
					url: `${this.tableName}/login?username=${this.rulesForm.username}&password=${this.rulesForm.password}`,
					method: "post"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						if(this.$storage.get('nowLocation')){
							let location = this.$storage.get('nowLocation')
							this.$storage.set('beforeLocation',location)
						}
						if(this.$storage.get('nowTime')){
							let times = this.$storage.get('nowTime')
							this.$storage.set('beforeTime',times)
						}
						this.$storage.set("Token", data.token);
						this.$storage.set("role", this.rulesForm.role);
						this.$storage.set("sessionTable", this.tableName);
						this.$storage.set("adminName", this.rulesForm.username);
						this.$nextTick(()=>{
							this.$http({
								url: this.tableName + '/session',
								method: "get"
							}).then(({
								data
							}) => {
								if (data && data.code === 0) {
									if(this.tableName == 'yonghu') {
										this.$storage.set('headportrait',data.data.touxiang)
									}
									if(this.tableName == 'shangjia') {
										this.$storage.set('headportrait',data.data.touxiang)
									}
									if(this.tableName == 'users') {
										this.$storage.set('headportrait',data.data.image)
									}
									this.$storage.set('userForm',JSON.stringify(data.data))
									this.$storage.set('userid',data.data.id);
								} else {
									let message = this.$message
									message.error(data.msg);
								}
								this.$router.replace({ path: "/" });
							});
						})
					}
					else {
						this.$message.error(data.msg);
					}
				});
			},
		}
	}
</script>

<style lang="scss" scoped>
.login-container {
	min-height: 100vh;
	position: relative;
	background-repeat: no-repeat;
	background-position: center center;
	background-size: cover;
	background: url(http://codegen.caihongy.cn/20260116/d32f50801c634085a7bcc61b5bab73b5.jpg) no-repeat center center / 100% 100%;
	background-repeat: no-repeat;
	background-size: cover !important;
	background: url(http://codegen.caihongy.cn/20260116/d32f50801c634085a7bcc61b5bab73b5.jpg) no-repeat center center / 100% 100%;
	display: flex;
	width: 100%;
	min-height: 100vh;
	justify-content: center;
	align-items: center;
	background-position: center bottom;
	position: relative;

	.login_form {
		border-radius: 10px;
		padding: 40px 0px 20px;
		margin: auto 214px auto 0;
		z-index: 1;
		flex-direction: column;
		background: none;
		display: flex;
		width: 100%;
		align-items: flex-end;
		flex-wrap: wrap;
		height: auto;
		.login_form2 {
			border: 0;
			border-radius: 24px;
			padding: 80px 30px 20px 30px;
			margin: -80px 0 0 0;
			background: none;
			width: 592px;
		}
		.title-container {
			padding: 0px 20px;
			margin: 10px 0 10px 0;
			color: #333;
			font-weight: 600;
			font-size: 40px;
			line-height: 1.2;
			text-shadow: none;
			top: 33%;
			left: 140px;
			background: none;
			width: 48%;
			position: absolute;
			text-align: left;
		}
		.list-item {
			margin: 0 auto 25px;
			background: none;
			display: flex;
			width: 100%;
			align-items: center;
			flex-wrap: wrap;
			input {
				border: 1px solid #DADFE6;
				border-radius: 0px;
				padding: 0 10px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				color: #333;
				background: #FFFFFF;
				flex: 1;
				width: 100%;
				font-size: 18px;
				height: 64px;
			}
			input:focus {
				border-radius: 0px;
				padding: 0 10px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				color: #333;
				background: #FFFFFF;
				flex: 1;
				width: 100%;
				font-size: 18px;
				border-color: #d1d1d1;
				border-width: 0 0 0px;
				border-style: solid;
				height: 64px;
			}
			.password-box {
				flex: 1;
				display: flex;
				width: 100%;
				position: relative;
				align-items: center;
				input {
					border: 1px solid #DADFE6;
					border-radius: 0px;
					padding: 0 10px;
					box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
					color: #333;
					background: #FFFFFF;
					flex: 1;
					width: 100%;
					font-size: 24px;
					height: 64px;
				}
				input:focus {
					border-radius: 0px;
					padding: 0 10px;
					box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
					color: #333;
					background: #FFFFFF;
					flex: 1;
					width: 100%;
					font-size: 24px;
					border-color: #d1d1d1;
					border-width: 0 0 0px;
					border-style: solid;
					height: 64px;
				}
				.iconfont {
					cursor: pointer;
					z-index: 1;
					color: #000;
					top: 0;
					font-size: 16px;
					line-height: 64px;
					position: absolute;
					right: 10px;
				}
			}
			input::placeholder {
				color: #C3C7CC;
				font-size: 16px;
			}
			/deep/ .el-select {
				margin: 0 0 18px 0;
				flex: 1;
				width: 100%;
			}
			/deep/ .el-select .el-input__inner {
				border: 1px solid #DADFE6;
				border-radius: 0px;
				padding: 0 10px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				color: #333;
				background: #FFFFFF;
				flex: 1;
				width: 100%;
				font-size: 18px;
				height: 64px;
			}
			/deep/ .el-select .is-focus .el-input__inner {
				border-radius: 0px;
				padding: 0 10px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				color: #333;
				background: #FFFFFF;
				flex: 1;
				width: 100%;
				font-size: 18px;
				border-color: #d1d1d1;
				border-width: 0 0 0px;
				border-style: solid;
				height: 64px;
			}
			/deep/ .el-select .el-input__inner::placeholder{
				color: #C3C7CC;
				font-size: 16px;
			}
		}
		.login-btn {
			margin: 20px auto;
			display: flex;
			width: 100%;
			align-items: center;
			flex-wrap: wrap;
			.login-btn1 {
				width: 100%;
				order: 2;
			}
			.login-btn2 {
				z-index: 9;
			}
			.login-btn3 {
				z-index: 2;
				flex: 1;
			}
			.loginInBt {
				border: 0;
				cursor: pointer;
				padding: 0 24px;
				margin: 0 0 20px;
				color: #FFFFFF;
				font-weight: bold;
				font-size: 20px;
				border-radius: 24px;
				box-shadow: inset 0px -3px 6px 1px #FFFFF;
				outline: none;
				background: #333333;
				width: 100%;
				height: 53px;
			}
			.loginInBt:hover {
				opacity: 0.8;
			}
			.register {
				border: 0px solid #333;
				cursor: pointer;
				padding: 0 10px;
				margin: 0 10px 15px 0;
				color: #333;
				font-weight: bold;
				text-decoration: underline;
				font-size: 16px;
				border-radius: 0px;
				outline: none;
				background: none;
				width: auto;
				height: 36px;
			}
			.register:hover {
				opacity: 0.8;
			}
			.forget {
				border: 0;
				cursor: pointer;
				padding: 0 10px;
				margin: 0 0 15px 5px;
				color: #333333;
				font-weight: bold;
				text-decoration: underline;
				font-size: 15px;
				border-radius: 0px;
				outline: none;
				background: none;
				width: 100%;
				text-align: right;
				height: 36px;
			}
			.forget:hover {
				opacity: 0.8;
			}
		}
	}
	.idea-box1 {
		margin: 0 4% 0 0;
		top: 46%;
		color: #333;
		left: 160px;
		font-weight: 600;
		width: 550px;
		font-size: 56px;
		position: absolute;
		height: auto;
		order: -2;
	}
	.idea-box2 {
		margin: 0;
		z-index: 9;
		color: #555;
		top: -20px;
		left: 30px;
		font-weight: bold;
		width: 592px;
		font-size: 26px;
		position: relative;
		height: auto;
		order: -1;
	}
}

</style>

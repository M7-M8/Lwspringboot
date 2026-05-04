<template>
	<div>
		<div class="register-container" :style="{'backgroundImage': indexBgUrl?`url(${$base.url + indexBgUrl})`:''}">
			<el-form v-if="pageFlag=='register'" ref="ruleForm" class="rgs-form animate__animated animate__" :model="ruleForm" :rules="rules">
				<div class="rgs-form2">
					<div class="title">基于SpringBoot社区团购平台的设计与实现</div>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('zhanghao')?'required':''">账号：</div>
						<el-input  v-model="ruleForm.zhanghao" :readonly="ro.zhanghao" autocomplete="off" placeholder="账号"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('mima')?'required':''">密码：</div>
						<el-input  v-model="ruleForm.mima" :readonly="ro.mima" autocomplete="off" placeholder="密码"  type="password"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('mima')?'required':''">确认密码：</div>
						<el-input  v-model="ruleForm.mima2" autocomplete="off" placeholder="确认密码" type="password" :readonly="ro.mima" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('xingming')?'required':''">姓名：</div>
						<el-input  v-model="ruleForm.xingming" :readonly="ro.xingming" autocomplete="off" placeholder="姓名"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('xingbie')?'required':''">性别：</div>
						<el-select filterable v-model="ruleForm.xingbie" placeholder="请选择性别" :disabled="ro.xingbie">
							<el-option
								v-for="(item,index) in yonghuxingbieOptions"
								v-bind:key="index"
								:label="item"
								:value="item">
							</el-option>
						</el-select>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('shouji')?'required':''">手机：</div>
						<el-input  v-model="ruleForm.shouji" :readonly="ro.shouji" autocomplete="off" placeholder="手机"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('touxiang')?'required':''">头像：</div>
						<file-upload
							tip="点击上传头像"
							action="file/upload"
							:limit="3"
							:multiple="true"
							:fileUrls="ruleForm.touxiang?ruleForm.touxiang:''"
							@change="yonghutouxiangUploadChange"
						></file-upload>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('shequ')?'required':''">社区：</div>
						<el-select filterable v-model="ruleForm.shequ" placeholder="请选择社区" :disabled="ro.shequ">
							<el-option
								v-for="(item,index) in yonghushequOptions"
								v-bind:key="index"
								:label="item"
								:value="item">
							</el-option>
						</el-select>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('pquestion')?'required':''">密保问题：</div>
						<el-input  v-model="ruleForm.pquestion" :readonly="ro.pquestion" autocomplete="off" placeholder="密保问题"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='yonghu'">
						<div class="lable" :class="changeRules('panswer')?'required':''">密保答案：</div>
						<el-input  v-model="ruleForm.panswer" :readonly="ro.panswer" autocomplete="off" placeholder="密保答案"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='shangjia'">
						<div class="lable" :class="changeRules('dianpuming')?'required':''">店铺名：</div>
						<el-input  v-model="ruleForm.dianpuming" :readonly="ro.dianpuming" autocomplete="off" placeholder="店铺名"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='shangjia'">
						<div class="lable" :class="changeRules('mima')?'required':''">密码：</div>
						<el-input  v-model="ruleForm.mima" :readonly="ro.mima" autocomplete="off" placeholder="密码"  type="password"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='shangjia'">
						<div class="lable" :class="changeRules('mima')?'required':''">确认密码：</div>
						<el-input  v-model="ruleForm.mima2" autocomplete="off" placeholder="确认密码" type="password" :readonly="ro.mima" />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='shangjia'">
						<div class="lable" :class="changeRules('fuzeren')?'required':''">负责人：</div>
						<el-input  v-model="ruleForm.fuzeren" :readonly="ro.fuzeren" autocomplete="off" placeholder="负责人"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='shangjia'">
						<div class="lable" :class="changeRules('xingbie')?'required':''">性别：</div>
						<el-select filterable v-model="ruleForm.xingbie" placeholder="请选择性别" :disabled="ro.xingbie">
							<el-option
								v-for="(item,index) in shangjiaxingbieOptions"
								v-bind:key="index"
								:label="item"
								:value="item">
							</el-option>
						</el-select>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='shangjia'">
						<div class="lable" :class="changeRules('lianxidianhua')?'required':''">联系电话：</div>
						<el-input  v-model="ruleForm.lianxidianhua" :readonly="ro.lianxidianhua" autocomplete="off" placeholder="联系电话"  type="text"  />
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='shangjia'">
						<div class="lable" :class="changeRules('touxiang')?'required':''">头像：</div>
						<file-upload
							tip="点击上传头像"
							action="file/upload"
							:limit="3"
							:multiple="true"
							:fileUrls="ruleForm.touxiang?ruleForm.touxiang:''"
							@change="shangjiatouxiangUploadChange"
						></file-upload>
					</el-form-item>
					<el-form-item class="list-item" v-if="tableName=='shangjia'">
						<div class="lable" :class="changeRules('zizhiwenjian')?'required':''">资质文件：</div>
						<file-upload
							tip="点击上传资质文件"
							action="file/upload"
							:limit="3"
							:type="3"
							:multiple="true"
							:fileUrls="ruleForm.zizhiwenjian?ruleForm.zizhiwenjian:''"
							@change="shangjiazizhiwenjianUploadChange"
						></file-upload>
					</el-form-item>
					<div class="register-btn">
						<div class="register-btn1">
							<button type="button" class="r-btn" @click="login()">注册</button>
						</div>
						<div class="register-btn2">
							<div class="r-login" @click="close()">取消</div>
						</div>
					</div>
				</div>
			</el-form>
		</div>
	</div>
</template>

<script>
	import 'animate.css'
export default {
	data() {
		return {
			ruleForm: {
			},
			forgetForm: {},
            pageFlag : '',
			tableName:"",
			rules: {},
			ro: {},
            yonghuxingbieOptions: [],
            yonghushequOptions: [],
            shangjiaxingbieOptions: [],
			indexBgUrl: '',
		};
	},
	mounted(){
		this.pageFlag = this.$route.query.pageFlag
		if(this.$route.query.pageFlag=='register'){
			
			let table = this.$storage.get("loginTable");
			this.tableName = table;
			if(this.tableName=='yonghu'){
				this.ruleForm = {
					zhanghao: '',
					mima: '',
					xingming: '',
					xingbie: '',
					shouji: '',
					touxiang: '',
					shequ: '',
					sfsh: '',
					shhf: '',
					money: '',
					pquestion: '',
					panswer: '',
					status: '',
				}
				this.ro = {
					zhanghao: false,
					mima: false,
					xingming: false,
					xingbie: false,
					shouji: false,
					touxiang: false,
					shequ: false,
					sfsh: false,
					shhf: false,
					money: false,
					pquestion: false,
					panswer: false,
					status: false,
				}
			}
			if(this.tableName=='shangjia'){
				this.ruleForm = {
					dianpuming: '',
					mima: '',
					fuzeren: '',
					xingbie: '',
					lianxidianhua: '',
					touxiang: '',
					zizhiwenjian: '',
					sfsh: '',
					shhf: '',
					money: '',
					status: '',
				}
				this.ro = {
					dianpuming: false,
					mima: false,
					fuzeren: false,
					xingbie: false,
					lianxidianhua: false,
					touxiang: false,
					zizhiwenjian: false,
					sfsh: false,
					shhf: false,
					money: false,
					status: false,
				}
			}
			if ('yonghu' == this.tableName) {
				this.rules.zhanghao = [{ required: true, message: '请输入账号', trigger: 'blur' }]
			}
			if ('yonghu' == this.tableName) {
				this.rules.mima = [{ required: true, message: '请输入密码', trigger: 'blur' }]
			}
			if ('yonghu' == this.tableName) {
				this.rules.xingming = [{ required: true, message: '请输入姓名', trigger: 'blur' }]
			}
			if ('yonghu' == this.tableName) {
				this.rules.xingbie = [{ required: true, message: '请输入性别', trigger: 'blur' }]
			}
			if ('shangjia' == this.tableName) {
				this.rules.dianpuming = [{ required: true, message: '请输入店铺名', trigger: 'blur' }]
			}
			if ('shangjia' == this.tableName) {
				this.rules.mima = [{ required: true, message: '请输入密码', trigger: 'blur' }]
			}
			this.yonghuxingbieOptions = "男,女".split(',')
			this.$http({
				url: `option/shequxinxi/shequ`,
				method: "get",
			}).then(({ data }) => {
				if (data && data.code === 0) {
					this.yonghushequOptions = data.data;
				} else {
					this.$message.error(data.msg);
				}
			});
			this.shangjiaxingbieOptions = "男,女".split(',')
		}
	},
	created() {
		this.$http.get('config/info?name=bRegisterBackgroundImg',).then(rs=>{this.indexBgUrl = rs.data.data?rs.data.data.value:''})
	},
	destroyed() {
		  	},
	methods: {
		changeRules(name){
			if(this.rules[name]){
				return true
			}
			if(name == 'pquestion'||name=='panswer') {
				return true
			}
			return false
		},
		// 获取uuid
		getUUID () {
			return new Date().getTime();
		},
		close(){
			this.$router.push({ path: "/login" });
		},
        yonghutouxiangUploadChange(fileUrls) {
            this.ruleForm.touxiang = fileUrls;
        },
        shangjiatouxiangUploadChange(fileUrls) {
            this.ruleForm.touxiang = fileUrls;
        },
        shangjiazizhiwenjianUploadChange(fileUrls) {
            this.ruleForm.zizhiwenjian = fileUrls;
        },

        // 多级联动参数


		// 注册
		login() {
			var url=this.tableName+"/register";
			  if(this.tableName=='yonghu'){
				  this.ruleForm.sfsh = '待审核'
			  }
			if((!this.ruleForm.zhanghao) && `yonghu` == this.tableName){
				this.$message.error(`账号不能为空`);
				return
			}
			if((!this.ruleForm.mima) && `yonghu` == this.tableName){
				this.$message.error(`密码不能为空`);
				return
			}
			if((this.ruleForm.mima!=this.ruleForm.mima2) && `yonghu` == this.tableName){
				this.$message.error(`两次密码输入不一致`);
				return
			}
			if((!this.ruleForm.xingming) && `yonghu` == this.tableName){
				this.$message.error(`姓名不能为空`);
				return
			}
			if((!this.ruleForm.xingbie) && `yonghu` == this.tableName){
				this.$message.error(`性别不能为空`);
				return
			}
			if(`yonghu` == this.tableName && this.ruleForm.shouji &&(!this.$validate.isMobile(this.ruleForm.shouji))){
				this.$message.error(`手机应输入手机格式`);
				return
			}
            if(this.ruleForm.touxiang!=null) {
                this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url,"g"),"");
            }
			if(`yonghu` == this.tableName && this.ruleForm.pquestion==''){
				this.$message.error(`密保问题不能为空`);
				return
			}
			if(`yonghu` == this.tableName && this.ruleForm.panswer==''){
				this.$message.error(`密保答案不能为空`);
				return
			}
			  if(this.tableName=='shangjia'){
				  this.ruleForm.sfsh = '待审核'
			  }
			if((!this.ruleForm.dianpuming) && `shangjia` == this.tableName){
				this.$message.error(`店铺名不能为空`);
				return
			}
			if((!this.ruleForm.mima) && `shangjia` == this.tableName){
				this.$message.error(`密码不能为空`);
				return
			}
			if((this.ruleForm.mima!=this.ruleForm.mima2) && `shangjia` == this.tableName){
				this.$message.error(`两次密码输入不一致`);
				return
			}
			if(`shangjia` == this.tableName && this.ruleForm.lianxidianhua &&(!this.$validate.isMobile(this.ruleForm.lianxidianhua))){
				this.$message.error(`联系电话应输入手机格式`);
				return
			}
            if(this.ruleForm.touxiang!=null) {
                this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url,"g"),"");
            }
            if(this.ruleForm.zizhiwenjian!=null) {
                this.ruleForm.zizhiwenjian = this.ruleForm.zizhiwenjian.replace(new RegExp(this.$base.url,"g"),"");
            }
			this.$http({
				url: url,
				method: "post",
				data:this.ruleForm
			}).then(({ data }) => {
				if (data && data.code === 0) {
					this.$message({
						message: "注册成功",
						type: "success",
						duration: 1500,
						onClose: () => {
							this.$router.replace({ path: "/login" });
						}
					});
				} else {
					this.$message.error(data.msg);
				}
			});
		},
	}
};
</script>

<style lang="scss" scoped>
.register-container {
	position: relative;
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
	.rgs-form {
		.rgs-form2 {
		border: 0;
		border-radius: 24px;
		padding: 30px 0;
		margin: 0 auto;
		background: none;
		width: 685px;
		}
		border-radius: 10px;
		padding: 40px 0px 20px;
		margin: auto 0 auto 136px;
		z-index: 1;
		flex-direction: column;
		background: none;
		display: flex;
		width: 100%;
		flex-wrap: wrap;
		height: auto;
		.title {
			margin: 10px 0 10px 0;
			text-shadow: none;
			color: #333333;
			background: none;
			font-weight: 600;
			width: 100%;
			font-size: 26px;
			line-height: 44px;
			text-align: center;
		}
		.list-item {
			border: 0px solid #d6d6d6;
			border-radius: 0px;
			padding: 0;
			margin: 15px 0;
			background: none;
			width: 100%;
			position: relative;
			height: auto;
			/deep/ .el-form-item__content {
				display: block;
			}
			.lable {
				padding: 0 10px 0 0;
				color: #000000;
				left: -130px;
				width: 130px;
				font-size: 16px;
				line-height: 62px;
				position: absolute !important;
				text-align: right;
			}
			.el-input {
				display: flex;
				width: 100%;
			}
			.el-input /deep/ .el-input__inner {
				border: 1px solid #DADFE6;
				border-radius: 4px;
				padding: 0 10px;
				color: #333;
				background: #FFFFFF;
				width: 100%;
				font-size: 16px;
				height: 52px;
			}
			.el-input /deep/ .el-input__inner:focus {
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
				height: 52px;
			}
			.el-input-number {
				display: flex;
				width: 100%;
			}
			.el-input-number /deep/ .el-input__inner {
				text-align: center;
				border: 1px solid #DADFE6;
				border-radius: 4px;
				padding: 0 10px;
				color: #333;
				background: #FFFFFF;
				width: 100%;
				font-size: 16px;
				height: 52px;
			}
			.el-input-number /deep/ .el-input__inner:focus {
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
				height: 52px;
			}
			.el-input-number /deep/ .el-input-number__decrease {
				display: none;
			}
			.el-input-number /deep/ .el-input-number__increase {
				display: none;
			}
			.el-select {
				width: 100%;
			}
			.el-select /deep/ .el-input__inner {
				border: 1px solid #DADFE6;
				border-radius: 0px;
				padding: 0 10px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				color: #333;
				background: #FFFFFF;
				flex: 1;
				width: 100%;
				font-size: 18px;
				height: 52px;
			}
			.el-select /deep/ .el-input__inner:focus {
				border: 1px solid #DADFE6;
				border-radius: 0px;
				padding: 0 10px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				color: #333;
				background: #FFFFFF;
				flex: 1;
				width: 100%;
				font-size: 18px;
				height: 52px;
			}
			.el-date-editor {
				width: 100%;
			}
			.el-date-editor /deep/ .el-input__inner {
				border: 1px solid #DADFE6;
				border-radius: 0px;
				padding: 0 30px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				color: #333;
				background: #FFFFFF;
				flex: 1;
				width: 100%;
				font-size: 18px;
				height: 52px;
			}
			.el-date-editor /deep/ .el-input__inner:focus {
				border: 1px solid #DADFE6;
				border-radius: 0px;
				padding: 0 30px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				color: #333;
				background: #FFFFFF;
				flex: 1;
				width: 100%;
				font-size: 18px;
				height: 52px;
			}
			.el-date-editor.el-input {
				width: 100%;
			}
			/deep/ .el-upload--picture-card {
				background: transparent;
				border: 0;
				border-radius: 0;
				width: auto;
				height: auto;
				line-height: initial;
				vertical-align: middle;
			}
			/deep/ .upload .upload-img {
				border: 1px solid #ddd;
				cursor: pointer;
				border-radius: 4px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				margin: 10px 0 0;
				color: #999;
				background: #fff;
				width: 90px;
				font-size: 26px;
				line-height: 60px;
				text-align: center;
				height: 60px;
			}
			/deep/ .el-upload-list .el-upload-list__item {
				border: 1px solid #ddd;
				cursor: pointer;
				border-radius: 4px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				margin: 10px 0 0;
				color: #999;
				background: #fff;
				width: 90px;
				font-size: 26px;
				line-height: 60px;
				text-align: center;
				height: 60px;
			}
			/deep/ .el-upload .el-icon-plus {
				border: 1px solid #ddd;
				cursor: pointer;
				border-radius: 4px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				margin: 10px 0 0;
				color: #999;
				background: #fff;
				width: 90px;
				font-size: 26px;
				line-height: 60px;
				text-align: center;
				height: 60px;
			}
			/deep/ .el-upload__tip {
				color: #333;
				font-size: 16px;
			}
			/deep/ .el-input__inner::placeholder {
				color: #666;
				font-size: 16px;
			}
			.required {
				position: relative;
			}
			.required::after{
				color: red;
				left: 120px;
				position: absolute;
				content: "*";
			}
			.editor {
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				background: #fff;
				width: 100%;
				height: auto;
			}
			.editor>.avatar-uploader {
				line-height: 0;
				height: 0;
			}
		}
		.list-item.email {
			input {
				border: 1px solid #DADFE6;
				border-radius: 0px 0 0 0px;
				padding: 0 10px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				outline: none;
				color: #333;
				background: #fff;
				width: 100%;
				font-size: 18px;
				height: 52px;
			}
			input:focus {
				border: 1px solid #DADFE6;
				border-radius: 0px 0 0 0px;
				padding: 0 10px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				outline: none;
				color: #333;
				background: #fff;
				width: 100%;
				font-size: 18px;
				height: 52px;
			}
			input::placeholder {
				color: #666;
				font-size: 16px;
			}
			button {
				cursor: pointer;
				z-index: 22;
				color: #fff;
				font-weight: bold;
				display: flex;
				font-size: 15px;
				border-color: #d1d1d1;
				right: 0px;
				border-radius: 0 0px 0px 0;
				background: #333;
				width: 120px;
				justify-content: center;
				border-width: 0 0 0px;
				align-items: center;
				position: absolute;
				border-style: solid;
				height: 52px;
			}
			button:hover {
				opacity: 0.8;
			}
		}
		.register-btn {
			padding:  30px 0;
			margin: 20px auto 0;
			display: flex;
			width: 100%;
			justify-content: center;
		}
		.register-btn1 {
			padding: 0;
			width: auto;
		}
		.register-btn2 {
			z-index: 1;
		}
		.r-btn {
			border: 0;
			cursor: pointer;
			border-radius: 24px;
			padding: 0 24px;
			margin: 0px 20px 0 0;
			outline: none;
			color: #fff;
			background: #333333;
			font-weight: blod;
			width: 176px;
			font-size: 20px;
			height: 47px;
		}
		.r-btn:hover {
			opacity: 0.5;
		}
		.r-login {
			border: 0;
			cursor: pointer;
			padding: 0 24px;
			margin: 0px 20px 0 0;
			color: #000000;
			font-weight: 500;
			font-size: 20px;
			line-height: 47px;
			border-radius: 24px;
			outline: none;
			background: #FAFAFA;
			width: 176px;
			text-align: center;
			height: 47px;
		}
		.r-login:hover {
			opacity: 0.8;
		}
	}
}
	
	::-webkit-scrollbar {
	  display: none;
	}
</style>

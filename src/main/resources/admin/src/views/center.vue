<template>
	<div :style='{"minHeight":"100vh","padding":"0 30px","background":"#FFFFFF"}'>
		<el-form
			:style='{"border":"1px solid #ddd","boxShadow":"none","padding":"20px 25% 0 10%","borderRadius":"20px","flexWrap":"wrap","background":"none","display":"flex"}'
			class="add-update-preview"
			ref="ruleForm"
			:model="ruleForm"
			label-width="180px"
		>
				<el-form-item :style='{"width":"calc(100% - 0px)","margin":"10px 0px 10px 0 ","display":"flex"}'   v-if="flag=='yonghu'"  label="账号" prop="zhanghao">
					<el-input v-model="ruleForm.zhanghao" :readonly="ro.zhanghao" placeholder="账号" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"calc(100% - 0px)","margin":"10px 0px 10px 0 ","display":"flex"}'   v-if="flag=='yonghu'"  label="姓名" prop="xingming">
					<el-input v-model="ruleForm.xingming" :readonly="ro.xingming" placeholder="姓名" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"calc(100% - 0px)","margin":"10px 0px 10px 0 ","display":"flex"}' v-if="flag=='yonghu'"  label="性别" prop="xingbie">
					<el-select filterable v-model="ruleForm.xingbie" :disabled="ro.xingbie" placeholder="请选择性别">
						<el-option
							v-for="(item,index) in yonghuxingbieOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"width":"calc(100% - 0px)","margin":"10px 0px 10px 0 ","display":"flex"}'   v-if="flag=='yonghu'"  label="手机" prop="shouji">
					<el-input v-model="ruleForm.shouji" :readonly="ro.shouji" placeholder="手机" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"calc(100% - 0px)","margin":"10px 0px 10px 0 ","display":"flex"}' v-if="flag=='yonghu'" label="头像" prop="touxiang">
					<file-upload
						tip="点击上传头像"
						action="file/upload"
						:limit="1"
						:multiple="false"
						:fileUrls="ruleForm.touxiang?ruleForm.touxiang:''"
						@change="yonghutouxiangUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item :style='{"width":"calc(100% - 0px)","margin":"10px 0px 10px 0 ","display":"flex"}' v-if="flag=='yonghu'"  label="社区" prop="shequ">
					<el-select filterable v-model="ruleForm.shequ" :disabled="ro.shequ" placeholder="请选择社区">
						<el-option
							v-for="(item,index) in yonghushequOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"width":"calc(100% - 0px)","margin":"10px 0px 10px 0 ","display":"flex"}'   v-if="flag=='yonghu'"  label="密保问题" prop="pquestion">
					<el-input v-model="ruleForm.pquestion" :readonly="ro.pquestion" placeholder="密保问题" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"calc(100% - 0px)","margin":"10px 0px 10px 0 ","display":"flex"}'   v-if="flag=='yonghu'"  label="密保答案" prop="panswer">
					<el-input v-model="ruleForm.panswer" :readonly="ro.panswer" placeholder="密保答案" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"calc(100% - 0px)","margin":"10px 0px 10px 0 ","display":"flex"}'   v-if="flag=='shangjia'"  label="店铺名" prop="dianpuming">
					<el-input v-model="ruleForm.dianpuming" :readonly="ro.dianpuming" placeholder="店铺名" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"calc(100% - 0px)","margin":"10px 0px 10px 0 ","display":"flex"}'   v-if="flag=='shangjia'"  label="负责人" prop="fuzeren">
					<el-input v-model="ruleForm.fuzeren" :readonly="ro.fuzeren" placeholder="负责人" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"calc(100% - 0px)","margin":"10px 0px 10px 0 ","display":"flex"}' v-if="flag=='shangjia'"  label="性别" prop="xingbie">
					<el-select filterable v-model="ruleForm.xingbie" :disabled="ro.xingbie" placeholder="请选择性别">
						<el-option
							v-for="(item,index) in shangjiaxingbieOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"width":"calc(100% - 0px)","margin":"10px 0px 10px 0 ","display":"flex"}'   v-if="flag=='shangjia'"  label="联系电话" prop="lianxidianhua">
					<el-input v-model="ruleForm.lianxidianhua" :readonly="ro.lianxidianhua" placeholder="联系电话" clearable></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"calc(100% - 0px)","margin":"10px 0px 10px 0 ","display":"flex"}' v-if="flag=='shangjia'" label="头像" prop="touxiang">
					<file-upload
						tip="点击上传头像"
						action="file/upload"
						:limit="1"
						:multiple="false"
						:fileUrls="ruleForm.touxiang?ruleForm.touxiang:''"
						@change="shangjiatouxiangUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item :style='{"width":"calc(100% - 0px)","margin":"10px 0px 10px 0 ","display":"flex"}' v-if="flag=='shangjia'" label="资质文件" prop="zizhiwenjian">
					<file-upload
						tip="点击上传资质文件"
						action="file/upload"
						:limit="1"
						:type="3"
						:multiple="false"
						:fileUrls="ruleForm.zizhiwenjian?ruleForm.zizhiwenjian:''"
						@change="shangjiazizhiwenjianUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item :style='{"width":"calc(100% - 0px)","margin":"10px 0px 10px 0 ","display":"flex"}' v-if="flag=='users'" label="用户名" prop="username">
					<el-input v-model="ruleForm.username" placeholder="用户名"></el-input>
				</el-form-item>
				<el-form-item :style='{"width":"calc(100% - 0px)","margin":"10px 0px 10px 0 ","display":"flex"}' v-if="flag=='users'" label="头像" prop="image">
					<file-upload
						tip="点击上传头像"
						action="file/upload"
						:limit="1"
						:multiple="false"
						:fileUrls="ruleForm.image?ruleForm.image:''"
						@change="usersimageUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item :style='{"width":"auto","padding":"0 30px","margin":"20px  auto 30px auto","flexWrap":"wrap","justifyContent":"center","display":"flex"}'>
					<el-button class="btn3" type="primary" @click="onUpdateHandler">
						<span class="icon iconfont icon-queren15"></span>
						提交
					</el-button>
				</el-form-item>
		</el-form>
	</div>
</template>
<script>
// 校验引入
	import { 
		isNumber,
		isIntNumer,
		isMobile,
	} from "@/utils/validate";

	export default {
		data() {
			return {
				ruleForm: {},
				ro: {},
				flag: '',
				usersFlag: false,
				yonghuxingbieOptions: [],
				yonghushequOptions: [],
				shangjiaxingbieOptions: [],
			};
		},
		mounted() {
			var table = this.$storage.get("sessionTable");
			this.flag = table;
			this.$http({
				url: `${this.$storage.get("sessionTable")}/session`,
				method: "get"
			}).then(({ data }) => {
				if (data && data.code === 0) {
					if(table == 'yonghu') {
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
					if(table == 'shangjia') {
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

					this.ruleForm = data.data;
				} else {
					this.$message.error(data.msg);
				}
			});
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
		},
		methods: {
			yonghutouxiangUploadChange(fileUrls) {
				this.ruleForm.touxiang = fileUrls;
			},
			shangjiatouxiangUploadChange(fileUrls) {
				this.ruleForm.touxiang = fileUrls;
			},
			shangjiazizhiwenjianUploadChange(fileUrls) {
				this.ruleForm.zizhiwenjian = fileUrls;
			},
			usersimageUploadChange(fileUrls) {
				this.ruleForm.image = fileUrls;
			},
			onUpdateHandler() {
				if((!this.ruleForm.zhanghao)&& 'yonghu'==this.flag){
					this.$message.error('账号不能为空');
					return
				}
				if((!this.ruleForm.mima)&& 'yonghu'==this.flag){
					this.$message.error('密码不能为空');
					return
				}
				if((!this.ruleForm.xingming)&& 'yonghu'==this.flag){
					this.$message.error('姓名不能为空');
					return
				}
				if((!this.ruleForm.xingbie)&& 'yonghu'==this.flag){
					this.$message.error('性别不能为空');
					return
				}
				if('yonghu' ==this.flag && this.ruleForm.shouji&&(!isMobile(this.ruleForm.shouji))){
					this.$message.error(`手机应输入手机格式`);
					return
				}
				if(this.ruleForm.touxiang!=null) {
					this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url,"g"),"");
				}
				if('yonghu' ==this.flag && this.ruleForm.money&&(!isNumber(this.ruleForm.money))){
					this.$message.error(`余额应输入数字`);
					return
				}
				if('yonghu' ==this.flag && this.ruleForm.status&&(!isIntNumer(this.ruleForm.status))){
					this.$message.error(`状态应输入整数`);
					return
				}
				if((!this.ruleForm.dianpuming)&& 'shangjia'==this.flag){
					this.$message.error('店铺名不能为空');
					return
				}
				if((!this.ruleForm.mima)&& 'shangjia'==this.flag){
					this.$message.error('密码不能为空');
					return
				}
				if('shangjia' ==this.flag && this.ruleForm.lianxidianhua&&(!isMobile(this.ruleForm.lianxidianhua))){
					this.$message.error(`联系电话应输入手机格式`);
					return
				}
				if(this.ruleForm.touxiang!=null) {
					this.ruleForm.touxiang = this.ruleForm.touxiang.replace(new RegExp(this.$base.url,"g"),"");
				}
				if(this.ruleForm.zizhiwenjian!=null) {
					this.ruleForm.zizhiwenjian = this.ruleForm.zizhiwenjian.replace(new RegExp(this.$base.url,"g"),"");
				}
				if('shangjia' ==this.flag && this.ruleForm.money&&(!isNumber(this.ruleForm.money))){
					this.$message.error(`余额应输入数字`);
					return
				}
				if('shangjia' ==this.flag && this.ruleForm.status&&(!isIntNumer(this.ruleForm.status))){
					this.$message.error(`状态应输入整数`);
					return
				}
				if('users'==this.flag && this.ruleForm.username.trim().length<1) {
					this.$message.error(`用户名不能为空`);
					return	
				}
				if(this.flag=='users'){
					this.ruleForm.image = this.ruleForm.image.replace(new RegExp(this.$base.url,"g"),"")
				}
				this.$http({
					url: `${this.$storage.get("sessionTable")}/update`,
					method: "post",
					data: this.ruleForm
				}).then(({ data }) => {
					if (data && data.code === 0) {
						if(this.flag=='users'){
							this.$storage.set('headportrait',this.ruleForm.image)
						}else {
							if(this.flag == 'yonghu') {
								this.$storage.set('headportrait',this.ruleForm.touxiang)
							}
							if(this.flag == 'shangjia') {
								this.$storage.set('headportrait',this.ruleForm.touxiang)
							}
						}
						this.$message({
							message: "修改信息成功",
							type: "success",
							duration: 1500,
							onClose: () => {
								window.location.reload();
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
	.el-date-editor.el-input {
		width: auto;
	}
	
	.add-update-preview .el-form-item /deep/ .el-form-item__label {
				padding: 0 10px;
				color: #333333;
				white-space: nowrap;
				font-weight: 600;
				width: 180px;
				font-size: 16px;
				line-height: 64px;
				text-align: right;
				height: 64px;
			}
	
	.add-update-preview .el-form-item /deep/ .el-form-item__content {
		margin-left: auto !important;
		margin: auto !important;
		flex: 1;
		display: flex;
		width: 100%;
		justify-content: flex-start;
		align-items: flex-start;
		flex-wrap: wrap;
	}
	
	.add-update-preview .el-input /deep/ .el-input__inner {
				border:  1px solid #DADFE6;
				border-radius: 4px;
				padding: 0 12px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				outline: none;
				color: #333;
				background: #FFFFFF;
				flex: 1;
				width: 100%;
				font-size: 16px;
				height: 64px;
			}
	
	.add-update-preview .el-select /deep/ .el-input__inner {
				border:  1px solid #DADFE6;
				border-radius: 4px;
				padding: 0 12px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				outline: none;
				color: #333;
				background: #FFFFFF;
				flex: 1;
				width: 100%;
				font-size: 16px;
				height: 64px;
			}
	
	.add-update-preview .el-date-editor /deep/ .el-input__inner {
				border:  1px solid #DADFE6;
				border-radius: 4px;
				padding: 0 30px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				outline: none;
				color: #333;
				background: #FFFFFF;
				flex: 1;
				width: 100%;
				font-size: 16px;
				height: 64px;
			}
	
	.add-update-preview /deep/ .el-upload--picture-card {
		background: transparent;
		border: 0;
		border-radius: 0;
		width: auto;
		height: auto;
		line-height: initial;
		vertical-align: middle;
	}
	
	.add-update-preview /deep/ .el-upload-list .el-upload-list__item {
				border: 1px solid #DADFE6;
				cursor: pointer;
				border-radius: 4px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				color: #999;
				background: #fff;
				font-weight: 600;
				width: 80px;
				font-size: 30px;
				line-height: 80px;
				text-align: center;
				height: 80px;
			}
	
	.add-update-preview /deep/ .el-upload .el-icon-plus {
				border: 1px solid #DADFE6;
				cursor: pointer;
				border-radius: 4px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				color: #999;
				background: #fff;
				font-weight: 600;
				width: 80px;
				font-size: 30px;
				line-height: 80px;
				text-align: center;
				height: 80px;
			}
	
	.add-update-preview .el-textarea /deep/ .el-textarea__inner {
				border-radius: 4px;
				padding: 12px;
				box-shadow: inset 0px 3px 6px 1px rgba(0,0,0,0.16);
				outline: none;
				color: #666;
				background: #fff;
				width: 100%;
				font-size: 16px;
				border-color: #e8e9eb;
				border-width: 1px;
				border-style: solid;
				height: auto;
			}
	
	.add-update-preview .btn3 {
				border: 0px solid #206cb4;
				cursor: pointer;
				padding: 0 24px;
				margin: 4px;
				color: #fff;
				font-weight: bold;
				font-size: 16px;
				border-radius: 24px  24px  24px  24px;
				outline: none;
				background: #333333;
				width: auto;
				min-width: 176px;
				height: 47px;
				.iconfont {
						margin: 0 2px;
						color: #fff;
						display: none;
						font-size: 16px;
						height: 40px;
					}
	}
	
	.add-update-preview .btn3:hover {
				opacity: 0.8;
			}
	.editor>.avatar-uploader {
		line-height: 0;
		height: 0;
	}
</style>

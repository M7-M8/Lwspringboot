










































<template>
	<div class="add-update-preview">
		<el-form
			class="add-update-form"
			ref="ruleForm"
			:model="ruleForm"
			:rules="rules"
			label-width="200px"
			>
			<el-form-item class="add-item" label="商品名称" prop="shangpinmingcheng">
				<el-input v-model="ruleForm.shangpinmingcheng" 
					placeholder="商品名称" clearable :readonly="ro.shangpinmingcheng"></el-input>
			</el-form-item>
			<el-form-item class="add-item"  label="商品分类" prop="shangpinfenlei">
				<el-select v-model="ruleForm.shangpinfenlei" placeholder="请选择商品分类" :disabled="ro.shangpinfenlei"  filterable>
					<el-option
						v-for="(item,index) in shangpinfenleiOptions"
						:key="index"
						:label="item"
						:value="item">
					</el-option>
				</el-select>
			</el-form-item>
			<el-form-item class="add-item" label="商品图片" v-if="type!='cross' || (type=='cross' && !ro.shangpintupian)" prop="shangpintupian">
				<file-upload
					tip="点击上传商品图片"
					action="file/upload"
					:limit="3"
					:multiple="true"
					:disabled="ro.shangpintupian"
					:fileUrls="ruleForm.shangpintupian?ruleForm.shangpintupian:''"
					@change="shangpintupianUploadChange"
					></file-upload>
			</el-form-item>
			<el-form-item class="add-item" v-else label="商品图片" prop="shangpintupian">
				<img v-if="ruleForm.shangpintupian.substring(0,4)=='http'" class="upload-img" v-bind:key="index" :src="ruleForm.shangpintupian.split(',')[0]">
				<img v-else class="upload-img" v-bind:key="index" v-for="(item,index) in ruleForm.shangpintupian.split(',')" :src="baseUrl+item">
			</el-form-item>
			<el-form-item class="add-item" label="规格" prop="guige">
				<el-input v-model="ruleForm.guige" 
					placeholder="规格" clearable :readonly="ro.guige"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="品牌" prop="pinpai">
				<el-input v-model="ruleForm.pinpai" 
					placeholder="品牌" clearable :readonly="ro.pinpai"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="店铺名" prop="dianpuming">
				<el-input v-model="ruleForm.dianpuming" 
					placeholder="店铺名" clearable :readonly="ro.dianpuming"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="单限" prop="onelimittimes">
				<el-input v-model.number="ruleForm.onelimittimes" 
					placeholder="单限" clearable :readonly="ro.onelimittimes"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="库存" prop="alllimittimes">
				<el-input v-model.number="ruleForm.alllimittimes" 
					placeholder="库存" clearable :readonly="ro.alllimittimes"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="价格" prop="price">
				<el-input-number v-model="ruleForm.price" placeholder="价格" :disabled="ro.price"></el-input-number>
			</el-form-item>
			<el-form-item class="add-item" label="倒计结束时间" prop="reversetime">
				<el-date-picker
					:disabled="ro.reversetime"
					value-format="yyyy-MM-dd HH:mm:ss"
					v-model="ruleForm.reversetime" 
					type="datetime"
					:picker-options="reversetimePickerOptions"
					placeholder="倒计结束时间">
				</el-date-picker>
			</el-form-item>
			<el-form-item class="add-item" label="团购价" prop="groupprice">
				<el-input-number v-model="ruleForm.groupprice" placeholder="团购价" :disabled="ro.groupprice"></el-input-number>
			</el-form-item>
			<el-form-item class="add-item" label="拼团人数" prop="grouppeople">
				<el-input v-model.number="ruleForm.grouppeople" 
					placeholder="拼团人数" clearable :readonly="ro.grouppeople"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="当前人数" prop="curpeople">
				<el-input v-model.number="ruleForm.curpeople" 
					placeholder="当前人数" clearable :readonly="ro.curpeople"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="商品描述" prop="shangpinmiaoshu">
				<editor 
					v-model="ruleForm.shangpinmiaoshu" 
					class="editor" 
					myQuillEditor="shangpinmiaoshu"
					action="file/upload">
				</editor>
			</el-form-item>

			<el-form-item class="add-btn-item">
				<el-button class="submitBtn"  type="primary" @click="onSubmit(null)">
					<span class="icon iconfont icon-kaitongfuwu"></span>
					<span class="text">提交信息</span>
				</el-button>
				<el-button class="closeBtn" @click="back()">
					<span class="icon iconfont icon-shanchu10"></span>
					<span class="text">取消</span>
				</el-button>
			</el-form-item>
		</el-form>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				id: '',
				baseUrl: '',
				ro:{
					shangpinmingcheng : false,
					shangpinfenlei : false,
					shangpintupian : false,
					guige : false,
					pinpai : false,
					shangpinmiaoshu : false,
					dianpuming : false,
					onelimittimes : false,
					alllimittimes : false,
					price : false,
					thumbsupnum : false,
					crazilynum : false,
					clicktime : false,
					reversetime : false,
					clicknum : false,
					discussnum : false,
					onshelves : false,
					groupprice : false,
					grouppeople : false,
					curpeople : false,
					storeupnum : false,
				},
				type: '',
				userTableName: localStorage.getItem('UserTableName'),
				ruleForm: {
					shangpinmingcheng: '',
					shangpinfenlei: '',
					shangpintupian: '',
					guige: '',
					pinpai: '',
					shangpinmiaoshu: '',
					dianpuming: '',
					onelimittimes: '',
					alllimittimes: '',
					price: '',
					thumbsupnum: '',
					crazilynum: '',
					clicktime: '',
					reversetime: '',
					clicknum: '',
					discussnum: '',
					onshelves: 1,
					groupprice: '',
					grouppeople: '',
					curpeople: '',
					storeupnum: '',
				},
				shangpinfenleiOptions: [],

				// 只能选择今天和之后日期
				reversetimePickerOptions: {
					disabledDate(time) {
						return time.getTime() < Date.now() - 8.64e7;
					}
				},
				rules: {
					shangpinmingcheng: [
						{ required: true, message: '商品名称不能为空', trigger: 'blur' },
					],
					shangpinfenlei: [
						{ required: true, message: '商品分类不能为空', trigger: 'blur' },
					],
					shangpintupian: [
						{ required: true, message: '商品图片不能为空', trigger: 'blur' },
					],
					guige: [
						{ required: true, message: '规格不能为空', trigger: 'blur' },
					],
					pinpai: [
					],
					shangpinmiaoshu: [
					],
					dianpuming: [
					],
					onelimittimes: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					alllimittimes: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					price: [
						{ required: true, message: '价格不能为空', trigger: 'blur' },
						{ validator: this.$validate.isNumber, trigger: 'blur' },
					],
					thumbsupnum: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					crazilynum: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					clicktime: [
					],
					reversetime: [
					],
					clicknum: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					discussnum: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					onshelves: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					groupprice: [
						{ validator: this.$validate.isNumber, trigger: 'blur' },
					],
					grouppeople: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					curpeople: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					storeupnum: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
				},
				centerType: false,
			};
		},
		computed: {
			sessionForm() {
				return JSON.parse(localStorage.getItem('sessionForm'))
			},



		},
		components: {
		},
		created() {
			if(this.$route.query.centerType){
				this.centerType = true
			}
			//this.bg();
			let type = this.$route.query.type ? this.$route.query.type : '';
			this.init(type);
			this.baseUrl = this.$config.baseUrl;
		},
		methods: {
			getMakeZero(s) {
				return s < 10 ? '0' + s : s;
			},
			// 下载
			download(file ){
				window.open(`${file}`)
			},
			// 初始化
			init(type) {
				this.type = type;
				if(type=='cross'){
					var obj = JSON.parse(localStorage.getItem('crossObj'));
					for (var o in obj){
						if(o=='shangpinmingcheng'){
							this.ruleForm.shangpinmingcheng = obj[o];
							this.ro.shangpinmingcheng = true;
							continue;
						}
						if(o=='shangpinfenlei'){
							this.ruleForm.shangpinfenlei = obj[o];
							this.ro.shangpinfenlei = true;
							continue;
						}
						if(o=='shangpintupian'){
							this.ruleForm.shangpintupian = obj[o]?obj[o].split(",")[0]:'';
							this.ro.shangpintupian = true;
							continue;
						}
						if(o=='guige'){
							this.ruleForm.guige = obj[o];
							this.ro.guige = true;
							continue;
						}
						if(o=='pinpai'){
							this.ruleForm.pinpai = obj[o];
							this.ro.pinpai = true;
							continue;
						}
						if(o=='shangpinmiaoshu'){
							this.ruleForm.shangpinmiaoshu = obj[o];
							this.ro.shangpinmiaoshu = true;
							continue;
						}
						if(o=='dianpuming'){
							this.ruleForm.dianpuming = obj[o];
							this.ro.dianpuming = true;
							continue;
						}
						if(o=='onelimittimes'){
							this.ruleForm.onelimittimes = obj[o];
							this.ro.onelimittimes = true;
							continue;
						}
						if(o=='alllimittimes'){
							this.ruleForm.alllimittimes = obj[o];
							this.ro.alllimittimes = true;
							continue;
						}
						if(o=='price'){
							this.ruleForm.price = obj[o];
							this.ro.price = true;
							continue;
						}
						if(o=='thumbsupnum'){
							this.ruleForm.thumbsupnum = obj[o];
							this.ro.thumbsupnum = true;
							continue;
						}
						if(o=='crazilynum'){
							this.ruleForm.crazilynum = obj[o];
							this.ro.crazilynum = true;
							continue;
						}
						if(o=='clicktime'){
							this.ruleForm.clicktime = obj[o];
							this.ro.clicktime = true;
							continue;
						}
						if(o=='reversetime'){
							this.ruleForm.reversetime = obj[o];
							this.ro.reversetime = true;
							continue;
						}
						if(o=='clicknum'){
							this.ruleForm.clicknum = obj[o];
							this.ro.clicknum = true;
							continue;
						}
						if(o=='discussnum'){
							this.ruleForm.discussnum = obj[o];
							this.ro.discussnum = true;
							continue;
						}
						if(o=='onshelves'){
							this.ruleForm.onshelves = obj[o];
							this.ro.onshelves = true;
							continue;
						}
						if(o=='groupprice'){
							this.ruleForm.groupprice = obj[o];
							this.ro.groupprice = true;
							continue;
						}
						if(o=='grouppeople'){
							this.ruleForm.grouppeople = obj[o];
							this.ro.grouppeople = true;
							continue;
						}
						if(o=='curpeople'){
							this.ruleForm.curpeople = obj[o];
							this.ro.curpeople = true;
							continue;
						}
						if(o=='storeupnum'){
							this.ruleForm.storeupnum = obj[o];
							this.ro.storeupnum = true;
							continue;
						}
					}
				}else if(type=='edit'){
					this.info()
				}
				// 获取用户信息
				this.$http.get(this.userTableName + '/session', {emulateJSON: true}).then(res => {
					if (res.data.code == 0) {
						var json = res.data.data;
						if((json.dianpuming!=''&&json.dianpuming) || json.dianpuming==0){
							this.ruleForm.dianpuming = json.dianpuming;
							this.ro.dianpuming = true;
						}
					}
				});
				this.$http.get('option/shangpinfenlei/shangpinfenlei', {}).then(res => {
					if (res.data.code == 0) {
						this.shangpinfenleiOptions = res.data.data;
					}
				});

				if (localStorage.getItem('raffleType') && localStorage.getItem('raffleType') != null) {
					localStorage.removeItem('raffleType')
					setTimeout(() => {
						this.onSubmit(null)
					}, 300)
				}
			},

			// 多级联动参数
			// 多级联动参数
			async info() {
				await this.$http.get(`shangpinxinxi/detail/${this.$route.query.id}`, {emulateJSON: true}).then(res => {
					if (res.data.code == 0) {
						this.ruleForm = res.data.data;
					}
				});
			},
			// 提交
			async onSubmit(subMitType=null) {
				if(this.ruleForm.price<0){
					this.$message.error("价格不能输入负数");
					return
				}
				if(this.ruleForm.alllimittimes<0){
					this.$message.error("库存不能输入负数");
					return
				}
				if(this.ruleForm.onelimittimes<0){
					this.$message.error("单次购买不能输入负数");
					return
				}
				if(!this.ruleForm.id) {
					delete this.ruleForm.userid
				}
				await this.$refs["ruleForm"].validate(async valid => {
					if(valid) {
						if(this.type=='cross'){
							var statusColumnName = localStorage.getItem('statusColumnName');
							var statusColumnValue = localStorage.getItem('statusColumnValue');
							if(statusColumnName && statusColumnName!='') {
								var obj = JSON.parse(localStorage.getItem('crossObj'));
								if(!statusColumnName.startsWith("[")) {
									for (var o in obj){
										if(o==statusColumnName){
											obj[o] = statusColumnValue;
										}
									}
									var table = localStorage.getItem('crossTable');
									await this.$http.post(table+'/update', obj).then(res => {});
								}
							}
						}

						await this.$http.post(`shangpinxinxi/${this.ruleForm.id?'update':this.centerType?'save':'add'}`, this.ruleForm).then(async res => {
							if (res.data.code == 0) {
								await this.$message({
									message: '操作成功',
									type: 'success',
									duration: 1500,
									onClose: () => {
										this.$router.go(-1);
										
									}
								});
							} else {
								this.$message({
									message: res.data.msg,
									type: 'error',
									duration: 1500
								});
							}
						});
					}
				});
			},
			// 获取uuid
			getUUID () {
				return new Date().getTime();
			},
			// 返回
			back() {
				this.$router.go(-1);
			},
			shangpintupianUploadChange(fileUrls) {
				this.ruleForm.shangpintupian = fileUrls.replace(new RegExp(this.$config.baseUrl,"g"),"");
			},
		}
	};
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.add-update-preview {
		padding: 20px 10% 40px;
		margin: 10px auto;
		background: none;
		width: 100%;
		position: relative;
		.add-update-form {
			border: 0px solid #eee;
			border-radius: 10px;
			padding: 40px 20% 20px 10%;
			box-shadow: 0 0px 6px rgba(0,0,0,.1);
			background: #fff;
			width: 100%;
			position: relative;
			.add-item.el-form-item {
				padding: 0;
				margin: 0 0 24px;
				background: none;
				/deep/ .el-form-item__label {
					padding: 0 10px 0 0;
					color: #333;
					white-space: nowrap;
					font-weight: 500;
					width: 200px;
					font-size: 16px;
					line-height: 40px;
					text-align: right;
				}
				/deep/ .el-form-item__content {
					margin-left: 200px;
				}
				.el-input {
					width: 100%;
				}
				.el-input /deep/ .el-input__inner {
					border: 1px solid #eee;
					border-radius: 0px;
					padding: 0 12px;
					box-shadow: none;
					outline: none;
					color: #666;
					width: 100%;
					font-size: 16px;
					height: 40px;
				}
				.el-input /deep/ .el-input__inner[readonly="readonly"] {
					border: 0;
					cursor: not-allowed;
					border-radius: 4px;
					padding: 0 12px;
					box-shadow: none;
					outline: none;
					color: #999;
					width: 100%;
					font-size: 16px;
					height: 40px;
				}
				.el-input-number /deep/ .el-input__inner {
					text-align: left;
					border: 1px solid #eee;
					border-radius: 0px;
					padding: 0 12px;
					box-shadow: none;
					outline: none;
					color: #666;
					width: 100%;
					font-size: 16px;
					height: 40px;
				}
				.el-input-number /deep/ .is-disabled .el-input__inner {
					text-align: left;
					border: 0;
					cursor: not-allowed;
					border-radius: 4px;
					padding: 0 12px;
					box-shadow: none;
					outline: none;
					color: #999;
					width: 100%;
					font-size: 16px;
					height: 40px;
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
					border: 1px solid #eee;
					border-radius: 0px;
					padding: 0 10px;
					box-shadow: none;
					outline: none;
					color: rgba(64, 158, 255, 1);
					width: 100%;
					font-size: 14px;
					height: 40px;
				}
				.el-select /deep/ .is-disabled .el-input__inner {
					border: 0;
					cursor: not-allowed;
					border-radius: 4px;
					padding: 0 10px;
					box-shadow: none;
					outline: none;
					color: #999;
					background: #eee;
					width: 100%;
					font-size: 14px;
					height: 40px;
				}
				.el-date-editor {
					width: 100%;
				}
				.el-date-editor /deep/ .el-input__inner {
					border: 1px solid #eee;
					border-radius: 0px;
					padding: 0 10px 0 30px;
					box-shadow: none;
					outline: none;
					color: #666;
					width: 100%;
					font-size: 16px;
					height: 40px;
				}
				.el-date-editor /deep/ .el-input__inner[readonly="readonly"] {
					border: 0;
					cursor: not-allowed;
					border-radius: 4px;
					padding: 0 10px 0 30px;
					box-shadow: none;
					outline: none;
					color: #999;
					background: #eee;
					width: 100%;
					font-size: 16px;
					height: 40px;
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
					border: 1px solid #eee;
					cursor: pointer;
					border-radius: 0px;
					color: #999;
					width: 80px;
					font-size: 26px;
					line-height: 80px;
					text-align: center;
					height: 80px;
				}
				/deep/ .el-upload-list .el-upload-list__item {
					border: 1px solid #eee;
					cursor: pointer;
					border-radius: 0px;
					color: #999;
					width: 80px;
					font-size: 26px;
					line-height: 80px;
					text-align: center;
					height: 80px;
					font-size: 14px;
					line-height: 1.8;
				}
				/deep/ .el-upload .el-icon-plus {
					border: 1px solid #eee;
					cursor: pointer;
					border-radius: 0px;
					color: #999;
					width: 80px;
					font-size: 26px;
					line-height: 80px;
					text-align: center;
					height: 80px;
				}
				/deep/ .el-upload__tip {
					color: #666;
					font-size: 16px;
				}
				.el-textarea /deep/ .el-textarea__inner {
					border: 1px solid #eee;
					border-radius: 0px;
					padding: 12px;
					box-shadow: none;
					outline: none;
					color: #666;
					width: 100%;
					font-size: 16px;
					height: auto;
				}
				.el-textarea /deep/ .el-textarea__inner[readonly="readonly"] {
					border: 0;
					cursor: not-allowed;
					border-radius: 4px;
					padding: 12px;
					box-shadow: none;
					outline: none;
					color: #999;
					width: 100%;
					font-size: 16px;
					height: auto;
				}
				/deep/ .el-input__inner::placeholder {
					color: #123;
					font-size: 16px;
				}
				/deep/ textarea::placeholder {
					color: #123;
					font-size: 16px;
				}
				.editor {
					background-color: #fff;
					border-radius: 0;
					padding: 0;
					box-shadow: none;
					margin: 0;
					width: 100%;
					border-color: #ccc;
					border-width: 0;
					border-style: solid;
					height: auto;
				}
				.editor /deep/.ql-toolbar {
					border: 1px solid #eee;
					background: none;
					border-width: 1px 1px 0;
				}
				.editor /deep/.ql-container {
					border: 1px solid #eee;
					background: none;
					min-height: 180px;
				}
				.editor /deep/.ql-container .ql-blank::before {
					color: #999;
				}
				.upload-img {
					object-fit: cover;
					width: 120px;
					height: 120px;
				}
				.viewBtn {
					border: 0;
					cursor: pointer;
					padding: 0 20px;
					margin: 0;
					color: #fff;
					display: inline-block;
					font-size: 14px;
					line-height: 34px;
					border-radius: 4px;
					outline: none;
					background: #ff6d6d;
					width: auto;
					height: 34px;
				}
				.viewBtn:hover {
					opacity: 0.7;
				}
				.unviewBtn {
					border: 0;
					cursor: pointer;
					padding: 0 20px;
					margin: 0;
					color: #666;
					display: inline-block;
					font-size: 14px;
					line-height: 34px;
					border-radius: 4px;
					outline: none;
					background: #ddd;
					width: auto;
					height: 34px;
				}
				.unviewBtn:hover {
					opacity: 0.8;
				}
			}
			.add-btn-item {
				padding: 0;
				margin: 20px auto;
				width: 100%;
				text-align: center;
				.submitBtn {
					border: 0;
					cursor: pointer;
					border-radius: 30px;
					padding: 0 20px;
					margin: 0 20px 0 0;
					outline: none;
					background: #ff6d6d;
					display: inline-block;
					width: auto;
					font-size: 14px;
					line-height: 40px;
					height: 40px;
					.icon {
						color: rgba(255, 255, 255, 1);
					}
					.text {
						color: rgba(255, 255, 255, 1);
						font-size: 16px;
					}
				}
				.submitBtn:hover {
					opacity: 0.7;
					.icon {
						color: #fff;
					}
					.text {
						color: #fff;
					}
				}
				.closeBtn {
					border: 1px solid #ff000020;
					cursor: pointer;
					padding: 0 15px 0 10px;
					margin: 0 20px 0 0;
					display: inline-block;
					font-size: 16px;
					line-height: 40px;
					border-radius: 30px;
					outline: none;
					background: #ff000010;
					width: auto;
					min-width: 120px;
					height: 40px;
					.icon {
						color: #cc000080;
						font-size: 18px;
					}
					.text {
						color: #cc0000;
						font-size: 16px;
					}
				}
				.closeBtn:hover {
					opacity: 0.7;
					.icon {
					}
					.text {
					}
				}
			}
		}
	}
	.el-date-editor.el-input {
		width: auto;
	}
</style>

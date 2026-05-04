<template>
	<div class="home-preview">




		<!-- 商品推荐 -->
		<div id="animate_recommendshangpinxinxi" class="recommend animate__animated">
			<div class="recommend_title_box">
				<span class="recommend_title">商品信息推荐</span>
				<span class="recommend_subhead">{{'shangpinxinxi'.toUpperCase()}} RECOMMEND</span>
			</div>
			<!-- 样式一 -->
			<div class="list list1 index-pv1">
				<div v-for="(item,index) in shangpinxinxiRecommend" :key="index" @click="toDetail('shangpinxinxiDetail', item)" class="list-item animation-box">
					<img v-if="preHttp(item.shangpintupian)" :src="item.shangpintupian.split(',')[0]" alt="" />
					<img v-else :src="baseUrl + (item.shangpintupian?item.shangpintupian.split(',')[0]:'')" alt="" />
					<div class="name line1">商品名称:{{item.shangpinmingcheng}}</div>
					<div class="price">￥{{item.price}}</div>
				
					<div class="time_item">
						<span class="icon iconfont icon-shijian21"></span>
						<span class="label">发布时间：</span>
						<span class="text">{{item.addtime.split(' ')[0]}}</span>
					</div>
					<div class="publisher_item">
						<span class="icon iconfont icon-geren16"></span>
						<span class="label">发布人：</span>
						<span class="text">{{item.dianpuming}}</span>
					</div>
					<div class="like_item">
						<span class="icon iconfont icon-zan10"></span>
						<span class="label">点赞数：</span>
						<span class="text">{{item.thumbsupnum}}</span>
					</div>
					<div class="collect_item">
						<span class="icon iconfont icon-shoucang10"></span>
						<span class="label">收藏量：</span>
						<span class="text">{{item.storeupnum}}</span>
					</div>
					<div class="view_item">
						<span class="icon iconfont icon-chakan2"></span>
						<span class="label">点击量：</span>
						<span class="text">{{item.clicknum}}</span>
					</div>
				</div>
			</div>
			<div class="moreBtn" @click="moreBtn('shangpinxinxi')">
				<span class="text">更多 +</span>
				<i class="icon iconfont icon-gengduo1"></i>
			</div>
		</div>
		<!-- 商品推荐 -->
		<!-- 商品推荐 -->
		<div id="animate_recommendxitongzixun" class="recommend animate__animated">
			<div class="recommend_title_box">
				<span class="recommend_title">系统资讯推荐</span>
				<span class="recommend_subhead">{{'xitongzixun'.toUpperCase()}} RECOMMEND</span>
			</div>
			<!-- 样式一 -->
			<div class="list list1 index-pv1">
				<div v-for="(item,index) in xitongzixunRecommend" :key="index" @click="toDetail('xitongzixunDetail', item)" class="list-item animation-box">
					<img v-if="preHttp(item.fengmian)" :src="item.fengmian.split(',')[0]" alt="" />
					<img v-else :src="baseUrl + (item.fengmian?item.fengmian.split(',')[0]:'')" alt="" />
					<div class="name line1">{{item.biaoti}}</div>
				
					<div class="time_item">
						<span class="icon iconfont icon-shijian21"></span>
						<span class="label">发布时间：</span>
						<span class="text">{{item.addtime.split(' ')[0]}}</span>
					</div>
					<div class="like_item">
						<span class="icon iconfont icon-zan10"></span>
						<span class="label">点赞数：</span>
						<span class="text">{{item.thumbsupnum}}</span>
					</div>
					<div class="collect_item">
						<span class="icon iconfont icon-shoucang10"></span>
						<span class="label">收藏量：</span>
						<span class="text">{{item.storeupnum}}</span>
					</div>
					<div class="view_item">
						<span class="icon iconfont icon-chakan2"></span>
						<span class="label">点击量：</span>
						<span class="text">{{item.clicknum}}</span>
					</div>
				</div>
			</div>
			<div class="moreBtn" @click="moreBtn('xitongzixun')">
				<span class="text">更多 +</span>
				<i class="icon iconfont icon-gengduo1"></i>
			</div>
		</div>
		<!-- 商品推荐 -->
		<!-- 特价商品 -->
		<div id="animate_listgonggaoxinxi" class="lists animate__animated">
			<div class="list_title_box">
				<span class="list_title">公告信息展示</span>
				<span class="list_subhead">{{'gonggaoxinxi'.toUpperCase()}} SHOW</span>
			</div>
			<!-- 样式一 -->
			<div class="list list1 index-pv1">
				<div v-for="(item,index) in gonggaoxinxiList" :key="index" @click="toDetail('gonggaoxinxiDetail', item)" class="list-item animation-box">
					<img v-if="preHttp(item.gonggaofengmian)&&preHttp2(item.gonggaofengmian)" :src="item.gonggaofengmian" alt="" />
					<img v-else-if="preHttp(item.gonggaofengmian)" :src="item.gonggaofengmian.split(',')[0]" alt="" />
					<img v-else :src="baseUrl + (item.gonggaofengmian?item.gonggaofengmian.split(',')[0]:'')" alt="" />
					<div class="name line1">{{item.gonggaobiaoti}}</div>
				
					<div class="time_item">
						<span class="icon iconfont icon-shijian21"></span>
						<span class="label">发布时间：</span>
						<span class="text">{{item.addtime.split(' ')[0]}}</span>
					</div>
				</div>
			</div>
			<div class="moreBtn" @click="moreBtn('gonggaoxinxi')">
				<span class="text">更多+</span>
				<i class="icon iconfont icon-jiantou25"></i>
			</div>
	

		</div>
		<!-- 特价商品 -->
	</div>
</template>

<script>
import 'animate.css'
import Swiper from "swiper";

	export default {
		//数据集合
		data() {
			return {
				baseUrl: '',
				newsList: [],
				shangpinxinxiRecommend: [],
				xitongzixunRecommend: [],

				gonggaoxinxiList: [],




			}
		},
		created() {
			this.baseUrl = this.$config.baseUrl;
			this.getList();
		},
		mounted() {
			window.addEventListener('scroll', this.handleScroll)
			setTimeout(()=>{
				this.handleScroll()
			},100)
			
			this.swiperChanges()
		},
		beforeDestroy() {
			window.removeEventListener('scroll', this.handleScroll)
		},
		computed: {
			username() {
				return localStorage.getItem('username')
			}
		},
		//方法集合
		methods: {
			swiperChanges() {
				setTimeout(()=>{
				},750)
			},


			handleScroll() {
				let arr = [
					{id:'about',css:'animate__'},
					{id:'system',css:'animate__'},
					{id:'animate_recommendshangpinxinxi',css:'animate__'},
					{id:'animate_recommendxitongzixun',css:'animate__'},
					{id:'animate_listgonggaoxinxi',css:'animate__'},
				]
			
				for (let i in arr) {
					let doc = document.getElementById(arr[i].id)
					if (doc) {
						let top = doc.offsetTop
						let win_top = window.innerHeight + window.pageYOffset
						// console.log(top,win_top)
						if (win_top > top && doc.classList.value.indexOf(arr[i].css) < 0) {
							// console.log(doc)
							doc.classList.add(arr[i].css)
						}
					}
				}
			},
			preHttp(str) {
				return str && str.substr(0,4)=='http';
			},
			preHttp2(str) {
				return str && str.split(',w').length>1;
			},
			getList() {
				let autoSortUrl = "";
				let data = {}
				autoSortUrl = "shangpinxinxi/autoSort";
				if(localStorage.getItem('frontToken')) {
					autoSortUrl = "shangpinxinxi/autoSort2";
				}
				data = {
					page: 1,
					limit: 6,
					onshelves: 1,
				}
				this.$http.get(autoSortUrl, {params: data}).then(res => {
					if (res.data.code == 0) {
						this.shangpinxinxiRecommend = res.data.data.list;
					}
				});
				autoSortUrl = "xitongzixun/autoSort";
				if(localStorage.getItem('frontToken')) {
					autoSortUrl = "xitongzixun/autoSort2";
				}
				data = {
					page: 1,
					limit: 6,
				}
				this.$http.get(autoSortUrl, {params: data}).then(res => {
					if (res.data.code == 0) {
						this.xitongzixunRecommend = res.data.data.list;
					}
				});
			
				data = {
					page: 1,
					limit: 6,
				}

				this.$http.get('gonggaoxinxi/list', {params: data}).then(res => {
					if (res.data.code == 0) {
						this.gonggaoxinxiList = res.data.data.list;
					}
				});
			},
			toDetail(path, item) {
				this.$router.push({path: '/index/' + path, query: {id: item.id, storeupType: 1}});
			},
			moreBtn(path) {
				this.$router.push({path: '/index/' + path});
			}
		}
	}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.home-preview {
		padding: 0 10%;
		margin: 0 auto;
		overflow: hidden;
		display: flex;
		gap: 20px;
		width: 100%;
		justify-content: space-between;
		flex-wrap: wrap;
		.recommend {
			border-radius: 10px;
			padding: 30px;
			box-shadow: 0 0px 6px rgba(0,0,0,.1);
			margin: 10px auto;
			background: #fff;
			width: 100%;
			border-color: #ddd;
			border-width: 0px 0 0 0;
			position: relative;
			border-style: solid;
			text-align: center;
			order: 1;
			.recommend_title_box {
				display: inline-block;
				width: 100%;
				text-align: left;
				.recommend_title {
					padding:  0 0 0 10px;
					color: #333;
					width: auto;
					font-size: 32px;
					border-color: #ff6d6d;
					border-width: 0 0 0 6px;
					line-height: 1;
					border-style: solid;
				}
				.recommend_subhead {
					margin: 0;
					color: #2b2b2b;
					font-weight: 500;
					display: none;
					width: auto;
					font-size: 18px;
					line-height: 30px;
					text-align: center;
				}
			}
			.index-pv1 .animation-box {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				z-index: initial;
			}
			
			.index-pv1 .animation-box:hover {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, -4px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
			}
			
			.index-pv1 .animation-box img {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			}
			
			.index-pv1 .animation-box img:hover {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
			.list1 {
				padding: 0;
				margin: 30px 0 0 -10px;
				color: #666;
				background: none;
				width: calc(100% + 20px);
				font-size: 12px;
				text-align: left;
				height: auto;
				.list-item {
					cursor: pointer;
					padding: 0 0 10px;
					margin: 0 10px 20px;
					background: #fff;
					display: inline-block;
					width: calc(33.33% - 20px);
					position: relative;
					height: auto;
					img {
						border-radius: 10px;
						padding: 20px;
						box-shadow: 0 0px 6px rgba(0,0,0,.1);
						margin: 0 0 10px;
						object-fit: cover;
						display: block;
						width: 100%;
						height: 350px;
					}
					.name {
						padding: 0 10px;
						overflow: hidden;
						color: #333;
						white-space: nowrap;
						width: 100%;
						font-size: 16px;
						line-height: 1.5;
						text-overflow: ellipsis;
					}
					.price {
						padding: 0 10px;
						color: #f00;
						font-size: 16px;
						line-height: 1.5;
					}
					.time_item {
						padding: 0 10px;
						.icon {
							margin: 0 2px 0 0;
							line-height: 1.5;
						}
						.label {
							line-height: 1.5;
						}
						.text {
							line-height: 1.5;
						}
					}
					.publisher_item {
						padding: 0 10px;
						.icon {
							margin: 0 2px 0 0;
							line-height: 1.5;
						}
						.label {
							line-height: 1.5;
						}
						.text {
							line-height: 1.5;
						}
					}
					.like_item {
						padding: 0 10px;
						.icon {
							margin: 0 2px 0 0;
							line-height: 1.5;
						}
						.label {
							line-height: 1.5;
						}
						.text {
							line-height: 1.5;
						}
					}
					.collect_item {
						padding: 0 10px;
						.icon {
							margin: 0 2px 0 0;
							line-height: 1.5;
						}
						.label {
							line-height: 1.5;
						}
						.text {
							line-height: 1.5;
						}
					}
					.view_item {
						padding: 0 10px;
						.icon {
							margin: 0 2px 0 0;
							line-height: 1.5;
						}
						.label {
							line-height: 1.5;
						}
						.text {
							line-height: 1.5;
						}
					}
				}
			}
			.moreBtn {
				border: 0px solid #ddd;
				cursor: pointer;
				margin: 0;
				top: 30px;
				display: block;
				width: auto;
				line-height: 40px;
				position: absolute;
				right: 30px;
				.text {
					margin: 0 5px 0 0;
					color: #999;
					font-size: 14px;
					order: 2;
				}
				.icon {
					margin: 0 10px 0 0;
					color: #fff;
					display: none;
					width: auto;
					font-size: 18px;
					height: 7px;
				}
			}
		}
		.lists {
			border-radius: 10px;
			padding: 30px;
			box-shadow: 0 0px 6px rgba(0,0,0,.1);
			margin: 20px auto;
			background: #fff;
			width: 100%;
			border-color: #ddd;
			border-width: 0px 0 0 0;
			position: relative;
			border-style: solid;
			text-align: left;
			order: 6;
			.list_title_box {
				display: inline-block;
				width: 100%;
				text-align: left;
				.list_title {
					padding:  0 0 0 10px;
					color: #333;
					width: auto;
					font-size: 32px;
					border-color: #ff6d6d;
					border-width: 0 0 0 6px;
					line-height: 1;
					border-style: solid;
				}
				.list_subhead {
					margin: 0;
					color: #2b2b2b;
					font-weight: 500;
					display: none;
					width: 100%;
					font-size: 16px;
					line-height: 2;
					text-align: center;
				}
			}
			.index-pv1 .animation-box {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				z-index: initial;
			}
			
			.index-pv1 .animation-box:hover {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, -5px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
			}
			
			.index-pv1 .animation-box img {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			}
			
			.index-pv1 .animation-box img:hover {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
			.list1 {
				padding: 0;
				margin: 30px 0 0 -10px;
				background: none;
				width: calc(100% + 20px);
				height: auto;
				.list-item {
					cursor: pointer;
					padding: 0 0 10px;
					margin: 0 10px 20px;
					background: #fff;
					display: inline-block;
					width: calc(33.33% - 20px);
					position: relative;
					height: auto;
					img {
						border-radius: 10px;
						padding: 20px;
						box-shadow: 0 0px 6px rgba(0,0,0,.1);
						margin: 0 0 10px;
						object-fit: cover;
						display: block;
						width: 100%;
						height: 350px;
					}
					.name {
						padding: 0 10px;
						overflow: hidden;
						color: #333;
						white-space: nowrap;
						font-weight: 500;
						width: 100%;
						font-size: 16px;
						line-height: 26px;
						text-overflow: ellipsis;
					}
					.price {
						padding: 0 10px;
						color: #f00;
						width: 100%;
						font-size: 16px;
						line-height: 1.5;
					}
					.time_item {
						padding: 0 10px;
						.icon {
							margin: 0 2px 0 0;
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.label {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.text {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
					}
					.publisher_item {
						padding: 0 10px;
						.icon {
							margin: 0 2px 0 0;
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.label {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.text {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
					}
					.like_item {
						padding: 0 10px;
						.icon {
							margin: 0 2px 0 0;
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.label {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.text {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
					}
					.collect_item {
						padding: 0 10px;
						.icon {
							margin: 0 2px 0 0;
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.label {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.text {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
					}
					.view_item {
						padding: 0 10px;
						.icon {
							margin: 0 2px 0 0;
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.label {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.text {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
					}
				}
			}
			.moreBtn {
				border: 0px solid #04a44a30;
				cursor: pointer;
				padding: 0;
				margin: 0;
				display: block;
				line-height: 36px;
				right: 30px;
				border-radius: 36px;
				top: 30px;
				background: none;
				width: auto;
				position: absolute;
				text-align: center;
				.text {
					margin: 0;
					color: #999;
					font-size: 14px;
					order: 2;
				}
				.icon {
					color: #999;
					background: none;
					display: none;
					width: 23px;
					font-size: 16px;
					height: 7px;
				}
			}
		}
	}
</style>

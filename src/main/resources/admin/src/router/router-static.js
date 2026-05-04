	import Vue from 'vue';
//配置路由
	import VueRouter from 'vue-router'
	Vue.use(VueRouter);
//1.创建组件
	import Index from '@/views/index'
	import Home from '@/views/home'
	import Login from '@/views/login'
	import NotFound from '@/views/404'
	import UpdatePassword from '@/views/update-password'
	import pay from '@/views/pay'
	import register from '@/views/register'
	import center from '@/views/center'
	import yonghu from '@/views/modules/yonghu/list'
	import shangjia from '@/views/modules/shangjia/list'
	import shequxinxi from '@/views/modules/shequxinxi/list'
	import shangpinfenlei from '@/views/modules/shangpinfenlei/list'
	import shangpinxinxi from '@/views/modules/shangpinxinxi/list'
	import orders from '@/views/modules/orders/list'
	import xitongzixun from '@/views/modules/xitongzixun/list'
	import gonggaoxinxi from '@/views/modules/gonggaoxinxi/list'
	import chatmessage from '@/views/modules/chatmessage/list'
	import friend from '@/views/modules/friend/list'
	import chat from '@/views/modules/chat/list'
	import cart from '@/views/modules/cart/list'
	import address from '@/views/modules/address/list'
	import chargerecord from '@/views/modules/chargerecord/list'
	import users from '@/views/modules/users/list'
	import discussshangpinxinxi from '@/views/modules/discussshangpinxinxi/list'
import config from '@/views/modules/config/list'

//2.配置路由   注意：名字
export const routes = [{
	path: '/',
	name: '系统首页',
	component: Index,
	children: [{
		// 这里不设置值，是把main作为默认页面
		path: '/',
		name: '系统首页',
		component: Home,
		meta: {icon:'', title:'center', affix: true}
	}, {
		path: '/updatePassword',
		name: '修改密码',
		component: UpdatePassword,
		meta: {icon:'', title:'updatePassword'}
	}, {
		path: '/pay',
		name: '支付',
		component: pay,
		meta: {icon:'', title:'pay'}
	}, {
		path: '/center',
		name: '个人信息',
		component: center,
		meta: {icon:'', title:'center'}
	}
	,{
		path: '/yonghu',
		name: '用户',
		component: yonghu
	}
	,{
		path: '/shangjia',
		name: '商家',
		component: shangjia
	}
	,{
		path: '/shequxinxi',
		name: '社区信息',
		component: shequxinxi
	}
	,{
		path: '/shangpinfenlei',
		name: '商品分类',
		component: shangpinfenlei
	}
	,{
		path: '/shangpinxinxi',
		name: '商品信息',
		component: shangpinxinxi
	}
	,{
		path: '/orders/:status',
		name: '订单',
		component: orders
	}
	,{
		path: '/ordersstat',
		name: '订单统计',
		component: orders
	}
	,{
		path: '/xitongzixun',
		name: '系统资讯',
		component: xitongzixun
	}
	,{
		path: '/gonggaoxinxi',
		name: '公告信息',
		component: gonggaoxinxi
	}
	,{
		path: '/chatmessage',
		name: '消息表',
		component: chatmessage
	}
	,{
		path: '/friend',
		name: '好友表',
		component: friend
	}
	,{
		path: '/chat',
		name: 'AI智能导购',
		component: chat
	}
	,{
		path: '/cart',
		name: '购物车表',
		component: cart
	}
	,{
		path: '/address',
		name: '地址',
		component: address
	}
	,{
		path: '/chargerecord',
		name: '充值记录表',
		component: chargerecord
	}
	,{
		path: '/users',
		name: '管理员',
		component: users
	}
	,{
		path: '/discussshangpinxinxi',
		name: '商品信息评论',
		component: discussshangpinxinxi
	}
	,{
		path: '/config/:type',
		name: '配置管理',
		component: config
	}
	]
	},
	{
		path: '/login',
		name: 'login',
		component: Login,
		meta: {icon:'', title:'login'}
	},
	{
		path: '/register',
		name: 'register',
		component: register,
		meta: {icon:'', title:'register'}
	},
	{
		path: '*',
		component: NotFound
	}
]
//3.实例化VueRouter  注意：名字
const router = new VueRouter({
	mode: 'hash',
	/*hash模式改为history*/
	routes // （缩写）相当于 routes: routes
})
const originalPush = VueRouter.prototype.push
//修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
	return originalPush.call(this, location).catch(err => err)
}
export default router;

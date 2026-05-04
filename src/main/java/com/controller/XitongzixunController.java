package com.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.*;
import java.lang.*;
import java.math.*;
import com.utils.*;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;
import com.utils.UserBasedCollaborativeFiltering;
import com.algorithm.recommend.RecommendAlgorithmFactory;

import com.entity.XitongzixunEntity;
import com.entity.view.XitongzixunView;

import com.service.XitongzixunService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.EncryptUtil;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;
import com.service.StoreupService;
import com.entity.StoreupEntity;

/**
 * 系统资讯
 * 后端接口
 * @author 
 * @email 
 * @date 2026-03-12 13:01:01
 */
@RestController
@RequestMapping("/xitongzixun")
public class XitongzixunController {
    @Autowired
    private XitongzixunService xitongzixunService;

    @Autowired
    private StoreupService storeupService;









    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,XitongzixunEntity xitongzixun,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<XitongzixunEntity> ew = new EntityWrapper<XitongzixunEntity>();


        //查询结果
		PageUtils page = xitongzixunService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xitongzixun), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }


    /**
     * 前台列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,XitongzixunEntity xitongzixun,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd") Date fabushijianstart,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd") Date fabushijianend,
                @RequestParam(required = false) Double thumbsupnumstart,
                @RequestParam(required = false) Double thumbsupnumend,
                @RequestParam(required = false) Double crazilynumstart,
                @RequestParam(required = false) Double crazilynumend,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date clicktimestart,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date clicktimeend,
                @RequestParam(required = false) Double clicknumstart,
                @RequestParam(required = false) Double clicknumend,
                @RequestParam(required = false) Double storeupnumstart,
                @RequestParam(required = false) Double storeupnumend,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<XitongzixunEntity> ew = new EntityWrapper<XitongzixunEntity>();
        if(fabushijianstart!=null) ew.ge("fabushijian", fabushijianstart);
        if(fabushijianend!=null) ew.le("fabushijian", fabushijianend);
        if(thumbsupnumstart!=null) ew.ge("thumbsupnum", thumbsupnumstart);
        if(thumbsupnumend!=null) ew.le("thumbsupnum", thumbsupnumend);
        if(crazilynumstart!=null) ew.ge("crazilynum", crazilynumstart);
        if(crazilynumend!=null) ew.le("crazilynum", crazilynumend);
        if(clicktimestart!=null) ew.ge("clicktime", clicktimestart);
        if(clicktimeend!=null) ew.le("clicktime", clicktimeend);
        if(clicknumstart!=null) ew.ge("clicknum", clicknumstart);
        if(clicknumend!=null) ew.le("clicknum", clicknumend);
        if(storeupnumstart!=null) ew.ge("storeupnum", storeupnumstart);
        if(storeupnumend!=null) ew.le("storeupnum", storeupnumend);

        //查询结果
		PageUtils page = xitongzixunService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xitongzixun), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }




	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( XitongzixunEntity xitongzixun){
       	EntityWrapper<XitongzixunEntity> ew = new EntityWrapper<XitongzixunEntity>();
      	ew.allEq(MPUtil.allEQMapPre( xitongzixun, "xitongzixun"));
        return R.ok().put("data", xitongzixunService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(XitongzixunEntity xitongzixun){
        EntityWrapper< XitongzixunEntity> ew = new EntityWrapper< XitongzixunEntity>();
 		ew.allEq(MPUtil.allEQMapPre( xitongzixun, "xitongzixun"));
		XitongzixunView xitongzixunView =  xitongzixunService.selectView(ew);
		return R.ok("查询系统资讯成功").put("data", xitongzixunView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        XitongzixunEntity xitongzixun = xitongzixunService.selectById(id);
        if(null==xitongzixun.getClicknum()){
            xitongzixun.setClicknum(0);
        }
		xitongzixun.setClicknum(xitongzixun.getClicknum()+1);
		xitongzixunService.updateById(xitongzixun);
        xitongzixun = xitongzixunService.selectView(new EntityWrapper<XitongzixunEntity>().eq("id", id));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(xitongzixun,deSens);
        return R.ok().put("data", xitongzixun);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        XitongzixunEntity xitongzixun = xitongzixunService.selectById(id);
        if(null==xitongzixun.getClicknum()){
            xitongzixun.setClicknum(0);
        }
		xitongzixun.setClicknum(xitongzixun.getClicknum()+1);
		xitongzixunService.updateById(xitongzixun);
        xitongzixun = xitongzixunService.selectView(new EntityWrapper<XitongzixunEntity>().eq("id", id));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(xitongzixun,deSens);
        return R.ok().put("data", xitongzixun);
    }



    /**
     * 赞或踩
     */
    @RequestMapping("/thumbsup/{id}")
    public R vote(@PathVariable("id") String id,String type){
        XitongzixunEntity xitongzixun = xitongzixunService.selectById(id);
        if(type.equals("1")) {
        	xitongzixun.setThumbsupnum(xitongzixun.getThumbsupnum()+1);
        } else {
        	xitongzixun.setCrazilynum(xitongzixun.getCrazilynum()+1);
        }
        xitongzixunService.updateById(xitongzixun);
        return R.ok("投票成功");
    }

    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody XitongzixunEntity xitongzixun, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xitongzixun);
        xitongzixunService.insert(xitongzixun);
        return R.ok().put("data",xitongzixun.getId());
    }

    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody XitongzixunEntity xitongzixun, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xitongzixun);
        xitongzixunService.insert(xitongzixun);
        return R.ok().put("data",xitongzixun.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody XitongzixunEntity xitongzixun, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xitongzixun);
        //全部更新
        xitongzixunService.updateById(xitongzixun);
        return R.ok();
    }





    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        xitongzixunService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

	/**
     * 前台智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,XitongzixunEntity xitongzixun, HttpServletRequest request,String pre){
        EntityWrapper<XitongzixunEntity> ew = new EntityWrapper<XitongzixunEntity>();
        Map<String, Object> newMap = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        // 组装参数
		Iterator<Map.Entry<String, Object>> it = param.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, Object> entry = it.next();
			String key = entry.getKey();
			String newKey = entry.getKey();
			if (pre.endsWith(".")) {
				newMap.put(pre + newKey, entry.getValue());
			} else if (StringUtils.isEmpty(pre)) {
				newMap.put(newKey, entry.getValue());
			} else {
				newMap.put(pre + "." + newKey, entry.getValue());
			}
		}
		params.put("sort", "clicknum");
        params.put("order", "desc");

		PageUtils page = xitongzixunService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xitongzixun), params), params));
        return R.ok().put("data", page);
    }



    /**
     * 协同算法（基于用户的协同算法：购买、收藏、关注）
     */
    @RequestMapping("/autoSort2")
    public R autoSort2(@RequestParam Map<String, Object> params,XitongzixunEntity xitongzixun, HttpServletRequest request){
        String userId = request.getSession().getAttribute("userId").toString();
        Integer limit = params.get("limit") == null ? 10 : Integer.parseInt(params.get("limit").toString());
        //用户行为数据
        List<RecommendAlgorithmFactory.UserBehavior> userBehaviors = new ArrayList<>();
        // 查询收藏/关注数据
        userBehaviors.addAll(storeupService.selectList(new EntityWrapper<StoreupEntity>().eq("type", 1 ).eq("tablename", "xitongzixun")).stream().map(storeup -> {
            return new RecommendAlgorithmFactory.UserBehavior(storeup.getUserid(), storeup.getRefid());
        }).collect(Collectors.toList()));
        // 查询点赞数据
        userBehaviors.addAll(storeupService.selectList(new EntityWrapper<StoreupEntity>().eq("type", 21).eq("tablename", "xitongzixun")).stream().map(storeup -> {
            return new RecommendAlgorithmFactory.UserBehavior(storeup.getUserid(), storeup.getRefid());
        }).collect(Collectors.toList()));
        // 根据物品推荐用户
        // 用协 算法推荐物品id
        List<Long> recommendations = RecommendAlgorithmFactory.buildUserItemMatrix(userBehaviors).recommendItems(Long.parseLong(userId), limit);
        // 输出推荐结果
        System.out.println("Recommendations for " + userId + ":");
        recommendations.forEach(recommendation -> System.out.println(recommendation));
        EntityWrapper<XitongzixunEntity> ew = new EntityWrapper<XitongzixunEntity>();

        if(recommendations!=null && recommendations.size()>0) {
            ew.in("id", recommendations);
            ew.last("order by FIELD(id, "+String.join(",", recommendations.stream().map(String::valueOf).collect(Collectors.toList()))+")");
        }
        // 根据协同结果查询结果并返回
        PageUtils page = xitongzixunService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xitongzixun), params), params));
        List<XitongzixunEntity> pageList = (List<XitongzixunEntity>)page.getList();
        if(recommendations!=null && recommendations.size()>0 && pageList.size()<limit) {
            int toAddNum = limit-pageList.size();
            ew = new EntityWrapper<XitongzixunEntity>();
            ew.notIn("id", recommendations);
            ew.orderBy("id", false);
            ew.last("limit "+toAddNum);
            pageList.addAll(xitongzixunService.selectList(ew));
        } else if(pageList.size()>limit) {
            pageList = pageList.subList(0, limit);
        }
        page.setList(pageList);
        return R.ok().put("data", page);
    }






}

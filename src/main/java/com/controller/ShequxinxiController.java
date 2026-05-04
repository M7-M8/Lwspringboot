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

import com.entity.ShequxinxiEntity;
import com.entity.view.ShequxinxiView;

import com.service.ShequxinxiService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.EncryptUtil;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 社区信息
 * 后端接口
 * @author 
 * @email 
 * @date 2026-03-12 13:01:01
 */
@RestController
@RequestMapping("/shequxinxi")
public class ShequxinxiController {
    @Autowired
    private ShequxinxiService shequxinxiService;










    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,ShequxinxiEntity shequxinxi,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<ShequxinxiEntity> ew = new EntityWrapper<ShequxinxiEntity>();


        //查询结果
		PageUtils page = shequxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, shequxinxi), params), params));
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
    public R list(@RequestParam Map<String, Object> params,ShequxinxiEntity shequxinxi,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<ShequxinxiEntity> ew = new EntityWrapper<ShequxinxiEntity>();

        //查询结果
		PageUtils page = shequxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, shequxinxi), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }




	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( ShequxinxiEntity shequxinxi){
       	EntityWrapper<ShequxinxiEntity> ew = new EntityWrapper<ShequxinxiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( shequxinxi, "shequxinxi"));
        return R.ok().put("data", shequxinxiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(ShequxinxiEntity shequxinxi){
        EntityWrapper< ShequxinxiEntity> ew = new EntityWrapper< ShequxinxiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( shequxinxi, "shequxinxi"));
		ShequxinxiView shequxinxiView =  shequxinxiService.selectView(ew);
		return R.ok("查询社区信息成功").put("data", shequxinxiView);
    }

    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        ShequxinxiEntity shequxinxi = shequxinxiService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(shequxinxi,deSens);
        return R.ok().put("data", shequxinxi);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        ShequxinxiEntity shequxinxi = shequxinxiService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(shequxinxi,deSens);
        return R.ok().put("data", shequxinxi);
    }




    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ShequxinxiEntity shequxinxi, HttpServletRequest request){
        //验证字段唯一性，否则返回错误信息
        if(shequxinxiService.selectCount(new EntityWrapper<ShequxinxiEntity>().eq("shequ", shequxinxi.getShequ()))>0) {
            return R.error("社区已存在");
        }
        //ValidatorUtils.validateEntity(shequxinxi);
        shequxinxiService.insert(shequxinxi);
        return R.ok().put("data",shequxinxi.getId());
    }

    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody ShequxinxiEntity shequxinxi, HttpServletRequest request){
        //验证字段唯一性，否则返回错误信息
        if(shequxinxiService.selectCount(new EntityWrapper<ShequxinxiEntity>().eq("shequ", shequxinxi.getShequ()))>0) {
            return R.error("社区已存在");
        }
        //ValidatorUtils.validateEntity(shequxinxi);
        shequxinxiService.insert(shequxinxi);
        return R.ok().put("data",shequxinxi.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody ShequxinxiEntity shequxinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(shequxinxi);
        //验证字段唯一性，否则返回错误信息
        if(shequxinxiService.selectCount(new EntityWrapper<ShequxinxiEntity>().ne("id", shequxinxi.getId()).eq("shequ", shequxinxi.getShequ()))>0) {
            return R.error("社区已存在");
        }
        //全部更新
        shequxinxiService.updateById(shequxinxi);
        return R.ok();
    }





    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        shequxinxiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }










}

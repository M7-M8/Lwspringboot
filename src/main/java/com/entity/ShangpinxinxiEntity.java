package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import lombok.*;
import cn.hutool.core.annotation.Alias;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;


/**
 * 商品信息
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2026-03-12 13:01:01
 */
@TableName("shangpinxinxi")
@Data
public class ShangpinxinxiEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public ShangpinxinxiEntity() {
		
	}
	
	public ShangpinxinxiEntity(T t) {
		try {
			BeanUtils.copyProperties(t, this);
		} catch (BeansException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	/**
	 * 主键id
	 */
    @TableId(type = IdType.AUTO)
	private Long id;
	/**
	 * 商品名称
	 */
							private String shangpinmingcheng;
	
	/**
	 * 商品分类
	 */
							private String shangpinfenlei;
	
	/**
	 * 商品图片
	 */
							private String shangpintupian;
	
	/**
	 * 规格
	 */
							private String guige;
	
	/**
	 * 品牌
	 */
							private String pinpai;
	
	/**
	 * 商品描述
	 */
							private String shangpinmiaoshu;
	
	/**
	 * 店铺名
	 */
							private String dianpuming;
	
	/**
	 * 单限
	 */
							private Integer onelimittimes;
	
	/**
	 * 库存
	 */
							private Integer alllimittimes;
	
	/**
	 * 价格
	 */
							private Double price;
	
	/**
	 * 赞
	 */
							private Integer thumbsupnum;
	
	/**
	 * 踩
	 */
							private Integer crazilynum;
	
	/**
	 * 最近点击时间
	 */
				@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
					private Date clicktime;
	
	/**
	 * 倒计结束时间
	 */
				@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
					private Date reversetime;
	
	/**
	 * 点击次数
	 */
							private Integer clicknum;
	
	/**
	 * 评论数
	 */
							private Integer discussnum;
	
	/**
	 * 是否上架(1:上架，0:下架)
	 */
							private Integer onshelves;
	
	/**
	 * 团购价
	 */
							private Double groupprice;
	
	/**
	 * 拼团人数
	 */
							private Integer grouppeople;
	
	/**
	 * 当前人数
	 */
							private Integer curpeople;
	
	/**
	 * 收藏数
	 */
							private Integer storeupnum;
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

}

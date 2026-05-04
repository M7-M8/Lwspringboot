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
 * 系统资讯
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2026-03-12 13:01:01
 */
@TableName("xitongzixun")
@Data
public class XitongzixunEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public XitongzixunEntity() {
		
	}
	
	public XitongzixunEntity(T t) {
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
	 * 标题
	 */
							private String biaoti;
	
	/**
	 * 分类
	 */
							private String fenlei;
	
	/**
	 * 简介
	 */
							private String jianjie;
	
	/**
	 * 发布时间
	 */
				@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
	@DateTimeFormat
					private Date fabushijian;
	
	/**
	 * 封面
	 */
							private String fengmian;
	
	/**
	 * 内容
	 */
							private String neirong;
	
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
	 * 点击次数
	 */
							private Integer clicknum;
	
	/**
	 * 收藏数
	 */
							private Integer storeupnum;
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

}

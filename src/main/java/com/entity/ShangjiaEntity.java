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
 * 商家
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2026-03-12 13:01:01
 */
@TableName("shangjia")
@Data
public class ShangjiaEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public ShangjiaEntity() {
		
	}
	
	public ShangjiaEntity(T t) {
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
    @TableId
	private Long id;
	/**
	 * 店铺名
	 */
							@Alias("店铺名")
		private String dianpuming;
	
	/**
	 * 密码
	 */
							@Alias("密码")
		private String mima;
	
	/**
	 * 负责人
	 */
							@Alias("负责人")
		private String fuzeren;
	
	/**
	 * 性别
	 */
							@Alias("性别")
		private String xingbie;
	
	/**
	 * 联系电话
	 */
							@Alias("联系电话")
		private String lianxidianhua;
	
	/**
	 * 头像
	 */
							private String touxiang;
	
	/**
	 * 资质文件
	 */
							private String zizhiwenjian;
	
	/**
	 * 是否审核
	 */
							private String sfsh;
	
	/**
	 * 审核回复
	 */
							private String shhf;
	
	/**
	 * 余额
	 */
							private Double money;
	
	/**
	 * 状态
	 */
							private Integer status;
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

}

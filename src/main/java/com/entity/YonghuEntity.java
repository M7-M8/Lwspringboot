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
 * 用户
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2026-03-12 13:01:01
 */
@TableName("yonghu")
@Data
public class YonghuEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public YonghuEntity() {
		
	}
	
	public YonghuEntity(T t) {
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
	 * 账号
	 */
							private String zhanghao;
	
	/**
	 * 密码
	 */
							private String mima;
	
	/**
	 * 姓名
	 */
							private String xingming;
	
	/**
	 * 性别
	 */
							private String xingbie;
	
	/**
	 * 手机
	 */
							private String shouji;
	
	/**
	 * 头像
	 */
							private String touxiang;
	
	/**
	 * 社区
	 */
							private String shequ;
	
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
	 * 密保问题
	 */
							private String pquestion;
	
	/**
	 * 密保答案
	 */
							private String panswer;
	
	/**
	 * 状态
	 */
							private Integer status;
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

}

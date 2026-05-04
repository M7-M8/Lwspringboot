package com.entity.vo;

import com.entity.GonggaoxinxiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
 

/**
 * 公告信息
 * @author 
 * @email 
 * @date 2026-03-12 13:01:02
 */
public class GonggaoxinxiVO  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 公告简介
	 */
	
	private String gonggaojianjie;
		
	/**
	 * 发布时间
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date fabushijian;
		
	/**
	 * 公告封面
	 */
	
	private String gonggaofengmian;
		
	/**
	 * 公告内容
	 */
	
	private String gonggaoneirong;
				
	
	/**
	 * 设置：公告简介
	 */
	 
	public void setGonggaojianjie(String gonggaojianjie) {
		this.gonggaojianjie = gonggaojianjie;
	}
	
	/**
	 * 获取：公告简介
	 */
	public String getGonggaojianjie() {
		return gonggaojianjie;
	}
				
	
	/**
	 * 设置：发布时间
	 */
	 
	public void setFabushijian(Date fabushijian) {
		this.fabushijian = fabushijian;
	}
	
	/**
	 * 获取：发布时间
	 */
	public Date getFabushijian() {
		return fabushijian;
	}
				
	
	/**
	 * 设置：公告封面
	 */
	 
	public void setGonggaofengmian(String gonggaofengmian) {
		this.gonggaofengmian = gonggaofengmian;
	}
	
	/**
	 * 获取：公告封面
	 */
	public String getGonggaofengmian() {
		return gonggaofengmian;
	}
				
	
	/**
	 * 设置：公告内容
	 */
	 
	public void setGonggaoneirong(String gonggaoneirong) {
		this.gonggaoneirong = gonggaoneirong;
	}
	
	/**
	 * 获取：公告内容
	 */
	public String getGonggaoneirong() {
		return gonggaoneirong;
	}
			
}

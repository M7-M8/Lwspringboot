package com.entity.view;

import com.entity.XitongzixunEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.utils.EncryptUtil;
 

/**
 * 系统资讯
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2026-03-12 13:01:01
 */
@TableName("xitongzixun")
public class XitongzixunView  extends XitongzixunEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public XitongzixunView(){
	}
 
 	public XitongzixunView(XitongzixunEntity xitongzixunEntity){
 	try {
			BeanUtils.copyProperties(this, xitongzixunEntity);
		} catch (BeansException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}

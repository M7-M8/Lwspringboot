package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.XitongzixunEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.XitongzixunVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.XitongzixunView;


/**
 * 系统资讯
 *
 * @author 
 * @email 
 * @date 2026-03-12 13:01:01
 */
public interface XitongzixunService extends IService<XitongzixunEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<XitongzixunVO> selectListVO(Wrapper<XitongzixunEntity> wrapper);
   	
   	XitongzixunVO selectVO(@Param("ew") Wrapper<XitongzixunEntity> wrapper);
   	
   	List<XitongzixunView> selectListView(Wrapper<XitongzixunEntity> wrapper);
   	
   	XitongzixunView selectView(@Param("ew") Wrapper<XitongzixunEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<XitongzixunEntity> wrapper);

   	

}


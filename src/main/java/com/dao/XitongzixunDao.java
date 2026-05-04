package com.dao;

import com.entity.XitongzixunEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.XitongzixunVO;
import com.entity.view.XitongzixunView;


/**
 * 系统资讯
 * 
 * @author 
 * @email 
 * @date 2026-03-12 13:01:01
 */
public interface XitongzixunDao extends BaseMapper<XitongzixunEntity> {
	
	List<XitongzixunVO> selectListVO(@Param("ew") Wrapper<XitongzixunEntity> wrapper);
	
	XitongzixunVO selectVO(@Param("ew") Wrapper<XitongzixunEntity> wrapper);
	
	List<XitongzixunView> selectListView(@Param("ew") Wrapper<XitongzixunEntity> wrapper);

	List<XitongzixunView> selectListView(Pagination page,@Param("ew") Wrapper<XitongzixunEntity> wrapper);

	
	XitongzixunView selectView(@Param("ew") Wrapper<XitongzixunEntity> wrapper);
	

}

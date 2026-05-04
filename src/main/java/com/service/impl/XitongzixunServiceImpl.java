package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.XitongzixunDao;
import com.entity.XitongzixunEntity;
import com.service.XitongzixunService;
import com.entity.vo.XitongzixunVO;
import com.entity.view.XitongzixunView;

@Service("xitongzixunService")
public class XitongzixunServiceImpl extends ServiceImpl<XitongzixunDao, XitongzixunEntity> implements XitongzixunService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<XitongzixunEntity> page = this.selectPage(
                new Query<XitongzixunEntity>(params).getPage(),
                new EntityWrapper<XitongzixunEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<XitongzixunEntity> wrapper) {
		  Page<XitongzixunView> page =new Query<XitongzixunView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<XitongzixunVO> selectListVO(Wrapper<XitongzixunEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public XitongzixunVO selectVO(Wrapper<XitongzixunEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<XitongzixunView> selectListView(Wrapper<XitongzixunEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public XitongzixunView selectView(Wrapper<XitongzixunEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}

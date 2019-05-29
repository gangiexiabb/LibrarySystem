package com.oracle.web.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.oracle.web.bean.Fenlei;
import com.oracle.web.mapper.FenleiMapper;
import com.oracle.web.service.FenleiService;

public class FenleiServiceImpl implements FenleiService {

	private FenleiMapper fenleiMapper;

	@Transactional(readOnly = true)
	public List<Fenlei> list() {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectAll();
	}

	
	public int save(Fenlei fenlei) {
		// TODO Auto-generated method stub
		return this.fenleiMapper.insert(fenlei);
	}

	
	public int delete(Fenlei fenlei) {
		// TODO Auto-generated method stub
		return this.fenleiMapper.deleteByPrimaryKey(fenlei.getFid());
	}


//	@Overrffide
//	public int queryOneFenlei(Fenlei fenlei) {
//		// TODO Auto-generated method stub
//		return this.fenleiMapper.selectByPrimaryKey(fenlei);
//	}

	
	public Fenlei queryOneFenlei(Integer fid) {
		// TODO Auto-generated method stub
		return this.fenleiMapper.selectByPrimaryKey(fid);
	}

	
	public void update(Fenlei fenlei) {
		// TODO Auto-generated method stub
		
		this.fenleiMapper.updateByPrimaryKey(fenlei);
		
	}

}

package com.oracle.web.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.web.service.FenleiService;
import com.oracle.web.bean.Fenlei;
public class FenleiHandler {
	@Autowired
	private FenleiService fenleiService;
	
	@RequestMapping(value = "/fenlei", method = RequestMethod.GET)
	
	public String Fenlei(HttpServletRequest request) {

		List<Fenlei> fList = fenleiService.list();

		request.setAttribute("fList", fList);

		return "showFenlei";
	}
	
//	@RequestMapping(value = "/addUI",method = RequestMethod.GET)
//	
//	public String addUI(HttpServletRequest request){
//		
//		List<Fenlei> list = fenleiService.list();
//
//		request.setAttribute("fList", list);
//		
//		return "addFenlei";
//			
//	}
	
	@RequestMapping(value = "add",method = RequestMethod.POST)
	public String add(Fenlei fenlei){
		
		int i = fenleiService.save(fenlei);
		
		return "redirect:/fenlei";
			
	}
	@RequestMapping(value = "/fenlei/{fid}",method = RequestMethod.DELETE)
	public String delete(@PathVariable("fid") Integer fid){
		
		Fenlei fenlei = new Fenlei();
		
		fenlei.setFid(fid);
		
		int i = fenleiService.delete(fenlei);
		
		return "redirect:/fenlei";
		
		
	}
	
	@RequestMapping(value = "/fenlei/{fid}",method = RequestMethod.GET)
	public String updateUI(@PathVariable("fid") Integer fid,HttpSession session){
		
		Fenlei fenlei = fenleiService.queryOneFenlei(fid);
		
		session.setAttribute("fenlei", fenlei);
		
		return "updateFenlei";
		
		
	}
	
	@RequestMapping(value = "/fenlei", method = RequestMethod.PUT)
	public String update(Fenlei fenlei) {

		fenleiService.update(fenlei);

		return "redirect:/fenlei";
	}

	
	

}

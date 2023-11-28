package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.AdminService;
import com.example.demo.vo.BaesongVo;
import com.example.demo.vo.ProductVo;

@Controller
public class AdminController {

	@Autowired
	@Qualifier("as")
	private AdminService service;
	
	@RequestMapping("/product/productAdd")
	public String productAdd(Model model)
	{
		return service.productAdd(model);
	}
	
	@RequestMapping("/product/getJung")
	public @ResponseBody String getJung(HttpServletRequest request)
	{
		return service.getJung(request);
	}
	
	@RequestMapping("/product/getSo")
	public @ResponseBody String getSo(HttpServletRequest request)
	{
		return service.getSo(request);
	}
	
	@RequestMapping("/product/getPcode")
	public @ResponseBody String getPcode(HttpServletRequest request)
	{
		return service.getPcode(request);
	}
	
	@RequestMapping("/product/plist")
	public String plist(Model model)
	{
		return service.plist(model);
	}
	
	@RequestMapping("/product/delete")
	public String delete(HttpServletRequest request)
	{
		return service.delete(request);
	}
	
	@RequestMapping("/product/test")
	public void test()
	{
		service.test();
	}
	
	@RequestMapping("/product/productAddOk")
	public String productAddOk(HttpServletRequest request)
	{
		return service.productAddOk(request);
	}
	
	@RequestMapping("/gumae/gumaeState")
	public String gumaeState(Model model,HttpSession session)
	{   // 관리자 session이 필요
		System.out.println(session.getAttribute("userid"));
		return service.gumaeState(model);
	}
	
	@RequestMapping("/gumae/getProduct")
	public @ResponseBody ProductVo  getProduct(HttpServletRequest request)
	{
		return service.getProduct(request);
	}
	
	@RequestMapping("/gumae/getBaesong")
	public @ResponseBody BaesongVo getBaesong(HttpServletRequest request)
	{
	    return service.getBaesong(request);	
	}
	
	@RequestMapping("/gumae/stateChange")
	public String stateChange(HttpServletRequest request)
	{
		return service.stateChange(request);
	}
	
	@RequestMapping("/main/main")
	public String main()
	{
		return "/main/main";
	}
	
	@RequestMapping("/")
	public String home()
	{
		return "redirect:/main/main";
	}
	
	@RequestMapping("/member/memberlist")
	public String memberlist(Model model)
	{
		return service.memberlist(model);
	}
	
	@RequestMapping("/member/memberOut")
	public String memberOut(HttpServletRequest request)  // update member set state=2 where no=?
	{
		return service.memberOut(request);
	}
	
	@RequestMapping("/product/adminReview")
	public String adminReview(HttpServletRequest request,Model model)
	{
		return service.adminReview(request,model);
	}
	
	@RequestMapping("/product/reviewDel")
	public @ResponseBody String reviewDel(HttpServletRequest request)
	{
		return service.reviewDel(request);
	}
	
	@RequestMapping("/answer/answerlist")
	public String answerlist(Model model)
	{
		return service.answerlist(model);
	}
}










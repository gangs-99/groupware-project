package com.sh.groupware.sign.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/sign")
public class SignController {

	@GetMapping("/sign.do")
	public String sign() {
		return "sign/signHome";
	} // sign() end
	
	@GetMapping("/signCreate.do")
	public String signCreate() {
		return "sign/signCreate";
	} // signCreate() end
	
	@GetMapping("/form/dayOff.do")
	public String dayOff() {
		return "form/dayOffForm";
	} // dayOff() end
	
	@GetMapping("/form/trip.do")
	public String trip() {
		return "form/tripForm";
	} // trip() end
	
	@GetMapping("/form/product.do")
	public String product() {
		return "form/productForm";
	} // product() end
	
	@GetMapping("/form/resignation.do")
	public String resignation() {
		return "form/resignationForm";
	} // resignation() end
	
} // class end
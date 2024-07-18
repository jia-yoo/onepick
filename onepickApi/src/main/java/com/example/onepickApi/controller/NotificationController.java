package com.example.onepickApi.controller;

import java.util.Enumeration;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.onepickApi.entity.Company;
import com.example.onepickApi.entity.User;
import com.example.onepickApi.repository.CompanyRepository;
import com.example.onepickApi.repository.UserRepository;
//import com.example.onepickApi.service.NotificationService;

import jakarta.servlet.http.HttpServletRequest;

@CrossOrigin("*")
@RequestMapping("/api/v1/notification")
@RestController
public class NotificationController {

//	@Autowired
//	private NotificationService notificationService;
	@Autowired
	private UserRepository userRepo;
	@Autowired
	private CompanyRepository companyRepo;
	

	
    @PostMapping("/register")
    public ResponseEntity<String> registerToken(@RequestBody Map<String, String> notiToken, HttpServletRequest request) {
    	System.out.println("실행");
   
    	System.out.println(notiToken.get("token"));
    	
    	
		
		String username = request.getHeader("username");
 		String token = notiToken.get("token");
 		
    	if(request.getHeader("role").equals("ROLE_USER")) {
    		User user = userRepo.findById(username).get();
    		user.setToken(token);
    		userRepo.save(user);
    		return new ResponseEntity<>("done",HttpStatus.OK);
    	}else if(request.getHeader("role").equals("ROLE_COMPANY")) {
    		Company company = companyRepo.findById(username).get();
    		company.setToken(token);
    		companyRepo.save(company);
    		return new ResponseEntity<>("done",HttpStatus.OK);
    	}
    	return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
    
//	@PostMapping("/test")
//	private  String test(HttpServletRequest request) {
//	
//		
//		String token = companyRepo.findById(request.getHeader("username")).get().getToken();
//		notificationService.sendNotification(token, "번겁슙니다", "알림성공추카드려욥!");
//		
//		
//		return "알림이갔을깝쑝??????";
//	}
	
	
	
}

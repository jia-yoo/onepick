package com.example.onepickApi.controller;

import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.onepickApi.dto.CareerDto;
import com.example.onepickApi.dto.ExperienceDto;
import com.example.onepickApi.dto.LicenseDto;
import com.example.onepickApi.dto.OaDto;
import com.example.onepickApi.dto.ResumeDto;
import com.example.onepickApi.dto.SchoolDto;
import com.example.onepickApi.entity.ApplyList;
import com.example.onepickApi.entity.Career;
import com.example.onepickApi.entity.Experience;
import com.example.onepickApi.entity.License;
import com.example.onepickApi.entity.Member;
import com.example.onepickApi.entity.Oa;
import com.example.onepickApi.entity.Resume;
import com.example.onepickApi.entity.School;
import com.example.onepickApi.entity.User;
import com.example.onepickApi.repository.ApplyListRepository;
import com.example.onepickApi.repository.ResumeRepository;
import com.example.onepickApi.repository.UserRepository;
import com.example.onepickApi.service.ResumeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.websocket.server.PathParam;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/v1")
public class UserResumeController_jia {

	@Autowired
	private ResumeRepository repo;
	
	@Autowired
	private UserRepository userRepo;

	@Autowired
	private ResumeService resumeService;
	
	@Autowired
	private ApplyListRepository applyRepo;


	
	
	
	
	// 이력서 등록하기
		@PostMapping("/resume")
		public ResponseEntity<String> registResume(@RequestBody Map<String, List<Map<String, String>>> data, HttpServletRequest request) {
			
			String username = request.getHeader("username");
			User user = userRepo.findById(username).get();

			System.out.println("map출력 : " + data);
			
			String result = resumeService.saveToDatabase(data, user);


			if (result != null) {
				return ResponseEntity.ok(result); // 200 OK
			} else {
				return ResponseEntity.notFound().build(); // 404 Not Found
			}
		}
	
	
	
	
	
	
	@GetMapping("/userInfo")
	public User getUserInfo(HttpServletRequest request) {
		String username = request.getHeader("username"); 
		Optional<User> result = userRepo.findById(username);
		User user = result.get();
		System.out.println("유저정보 출력하기" + user);
		
		return user;
	}
	
	
	
	// 이력서 리스트 가져오기
	@GetMapping("/resume")
	public List<Resume> getResumeList(HttpServletRequest request) {
		
		//유저정보 불러와서 해당 유저의 이력서 리스트 불러오기
		
		String username = request.getHeader("username"); 
		Optional<User> result = userRepo.findById(username);
		User user = result.get();
		 
		System.out.println("이력서 리스트 출력 - 유저네임 출력 : " + username);
		System.out.println("유저정보 : " + user);
		System.out.println(user.getUsername());
		
		List<Resume> resumeList = repo.findByUser(user);
		System.out.println(resumeList);
		
		
		//List<Resume> resumeList = repo.findAll();
		//System.out.println("이력서 전체 불러오기 : " + resumeList);
		
		//System.out.println("Logged in username: " + username);
		
		/*
		 * Enumeration<String> headers = request.getHeaderNames();
		 * while(headers.hasMoreElements()) {
		 * if(headers.nextElement().equals("username")) { System.out.println("유저네임 : " +
		 * request.getHeader("username")); } }
		 */
		
		return resumeList;
	}

	
	
	//이력서 상세페이지
	@GetMapping("/resume/{rno}")
	public ResponseEntity<?> getResume(@PathVariable("rno") Long rno) {
        try {
            Map<String, Object> result = resumeService.getResumeDetails(rno);
            System.out.println("이력서 상세 데이터 출력 : " + result);
            
            //지원 여부 확인
            //List<ApplyList> apply = applyRepo.findByRno(rno);         
            
            return ResponseEntity.ok(result);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.notFound().build();
        }
    }

	
	
	// 이력서 수정하기
	@PutMapping("/resume/{rno}")
	public ResponseEntity<?> updateResume(@PathVariable("rno") Long rno,ResumeDto resumeDto, CareerDto careerDto, ExperienceDto experienceDto,
			LicenseDto licenseDto, OaDto oaDto, SchoolDto schoolDto) {
		
		try {
	        String result = resumeService.updateResume(rno, resumeDto, careerDto, experienceDto, licenseDto, oaDto, schoolDto);
	        return ResponseEntity.ok(result); // 200 OK
	    } catch (RuntimeException e) {
	        return ResponseEntity.notFound().build(); // 404 Not Found
	    }
		
	}

	
	
	
	
	//이력서 삭제하기
    @DeleteMapping("/resume/{rno}") 
    public ResponseEntity<String> deleteResume(@PathVariable("rno") Long rno) {
	  
	    resumeService.deleteResumeById(rno);
	  
 	    return ResponseEntity.ok("Deleted resume with rno=" + rno); 
    }
		 
    
    
    
    
    // 대표 이력서 설정 기능
    @PutMapping("/resume/setDef/{rno}")
    public ResponseEntity<String> setDefResume(@PathVariable("rno") Long rno, HttpServletRequest request) {
    	
    	String username = request.getHeader("username"); 
		Optional<User> result2 = userRepo.findById(username);
		User user = result2.get();
		
		
        try {
            String result = resumeService.setDefResume(rno,user); // 서비스 메서드 호출
            return ResponseEntity.ok(result); // 200 OK
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("대표 이력서 설정 중 오류 발생");
        }
    }
    
    
    
    
    
    
    
    
	
}

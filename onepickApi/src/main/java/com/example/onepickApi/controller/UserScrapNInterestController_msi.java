package com.example.onepickApi.controller;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.onepickApi.entity.Company;
import com.example.onepickApi.entity.InterestedCop;
import com.example.onepickApi.entity.JobAd;
import com.example.onepickApi.entity.JobadScrap;
import com.example.onepickApi.entity.User;
import com.example.onepickApi.repository.CompanyRepository;
import com.example.onepickApi.repository.InterestedCopRepository;
import com.example.onepickApi.repository.JobAdRepository;
import com.example.onepickApi.repository.JobadScrapRepository;
import com.example.onepickApi.repository.UserRepository;

import jakarta.servlet.http.HttpServletRequest;


@RestController
@CrossOrigin("*")
@RequestMapping("/api/v1")
public class UserScrapNInterestController_msi {
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private JobadScrapRepository scrapRepo; //스크랩 레포지토리
	
	@Autowired
	private InterestedCopRepository interestRepo; //관심기업 레포지토리
	
	@Autowired
	private JobAdRepository jobadRepo; //채용공고 레포지토리
	
	@Autowired
	private CompanyRepository companyRepo; //기업 레포지토리
	
	

	
	
	@GetMapping("/job-scrap")
	public List<JobadScrap> scrapList(HttpServletRequest request) {
		//스크랩 리스트 불러오기
		
		String username = request.getHeader("username"); 
		Optional<User> result = userRepo.findById(username);
		User user = result.get();
		
		List<JobadScrap> scrapList = scrapRepo.findByUser(user);
		
		System.out.println("스크랩 목록 : " + scrapList);

		return scrapList;
	}
	
	

	@DeleteMapping("/job-scrap/{scno}")
	public ResponseEntity<String> deleteScrap(@PathVariable("scno") Long scno) {
		//스크랩 삭제
		scrapRepo.deleteById(scno);
		return new ResponseEntity<>("삭제 성공!", HttpStatus.OK);
	}
	

	
//	@PostMapping("/interested-company/{cid}")
//	public ResponseEntity<String> registInterCom(HttpServletRequest request, @PathVariable("cid") String cid) {
//		//관심기업 추가
//		
//		String username = request.getHeader("username"); 
//		Optional<User> result = userRepo.findById(username);
//		User user = result.get();
//		
//		Company company = companyRepo.findById(cid).get();
//
//		InterestedCop interestedCop = new InterestedCop();
//		interestedCop.setUser(user);
//		interestedCop.setCompany(company);
//	
//		interestRepo.save(interestedCop);
//		
//		return new ResponseEntity<>("관심기업 추가 성공!", HttpStatus.OK);
//		
//	}
	
	
	@GetMapping("/interested-companyList")
	public List<InterestedCop> interComList(HttpServletRequest request) {
		//관심기업 리스트 불러오기
		
		String username = request.getHeader("username"); 
		Optional<User> result = userRepo.findById(username);
		User user = result.get();
		
		List<InterestedCop> interComList = interestRepo.findByUser(user);
		System.out.println(interComList);
		
		return interComList;
		
	}
	
	
	@DeleteMapping("/interested-company/{interno}")
	public ResponseEntity<String> deleteInterCom(@PathVariable("interno")Long interno) {
		//관심기업 삭제
		interestRepo.deleteById(interno);
		
		return new ResponseEntity<>("삭제 성공!", HttpStatus.OK);
	}
	
	
	
}

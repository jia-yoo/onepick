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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.onepickApi.dto.QnaDto;
import com.example.onepickApi.entity.Company;
import com.example.onepickApi.entity.Qna;
import com.example.onepickApi.entity.User;
import com.example.onepickApi.repository.CompanyRepository;
import com.example.onepickApi.repository.QnaRepository;
import com.example.onepickApi.repository.UserRepository;
//import com.example.onepickApi.service.NotificationService;
import com.example.onepickApi.service.NotificationService;

import io.swagger.v3.oas.annotations.parameters.RequestBody;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1/")
public class QnaController {
	
	@Autowired
	private QnaRepository qnaRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private CompanyRepository companyRepository;
	@Autowired
	private NotificationService notificationService;

	// memberRepo
	
	@PostMapping("/qna")
	public ResponseEntity<Qna> qnaRegist(@RequestBody QnaDto qnaDto, @RequestParam("username") String username) {

		System.out.println("들어온 username : "+username);
		Qna qna = new Qna();
		qna.setTitle(qnaDto.getTitle());
		qna.setContent(qnaDto.getContent());
		qna.setCategory(qnaDto.getCategory());
		
		
		Optional<User> result1 = userRepository.findById(username);
		Optional<Company> result2 = companyRepository.findById(username);
		
		if(result1.isPresent()) {		
			qna.setUser(result1.get());
		}else if(result2.isPresent()) {
			qna.setCompany(result2.get());
		}
		
		
		Qna result = qnaRepository.save(qna);
		
		
		
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@GetMapping("/qna")
	public ResponseEntity<List<Qna>> qnaList() {
		List<Qna> list = qnaRepository.findAll();
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	
	@GetMapping("/qna/{bno}")
	public ResponseEntity<Optional<Qna>> qnaDetail(@PathVariable("bno") Long bno) {
		Optional<Qna> result = qnaRepository.findById(bno);
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@PutMapping("/qna")
	public ResponseEntity<Qna> qnaEdit(@RequestBody QnaDto qnaDto, @RequestParam("bno") Long bno, @RequestParam("username") String username) {
		//Qna qna = new Qna();
		//qna.setBno(bno);
		
		System.out.println("들어온 username : "+username);
		
		Optional<User> result1 = userRepository.findById(username);
		Optional<Company> result2 = companyRepository.findById(username);
		
		//if(result1.isPresent()) {		
		//	result1.get().setUser(username);
		//}else if(result2.isPresent()) {
		//	qna.setCompany(result2.get());
		//}
		
		Qna qna = qnaRepository.findById(bno).get();
		
		System.out.println("qna" + qna);
		qna.setTitle(qnaDto.getTitle());
		qna.setContent(qnaDto.getContent());
		qna.setCategory(qnaDto.getCategory());
		qna.setResponse(qnaDto.getResponse());
		Qna result = qnaRepository.save(qna);
		
		
		//답변 달아주면 해당 글 올린 사용자에게 푸쉬알람 보내주기
		if(result1.isPresent()) {		
			if(result1.get().getToken() != null){
				String token = result1.get().getToken();
				notificationService.sendNotification(token, " 💬 QnA 답변 등록 안내 ", result1.get().getName() +" 님이 문의하셨던 글에 관리자의 답변이 등록되었어요! 확인해보세요😉 ");
			}
		}else if(result2.isPresent()) {
			if(result2.get().getToken() != null){
				String token = result2.get().getToken();
				notificationService.sendNotification(token, " 💬 QnA 답변 등록 안내 ", result2.get().getName() +" 님이 문의하셨던 글에 관리자의 답변이 등록되었어요! 확인해보세요😉 ");
			}
		}
		return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	@DeleteMapping("/qna/{bno}")
	public ResponseEntity<String> qnaDelete(@PathVariable("bno") Long bno) {
		qnaRepository.deleteById(bno);
		return ResponseEntity.ok("삭제 :" + bno);
	}
	
	@GetMapping("/usermyqna")
	public ResponseEntity<List<Qna>> userMyQna(@RequestParam("username") String username) {
		System.out.println(username);
		Optional<User> result = userRepository.findById(username);
		if(result.isPresent()) {
			List<Qna> qna = qnaRepository.findAllByUserUsername(username);
			return new ResponseEntity<>(qna, HttpStatus.OK);
		}else {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
	
	@GetMapping("/companymyqna")
	public ResponseEntity<List<Qna>> companyMyQna(@RequestParam("username") String username) {
	    System.out.println(username);
	    Optional<Company> result = companyRepository.findById(username);
	    if(result.isPresent()) {
	        List<Qna> qnaList = qnaRepository.findAllByCompanyUsername(username);
	        return new ResponseEntity<>(qnaList, HttpStatus.OK);
	    } else {
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	    }
	}

	

}

package com.example.onepickApi.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.onepickApi.entity.ApplyList;
import com.example.onepickApi.entity.InterestedCop;
import com.example.onepickApi.entity.JobAd;
import com.example.onepickApi.entity.JobadScrap;
import com.example.onepickApi.entity.Skill;
import com.example.onepickApi.repository.ApplyListRepository;
import com.example.onepickApi.repository.CompanyRepository;
import com.example.onepickApi.repository.InterestedCopRepository;
import com.example.onepickApi.repository.JobAdRepository;
import com.example.onepickApi.repository.JobadScrapRepository;
import com.example.onepickApi.repository.SkillRepository;
//import com.example.onepickApi.service.NotificationService;

import jakarta.servlet.http.HttpServletRequest;

@CrossOrigin("*")
@RequestMapping("/api/v1/recruit")
@RestController
public class RecruitController_jia {

	
	@Autowired
	private JobAdRepository jobAdRepo;
	@Autowired
	private CompanyRepository companyRepo;
	@Autowired
	private InterestedCopRepository interestedCopRepo;
	@Autowired
	private SkillRepository skillRepo;
//	@Autowired
//	private NotificationService notificationService;
	@Autowired
	private ApplyListRepository applyListRepo;
	@Autowired
	private JobadScrapRepository jobadScrapRepo;
	private final Path rootLocation = Paths.get("/upload");
	
	
	@GetMapping("/{jno}")
	public ResponseEntity<Map<String,Object>> getComList(@PathVariable("jno") Long jno) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("jobad", jobAdRepo.findById(jno).get());
		map.put("skill", skillRepo.findAllByJno(jno));
		map.put("apply", applyListRepo.findByJno(jno));
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@GetMapping("/myrecruit")
	public ResponseEntity<List<JobAd>> myrecruit(HttpServletRequest request) {
		
		Enumeration<String> headers = request.getHeaderNames();
		while(headers.hasMoreElements()) {
			if(headers.nextElement().equals("username")) {
				System.out.println(request.getHeader("username"));
			}
		}
		List<JobAd> myJobAdList = jobAdRepo.findByUsername(request.getHeader("username"));
			return new ResponseEntity<>(myJobAdList, HttpStatus.OK);
	}
	@GetMapping("/company-recruit/{cid}")
	public ResponseEntity<List<JobAd>> companyRecruit(@PathVariable("cid") String cid) {
		System.out.println("xxxx");
		List<JobAd> myJobAdList = jobAdRepo.findByUsername(cid);
			return new ResponseEntity<>(myJobAdList, HttpStatus.OK);
	}
	
	@DeleteMapping("/{jno}")
	public ResponseEntity<String> deleteJobad(@PathVariable("jno") Long jno) {
		//이미 지원한 사람이 있을때 삭제 못하게 
		if(applyListRepo.findByJno(jno) != null) {
			return new ResponseEntity<>("cannot delete", HttpStatus.OK);
		}else {
			//해당공고에 등록된 skill 모두 지워주기
			 List<Skill> skillList = skillRepo.findAllByJno(jno);
			 for(Skill s : skillList) {
				 skillRepo.delete(s);
			 }
			 //공고 삭제
		    jobAdRepo.deleteById(jno);
			return new ResponseEntity<>("done", HttpStatus.OK);
		}
	}
	//confirm메세지 이후에 진짜로 삭제
	@DeleteMapping("/")
	public ResponseEntity<String> deleteJobad1(@RequestParam("jno") Long jno) {
		//스크랩한사람도 다 지우기
		if(jobadScrapRepo.findByJno(jno) != null) {
			for(JobadScrap js : jobadScrapRepo.findByJno(jno)) {
				jobadScrapRepo.delete(js);
			}
		}
//		if(applyListRepo.findByJno(jno) != null) {
//			List<ApplyList> list = applyListRepo.findByJno(jno);
//			//이미 지원한 사람이 있을때 그 사람들에게 알림 메시지 보내주기
//			//이미 지원한 사람이 있을때 지원자 전부삭제
//			for(ApplyList al : list) {
//				if(al.getUser().getToken() !=null) {
//					String token = al.getUser().getToken();
//					notificationService.sendNotification(token, " 💥채용공고 삭제💥", al.getUser().getName() +" 님이 구독하신 기업 "+ al.getJobAd().getCompany().getName()+" 의 공고가 더 이상 존재하지 않습니다. 확인해보세요😉");
//				}
//				applyListRepo.delete(al);
//			}
//		}
		
		//해당공고에 등록된 skill 모두 지워주기
		 List<Skill> skillList = skillRepo.findAllByJno(jno);
		 for(Skill s : skillList) {
			 skillRepo.delete(s);
		 }
		 //공고 삭제
	    jobAdRepo.deleteById(jno);
		return new ResponseEntity<>("done", HttpStatus.OK);
	}
	
	@PutMapping("/close-date")
	public ResponseEntity<String> editCloseDate(@RequestParam("jno") Long jno) {
		//공고 날짜 오늘로 바꿔주기
		JobAd ja = jobAdRepo.findById(jno).get();
		ja.setReceiptCloseDt(LocalDate.now());
		jobAdRepo.save(ja);
		return new ResponseEntity<>("done", HttpStatus.OK);
	}
	
	@GetMapping("/")
	public ResponseEntity<String> editJobad1(@RequestParam("jno") Long jno) {
		System.out.println("cheeeeee");
		//이미 지원한 사람이 있을때 수정 못하게 
		if(applyListRepo.findByJno(jno) != null) {
			return new ResponseEntity<>("cannot edit", HttpStatus.OK);
		}else {
			return new ResponseEntity<>("can edit", HttpStatus.OK);
		}
	}
	
	@PutMapping("/{jno}")
	public ResponseEntity<String> editJobad(@PathVariable("jno") Long jnoLong, HttpServletRequest request, @ModelAttribute JobAd jobAd, @RequestParam("attachFileUrl") MultipartFile file) {
		String jno = null;
			 try {
		            // 만약 업로드할 폴더 없으면 만들기
		            if (!Files.exists(rootLocation)) {
		                Files.createDirectories(rootLocation);
		            }

		            if (file != null && !file.isEmpty()) {
		                // 파일업로드
		                String originalFilename = file.getOriginalFilename();
		                String extension = originalFilename.substring(originalFilename.lastIndexOf('.'));
		                String filename = UUID.randomUUID().toString() + extension;
		                Path destinationFile = this.rootLocation.resolve(Paths.get(filename)).normalize().toAbsolutePath();

		                // 파일이 이미 존재하면 덮어쓰기 또는 다른 처리를 해야 할 수 있음
		                Files.copy(file.getInputStream(), destinationFile);

		                String filePath = destinationFile.toString();

		                // jobad 엔티티에 파일 정보 설정
		                jobAd.setFileName(filename);
		                jobAd.setFilePath(filePath);
		                jobAd.setFileSize(file.getSize());
		            }else {
		            	//파일 수정된거 없으면 원래 등록되어있던 파일 다시 넣어주기
		            	jobAd.setFileName(jobAdRepo.findById(jnoLong).get().getFileName());
		                jobAd.setFilePath(jobAdRepo.findById(jnoLong).get().getFilePath());
		                jobAd.setFileSize(jobAdRepo.findById(jnoLong).get().getFileSize());
		            }
		            jobAd.setCompany(companyRepo.findById(request.getHeader("username")).get());
		            System.out.println(jobAd);
		              
	                // jobad 엔티티 저장
	    			JobAd jobad = jobAdRepo.save(jobAd);
	    			jno = Long.toString(jobad.getJno());

		        } catch (IOException e) {
		            throw new RuntimeException("Could not create upload directory or save file!", e);
		        }
		
			return new ResponseEntity<>(jno, HttpStatus.OK);
		
		
	}
	
	
	@PostMapping("/")
	public ResponseEntity<String> regJobad( HttpServletRequest request, @ModelAttribute JobAd jobAd, @RequestParam("attachFileUrl") MultipartFile file) {
		String jno = null;
			 try {
		            // 만약 업로드할 폴더 없으면 만들기
		            if (!Files.exists(rootLocation)) {
		                Files.createDirectories(rootLocation);
		            }

		            if (file != null && !file.isEmpty()) {
		                // 파일업로드
		                String originalFilename = file.getOriginalFilename();
		                String extension = originalFilename.substring(originalFilename.lastIndexOf('.'));
		                String filename = UUID.randomUUID().toString() + extension;
		                Path destinationFile = this.rootLocation.resolve(Paths.get(filename)).normalize().toAbsolutePath();

		                // 파일이 이미 존재하면 덮어쓰기 또는 다른 처리를 해야 할 수 있음
		                Files.copy(file.getInputStream(), destinationFile);

		                String filePath = destinationFile.toString();

		                // jobad 엔티티에 파일 정보 설정
		                jobAd.setFileName(filename);
		                jobAd.setFilePath(filePath);
		                jobAd.setFileSize(file.getSize());
		                
		            }
		            jobAd.setCompany(companyRepo.findById(request.getHeader("username")).get());
		            System.out.println(jobAd);
		              
	                // jobad 엔티티 저장
	    			JobAd jobad = jobAdRepo.save(jobAd);
	    			jno = Long.toString(jobad.getJno());
	    			
	    			
//	    			//해당 기업을 구독한 유저들에게 새공고가 올라갔다고 알림보내주기><
//	    			List<InterestedCop> lists = interestedCopRepo.findAllByCid(request.getHeader("username"));
//	    			for(InterestedCop ic : lists) {
//	    				//해당 기업을 구독한 유저 중 알림 토큰이 있는 유저만 
//	    				if(ic.getUser().getToken() != null) {
//	    					String token = ic.getUser().getToken();
//	    					notificationService.sendNotification(token, " ✨ NEW 채용공고알림 ✨",ic.getUser().getName() +" 님이 구독하신 기업 "+ ic.getCompany().getName()+" 의 새로운 채용공고가 등록되었습니다. 확인해보세요😉");
//	    				}
//	    			}
		        } catch (IOException e) {
		            throw new RuntimeException("Could not create upload directory or save file!", e);
		        }
		
	
	return new ResponseEntity<>(jno, HttpStatus.OK);
	}
	
	@PostMapping("/skill/{jno}")
	public ResponseEntity<String> regSkill(@PathVariable("jno") Long jno, HttpServletRequest request, @RequestBody List<String> list) {
		System.out.println("개로오 이게");
		for(int i = 0; i<list.size(); i++) {
			Skill skill = new Skill();
			
		//skill 엔티티에 정보 저장
	       skill.setJobAd(jobAdRepo.findById(jno).get());
	       skill.setCompany(companyRepo.findById(request.getHeader("username")).get());
	       skill.setSkillName(list.get(i));
	       
	     //skill 엔티티에 정보 저장
			skillRepo.save(skill);
		}
			return new ResponseEntity<>("done", HttpStatus.OK);
	}
	
	@PutMapping("/skill/{jno}")
	public ResponseEntity<String> editSkill(@PathVariable("jno") Long jno, HttpServletRequest request, @RequestBody List<String> list) {
		//원래 등록되어있던 스킬 다 지워주기
		List<Skill> oldList = skillRepo.findAllByJno(jno);
		
		for(Skill s : oldList) {
			skillRepo.delete(s);
		}
		
		for(int i = 0; i<list.size(); i++) {
			Skill skill = new Skill();
			
		//skill 엔티티에 정보 저장
	       skill.setJobAd(jobAdRepo.findById(jno).get());
	       skill.setCompany(companyRepo.findById(request.getHeader("username")).get());
	       skill.setSkillName(list.get(i));
	       
	     //skill 엔티티에 정보 저장
			skillRepo.save(skill);
		}
			return new ResponseEntity<>("done", HttpStatus.OK);
	}
}

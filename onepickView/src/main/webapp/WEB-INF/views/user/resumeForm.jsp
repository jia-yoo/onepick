<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1PICK!</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/resumeForm.css" rel="stylesheet">
<script src="/js/resume.js"></script>
</head>
<body class="d-flex flex-column h-100 min-h-100">
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="sub_header border-bottom">
	<div class="container">
		<div class="d-flex py-2">
			<button class="btn" type="button" onclick="location.href='/user/myHome'">
			   MyHome
			</button>
			<div class="dropdown">
			  <button class="btn dropdown-toggl text-onepick" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			    이력서 관리
			  </button>
			  <ul class="dropdown-menu">
			    <li><button class="dropdown-item" type="button" onclick="location.href='/user/resumeList'">이력서 리스트</button></li>
			    <li><button class="dropdown-item" type="button" onclick="location.href='/user/resumeForm'">이력서 작성</button></li>
			  </ul>
			</div>
			<button class="btn" type="button" onclick="location.href='/user/scrapList'">
			   스크랩관리
			</button>
			<button class="btn" type="button" onclick="location.href='/user/interestList'">
			   구독관리
			</button>
			<button class="btn" type="button" onclick="location.href='/user/applyList'">
			   지원내역관리
			</button>
			<div class="dropdown">
			  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			    평점관리
			  </button>
			  <ul class="dropdown-menu">
			    <li><button class="dropdown-item" type="button" onclick="location.href='/user/reviewList'">평점 조회</button></li>
			    <li><button class="dropdown-item" type="button" onclick="location.href='/user/reviewForm'">평점 등록</button></li>
			  </ul>
			</div>
			<button class="btn" type="button" onclick="location.href='/user/myQnaList'">
			   QnA관리
			</button>
			<div class="dropdown">
			  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			    커뮤니티관리
			  </button>
			  <ul class="dropdown-menu">
			    <li><button class="dropdown-item" type="button" onclick="location.href='/user/myBoardList'">내가 쓴 글 리스트</button></li>
			    <li><button class="dropdown-item" type="button" onclick="location.href='/user/myCommentList'">내가 쓴 댓글 목록</button></li>
			  </ul>
			</div>
		</div>
	</div>
</div>
<div class="container" id="box">
<h3 class="page_title">이력서 작성</h3>
<hr>
<form name="frm">
	  	
  	<label class="checkbox-container">공개 여부
    <input type="checkbox" id="disclo_check" name="disclo" value="public">
    <span class="checkmark"></span>
	</label><br><br>
  	
	이력서 제목 *<input type="text" name="title" placeholder="이력서 제목을 입력해주세요" class="textbox"><br>
	자기소개서 제목 *<input type="text" name="selfInfoTitle" placeholder="자기소개서 제목을 입력해주세요" class="textbox"><br>
	자기소개서 내용 *<br>
	<textarea name="selfInfoContent" placeholder="자기소개서 내용을 입력해주세요" class="longtext" ></textarea>
	<span style="color:#aaa;" id="counter">글자 수 (0 / 500)</span><br>
	
	<div>
	<label for="select1">희망근무지역1 *</label>
	<select name="region1" id="select1" class="selectbox"> 
		<option value="">시 선택 *</option>
	</select>	
	<select name="region1_1" id="select2" class="selectbox">
		<option value="">구 선택 *</option>
	</select>
	</div>
	
	<br>
	
	<div>
	<label for="select3">희망근무지역2 *</label>
	<select name="region2" id="select3" class="selectbox">
		<option value="">시 선택 *</option>
	</select>	
	<select name="region2_1" id="select4" class="selectbox">
		<option value="">구 선택 *</option>
	</select>
	</div>
	
	<br>
	
	<div>
	<label for="select_sector">관심업종 *</label>
	<select name="sector" id="select_sector" class="selectbox">
		<option value="">관심업종 선택 *</option>
	</select>
	
	<label for="select_job">관심직무 *</label>
	<select name="job" id="select_job" class="selectbox">
		<option value="">관심직무 선택 *</option>
	</select>
	</div>
	
	<br>
	포트폴리오 URL<input type="text" name="portfolioUrl" placeholder="내용을 입력하세요" class="textbox"><br><br>
	
	<div class="d-flex">
		<span class="subtitle">사회활동</span><br>
		<i class="bi bi-plus-circle ms-auto" data-bs-toggle="modal" data-bs-target="#exampleModal" ></i>
	</div>
	<div class="experienceContainer"></div>
	<div class="d-flex">
		<span class="subtitle">자격증</span><br>
		<i class="bi bi-plus-circle ms-auto" data-bs-toggle="modal" data-bs-target="#exampleModal1" ></i>
	</div>
	<div class="licenseContainer"></div>
	<div class="d-flex">
		<span class="subtitle">학력사항 *</span><br>
		<i class="bi bi-plus-circle ms-auto" data-bs-toggle="modal" data-bs-target="#exampleModal2" ></i>
	</div>
	<div class="schoolContainer"></div>
	<div class="d-flex">
		<span class="subtitle">경력사항</span><br>
		<i class="bi bi-plus-circle ms-auto" data-bs-toggle="modal" data-bs-target="#exampleModal3" ></i>
	</div>
	<div class="careerContainer"></div>
	<div class="d-flex">
		<span class="subtitle">보유능력 *</span><br>
		<i class="bi bi-plus-circle ms-auto" data-bs-toggle="modal" data-bs-target="#exampleModal4" ></i>
	</div>
	<div class="oaContainer"></div>
	<input type="button" value="등록하기" onclick="return postData(event)" class="btn2">
</form>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">사회 활동</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        시작일 *<input type="date" name="startDay" class="datebox">
		종료일 *<input type="date" name="endDay" class="datebox"><br>
		참여기관 *<input type="text" name="ex_org" placeholder="내용을 입력하세요" class="textbox"><br>
		활동내역 *<input type="text" name="ex_content" placeholder="내용을 입력해주세요" class="textbox"><br><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="return getExperienceData(event)">저장</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">자격증</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	자격증명 *<input type="text" name="lname" placeholder="내용을 입력하세요" class="textbox"><br>
		발급기관 *<input type="text" name="org" placeholder="내용을 입력하세요" class="textbox"><br>
		취득일 *<input type="date" name="getDate" class="datebox"><br><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="return getLicenseData(event)">저장</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">학력사항</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       		입학일자*<input type="date" name="accDate" class="datebox">
			졸업일자<input type="date" name="gradDate" class="datebox"><br>
			학교명 *<input type="text" name="eduName" placeholder="내용을 입력하세요" class="textbox">
			전공학과 *<input type="text" name="major" placeholder="내용을 입력하세요" class="textbox"><br>
			학점 *<input type="text" name="score" placeholder="내용을 입력하세요" class="textbox">
			
			<label for="select_degree">상태 *</label>
			<select name="s_status" id="select_degree" class="selectbox">
				<option value="졸업">졸업</option>
				<option value="중퇴">중퇴</option>
				<option value="휴학">휴학</option>
				<option value="기타">기타</option>
			</select><br><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="return getSchoolData(event)">저장</button>
      </div>
    </div>
  </div>
</div>
 
  
  <!-- Modal -->
<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">경력사항</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       입사일자 *<input type="date" name="startDate" class="datebox">
		퇴사일자 *<input type="date" name="endDate" class="datebox"><br>
		회사명 *<input type="text" name="companyName" placeholder="내용을 입력하세요" class="textbox">
		직급 *<input type="text" name="rank" placeholder="내용을 입력하세요" class="textbox"><br>
		
		
		
		<label for="select_sector2">업종 *</label>
		<select name="c_type" id="select_sector2" class="selectbox">
			<option value="">업종 선택 *</option>
		</select>
		
		<label for="select_job2">직무 *</label>
		<select name="position" id="select_job2" class="selectbox">
			<option value="">업종을 먼저 선택해주세요 *</option>
		</select><br>
		
		<label for="select_career">상태 *</label>
		<select name="career_status" id="select_career" class="selectbox">
			<option value="재직">재직중</option>
			<option value="퇴사">퇴사</option>
			<option value="기타">기타</option>
		</select><br>
		
		업무 내용 *<input type="text" name="work" placeholder="내용을 입력하세요" class="textbox"><br><br>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="return getCareerData(event)">저장</button>
      </div>
    </div>
  </div>
</div>
  
  
  
 <!-- Modal -->
<div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">보유능력</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	<label for="select_skill">타입 *</label>
		<select name="skillName" id="select_skill" class="selectbox">
				 <option value="">스킬 선택</option>
					 <option value="재무제표관리">재무제표관리</option>
					 <option value="고객관계관리">고객관계관리</option>
					 <option value="기본데이터분석기술">기본데이터분석기술</option>
					 <option value="커뮤니케이션기술">커뮤니케이션기술</option>
					 <option value="리더십">리더십</option>
					 <option value="팀워크">팀워크</option>
					 <option value="문제해결">문제해결</option>
					 <option value="디자인">Photoshop</option>
					 <option value="커뮤니케이션기술">AdobeXD</option>
					 <option value="커뮤니케이션기술">Jira</option>
			         <option value="Figma">Figma</option>
			         <option value="HTML">HTML</option>
			         <option value="프리미어">프리미어</option>
			         <option value="illustrator">illustrator</option>
			         <option value="마케팅역량">마케팅역량</option>
			         <option value="홍보광고">홍보광고</option>
			         <option value="세일즈리더십">세일즈리더십</option>
			         <option value="번역">번역</option>
			         <option value="영상제작">영상제작</option>
			         <option value="모바일애플리케이션개발">모바일애플리케이션개발</option>
			         <option value="디자인">UX디자인</option>
			         <option value="인공지능">인공지능</option>
			         <option value="사람관리">사람관리</option>
			         <option value="분석적사고력">분석적사고력</option>
			         <option value="음향제작">음향제작</option>
			         <option value="회계">회계</option>
			         <option value="금융상품개발">금융상품개발</option>
			         <option value="금융영업">금융영업</option>
			         <option value="신용분석">신용분석</option>
			         <option value="총무">총무</option>
			         <option value="품질관리">품질관리</option>
			         <option value="무역유통관리">무역유통관리</option>
			         <option value="일반사무">일반사무</option>
			         <option value="경영기획">경영기획</option>
			         <option value="건강관리">건강관리</option>
			         <option value="배관공사">배관공사</option>
			         <option value="하드웨어">하드웨어</option>
			         <option value="외국어능통">외국어능통</option>
			         <option value="식음료">식음료</option>
			         <option value="자동차정비">자동차정비</option>
			         <option value="간호">간호</option>
			         <option value="의료">의료</option>
			         <option value="전기">전기</option>
			         <option value="python">python</option>
			         <option value="javascript">javascript</option>
			         <option value="Ruby">Ruby</option>
			         <option value="SQL">SQL</option>
			         <option value="R">R</option>
			         <option value="C">C</option>
			         <option value="ERP">ERP</option>
			         <option value="클라우드컴퓨팅">클라우드컴퓨팅</option>
			         <option value="React">React</option>
			         <option value="Angular">Angular</option>
			         <option value="Vue.js">Vue.js</option>
			         <option value="Django">Django</option>
			         <option value="네트워크 보안">네트워크 보안</option>
			         <option value="Swift(IOS)">Swift(IOS)</option>
			         <option value="Kotlin">Kotlin</option>
			         <option value="Flutter">Flutter</option>
			         <option value="Excel">Excel</option>
		</select><br>
		
		내용<input type="text" name="oa_content" placeholder="내용을 입력하세요" class="textbox">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="return getOaData(event)">저장</button>
      </div>
    </div>
  </div>
</div> 


</div>

<script>
const experienceContainer = document.querySelector(".experienceContainer")
const oaContainer = document.querySelector(".oaContainer")
const licenseContainer = document.querySelector(".licenseContainer")
const schoolContainer = document.querySelector(".schoolContainer")
const careerContainer = document.querySelector(".careerContainer")

let resumeArr = [];
let schoolArr=[];
let careerArr=[];
let licenseArr=[];
let experienceArr=[];
let oaArr=[];


let currentId = 0;

// ID 생성 함수
function generateId() {
    return currentId++;
}


function getResumeData() {
	    const disclo = document.querySelector("input[name=disclo]");
	    const title = document.querySelector("input[name=title]");
	    const selfInfoTitle = document.querySelector("input[name=selfInfoTitle]");
	    const selfInfoContent = document.querySelector("textarea[name=selfInfoContent]");
	    const region1 = document.querySelector("select[name=region1]");
	    const region1_1 = document.querySelector("select[name=region1_1]");
	    const region2 = document.querySelector("select[name=region2]");
	    const region2_1 = document.querySelector("select[name=region2_1]");
	    const sector = document.querySelector("select[name=sector]");
	    const job = document.querySelector("select[name=job]");
	    const portfolioUrl = document.querySelector("input[name=portfolioUrl]")
	
	    if(title.value == "" || selfInfoTitle.value == ""|| selfInfoContent.value == ""
				|| region1.value == "" || region1_1.value == "" || region2.value == "" 
					|| region2_1.value == "" || sector.value == "" || job.value == "" ){
			alert("이력서 및 자기소개서의 필수 입력사항이 비어있습니다. 다시 입력해주세요.")
			return false;
	    }
	    
	    let resumeObj = {
	    	"id": generateId(),
	        "disclo": disclo.value,
	        "title": title.value,
	        "selfInfoTitle": selfInfoTitle.value,
	        "selfInfoContent": selfInfoContent.value,
	        "region1": region1.value,
	        "region1_1": region1_1.value,
	        "region2": region2.value,
	        "region2_1": region2_1.value,
	        "sector": sector.value,
	        "job": job.value,
	        "portfolioUrl": portfolioUrl.value,
	    };
	
	    console.log(resumeObj);
	    resumeArr.push(resumeObj);
	}


	function getSchoolData(e){
		e.preventDefault();
		const parentElement = e.target.parentElement.parentElement.querySelector(".modal-body")
		console.log(e.target.parentElement.parentElement.querySelector(".modal-body"))
		const accDate = parentElement.querySelector("input[name=accDate]");
		const gradDate = parentElement.querySelector("input[name=gradDate]");
		const eduName = parentElement.querySelector("input[name=eduName]");
		const major = parentElement.querySelector("input[name=major]");
		const sStatus = parentElement.querySelector("select[name=s_status]");
		const score = parentElement.querySelector("input[name=score]");
		
		//빈값이면 제출안되게
		if(accDate.value == "" || eduName.value == ""|| major.value == ""
				|| sStatus.value == "" || score.value == ""){
			alert("필수 입력사항이 비어있습니다. 다시 입력해주세요.")
			return false;
		}
		
		let schoolObj = {
				"id": generateId(),
				"accDate" : accDate.value,
				"gradDate" : gradDate.value,
				"eduName" : eduName.value,
				"major" : major.value,
				"sStatus":sStatus.value,
				"score" : score.value,
		}
		console.log(schoolObj)
		schoolArr.push(schoolObj)
		
		
		//목록 넣어주기
		const listItem = document.createElement("ul");
		listItem.classList = "school-item"; 
		listItem.setAttribute("data-id", schoolObj.id);
		listItem.innerHTML = " <span style='position:absolute; top:10px; right:10px;' onclick='deleteEl(event)'>❌</span><li> 재학기간 : "+ accDate.value + "  ~  " + gradDate.value +"</li><li> 학교명 : "
		+eduName.value	+"</li><li> 전공학과 : " +  major.value+"</li>"
		+"<li> 학점 : " +  score.value+"</li>"
		+"<li> 상태 : " +  sStatus.value+"</li>"
		
		schoolContainer.appendChild(listItem);
		
		// input 필드를 초기화
	    accDate.value = "";
	    gradDate.value = "";
	    eduName.value = "";
	    major.value = "";
	    sStatus.value = "";
	    score.value = "";
	    
	    // 모달 닫기
	    $('#exampleModal2').modal('hide');
		
	}
	
	function getCareerData(e){
		e.preventDefault();
		const parentElement = e.target.parentElement.parentElement.querySelector(".modal-body")
		console.log(e.target.parentElement.parentElement.querySelector(".modal-body"))
		const cType = parentElement.querySelector("select[name=c_type]");
		const careerStatus = parentElement.querySelector("select[name=career_status]");
		const companyName = parentElement.querySelector("input[name=companyName]");
		const endDate = parentElement.querySelector("input[name=endDate]");
		const position = parentElement.querySelector("select[name=position]");
		const rank = parentElement.querySelector("input[name=rank]");
		const startDate = parentElement.querySelector("input[name=startDate]");
		const work = parentElement.querySelector("input[name=work]");
		
		//빈값이면 제출안되게
		if(cType.value == "" || careerStatus.value == "" || companyName.value == ""|| work.value == ""
				|| endDate.value == ""|| position.value == ""|| rank.value == ""|| startDate.value == ""){
			alert("필수 입력사항이 비어있습니다. 다시 입력해주세요.")
			return false;
		}
		
		let careerObj = {
				"id": generateId(),
				"cType" : cType.value,
				"careerStatus" : careerStatus.value,
				"companyName" : companyName.value,
				"endDate" : endDate.value,
				"position" : position.value,
				"rank" : rank.value,
				"startDate" : startDate.value,
				"work" : work.value,
		}
		console.log(careerObj)
		careerArr.push(careerObj)
		
		//목록 넣어주기
		const listItem = document.createElement("ul");
		listItem.classList = "career-item"; 
		listItem.setAttribute("data-id", careerObj.id);
		listItem.innerHTML = "<span style='position:absolute; top:10px; right:10px;' onclick='deleteEl(event)'>❌</span><li> <li> 근무기간 : "+ startDate.value + "  ~  " + endDate.value +"</li><li> 회사명 : "
		+companyName.value	+"</li><li> 직급 : " +  rank.value+"</li>"
		+"<li> 업종 : " +  cType.value+"</li>"
		+"<li> 직무 : " +  position.value+"</li>"
		+"<li> 상태 : " +  careerStatus.value+"</li>"
		+"<li> 업무내용 : " +  work.value+"</li>"
		
		careerContainer.appendChild(listItem);
		
		// input 필드를 초기화
	    cType.value = "";
	    careerStatus.value = "";
	    companyName.value = "";
	    endDate.value = "";
	    position.value = "";
	    rank.value = "";
	    startDate.value = "";
	    work.value = "";
		
	    // 모달 닫기
	    $('#exampleModal3').modal('hide');
	}
	
	function getLicenseData(e){
		e.preventDefault();
		const parentElement = e.target.parentElement.parentElement.querySelector(".modal-body")
		console.log(e.target.parentElement.parentElement.querySelector(".modal-body"))
		const getDate = parentElement.querySelector("input[name=getDate]");
		const lname = parentElement.querySelector("input[name=lname]");
		const org = parentElement.querySelector("input[name=org]");
	
		//빈값이면 제출안되게
		if(getDate.value == "" || lname.value == "" || org.value == ""){
			alert("필수 입력사항이 비어있습니다. 다시 입력해주세요.")
			return false;
		}
		
		let licenseObj = {
				"id": generateId(),
				"getDate" : getDate.value,
				"lname" : lname.value,
				"org" : org.value,
		}
		console.log(licenseObj)
		licenseArr.push(licenseObj)
		
		//목록 넣어주기
		const listItem = document.createElement("ul");
		listItem.classList = "license-item"; 
		listItem.setAttribute("data-id", licenseObj.id);
		listItem.innerHTML = "<span style='position:absolute; top:10px; right:10px;' onclick='deleteEl(event)'>❌</span><li> <li> 자격증명 : "+lname.value + "</li><li> 발급기관 : "+org.value	+"</li><li> 취득일 : " +  getDate.value+"</li>"
		licenseContainer.appendChild(listItem);
		
		// input 필드를 초기화
	    getDate.value = "";
	    lname.value = "";
	    org.value = "";
	    
	    // 모달 닫기
	    $('#exampleModal1').modal('hide');
		
	}
	function getExperienceData(e){
		e.preventDefault();
		
		const parentElement = e.target.parentElement.parentElement.querySelector(".modal-body")
		console.log(e.target.parentElement.parentElement.querySelector(".modal-body"))
		const endDay = parentElement.querySelector("input[name=endDay]");
		const exContent = parentElement.querySelector("input[name=ex_content]");
		const exOrg = parentElement.querySelector("input[name=ex_org]");
		const startDay = parentElement.querySelector("input[name=startDay]");
	
		//빈값이면 제출안되게
		if(endDay.value == "" || startDay.value == "" || exContent.value == ""|| exOrg.value == ""){
			alert("필수 입력사항이 비어있습니다. 다시 입력해주세요.")
			return false;
		}
		
		let experienceObj = {
				"id": generateId(),
				"endDay" : endDay.value,
				"startDay" : startDay.value,
				"exContent" : exContent.value,
				"exOrg" : exOrg.value,
		}
		console.log(experienceObj)
		experienceArr.push(experienceObj)
		
		//목록 넣어주기
		const listItem = document.createElement("ul");
		listItem.classList = "experience-item"; 
		listItem.setAttribute("data-id", experienceObj.id);
		listItem.innerHTML = "<span style='position:absolute; top:10px; right:10px;' onclick='deleteEl(event)'>❌</span><li> <li> 활동 기간 : "+startDay.value + ' ~ ' + endDay.value +"</li><li> 참여기관 : "+exOrg.value
		+"</li><li> 활동내역 : "+exContent.value +"</li>"
		experienceContainer.appendChild(listItem);
		
		// input 필드를 초기화
	    endDay.value = "";
	    startDay.value = "";
	    exContent.value = "";
	    exOrg.value = "";
		
	    // 모달 닫기
	    $('#exampleModal').modal('hide');
	}
	
	function getOaData(e){
		e.preventDefault();
	
		
		const parentElement = e.target.parentElement.parentElement.querySelector(".modal-body")
		console.log(e.target.parentElement.parentElement.querySelector(".modal-body"))
		const oaContent = parentElement.querySelector("input[name=oa_content]");
		const skillName = parentElement.querySelector("select[name=skillName]");
	    
		//빈값이면 제출안되게
		if(oaContent.value == "" || skillName.value == ""){
			alert("필수 입력사항이 비어있습니다. 다시 입력해주세요.")
			return false;
		}
		
		let oaObj = {
				"id": generateId(),
				"oaContent" : oaContent.value,
				"skillName" : skillName.value,
		}
		console.log(oaObj)
		oaArr.push(oaObj)
		
		
		
		//목록 넣어주기
		const listItem = document.createElement("ul");
		listItem.classList = "oa-item"; 
	    listItem.setAttribute("data-id", oaObj.id);
		listItem.innerHTML = "<span style='position:absolute; top:10px; right:10px;' onclick='deleteEl(event)'>❌</span><li> <li> 스킬 : "+skillName.value + "</li><li> 내용 : "+oaContent.value	+"</li>"
		oaContainer.appendChild(listItem);
		
		// input 필드를 초기화
	    oaContent.value = "";
	    skillName.value = "";
	    
	    // 모달 닫기
	    $('#exampleModal4').modal('hide');
	}
	

	function deleteEl(event) {
	    const listItem = event.target.closest("ul");
	    const id = parseInt(listItem.getAttribute("data-id"));

	    if (listItem.classList.contains('school-item')) {
	        schoolArr = schoolArr.filter(item => item.id !== id);
	    } else if (listItem.classList.contains('career-item')) {
	        careerArr = careerArr.filter(item => item.id !== id);
	    } else if (listItem.classList.contains('license-item')) {
	        licenseArr = licenseArr.filter(item => item.id !== id);
	    } else if (listItem.classList.contains('experience-item')) {
	        experienceArr = experienceArr.filter(item => item.id !== id);
	    } else if (listItem.classList.contains('oa-item')) {
	        oaArr = oaArr.filter(item => item.id !== id);
	    }

	    listItem.remove();
	}

	 
	
	function postData(e) {
		console.log(resumeArr)
		console.log(oaArr)
	    e.preventDefault();
	    getResumeData();
	    if(oaArr ==""){
	    	alert("보유능력은 필수입력사항 입니다. 다시 입력해주세요.")
	    	return false;
	    }else{
	    	 let data = {
	    		        "resume": resumeArr,
	    		        "school": schoolArr,
	    		        "experience": experienceArr,
	    		        "license": licenseArr,
	    		        "career": careerArr,
	    		        "oa": oaArr,
	    		    };
	    		    console.log(data)

	    	 	    // JSON으로 변환
	    	 	    const jsonData = JSON.stringify(data);

	    		    $.ajax({
	    		        type: "POST",
	    		        url: "http://localhost:9001/api/v1/resume",
	    		        data: jsonData,
	    		        contentType: "application/json", // JSON 데이터 전송을 위해 Content-Type을 설정
	    		        headers: {
	    		            'username': localStorage.getItem("username")  // HTTP 요청 헤더에 username 추가
	    		        }, 
	    		        success: function(response) {
	    		            // 서버 응답 성공 처리
	    		            console.log("서버 응답:", response);
	    		            window.location.href = "/user/resumeList";
	    		        },
	    		        error: function(jqXHR, textStatus, errorThrown) {
	    		            // 에러 발생 시 처리
	    		            console.log("에러 발생:", textStatus, errorThrown);
	    		        }
	    		    });
	    }
	}
	
	
	
	
	
	
	$('.longtext').keyup(function (e){
	    var content = $(this).val();
	    $('#counter').html("("+content.length+" / 500)");    //글자수 실시간 카운팅
	
	    if (content.length > 500){
	        alert("최대 500자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 500));
	        $('#counter').html("(500 / 500)");
	    }
	});
	
	
	
	
</script>

<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="/js/userInterceptor.js"></script>
<script src="/js/CloseBrowserClearlocalStorage.js"></script>
</html>
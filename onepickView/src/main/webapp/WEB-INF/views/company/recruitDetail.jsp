<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1PICK!</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/recruitDetail.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="/js/CloseBrowserClearlocalStorage.js"></script>
<style>
.modal-content {
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

/* 모달 헤더 */
.modal-header {
    background-color: #42d056;
    color: white;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
    padding: 15px;
}

.modal-title {
    font-size: 1.5em;
    font-weight: bold;
}

/* 닫기 버튼 */
.btn-close {
    background: none;
    border: none;
    font-size: 1.2em;
    color: white;
    opacity: 1;
}

.btn-close:hover {
    color: #007bff;
}

/* 모달 바디 */
.modal-body {
    padding: 20px;
    font-size: 1em;
    background-color: #f9f9f9;
}

/* 이력서 리스트 스타일 */
#resumeList ul.res {
    list-style-type: none;
    padding: 10px;
    margin: 0 0 10px;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 15px;
    transition: all 0.3s ease;
}

#resumeList ul.res:hover {
    background-color: #f1f1f1;
}

#resumeList ul.res li {
    margin-bottom: 5px;
}

/* 모달 푸터 */
.modal-footer {
    background-color: #f9f9f9;
    border-bottom-left-radius: 10px;
    border-bottom-right-radius: 10px;
    padding: 15px;
}

/* 지원하기 버튼 */
#applyBtn, .modal-footer .btn-primary {
    background-color: #42d056;
    border: none;
    transition: background-color 0.3s ease;
}

#applyBtn:hover, .modal-footer .btn-primary:hover {
    background-color: #26af3a;
}

/* 창닫기 버튼 */
.modal-footer .btn-secondary {
    background-color: #007bff;
    border: none;
    transition: background-color 0.3s ease;
}

.modal-footer .btn-secondary:hover {
    background-color: #c9302c;
}

.resumelink{
	text-decoration: underline;
}
</style>
</head>
<body class="d-flex flex-column h-100 min-h-100">
<jsp:include page="../layout/header.jsp"></jsp:include>

	<div class="container">
	<div class="dDay-container">
    공고 마감일까지 <span id="dDay"></span>
	</div>
	<div class="container_job">
		<div class="recruit_detail">
		   <div class='company-header'>
	            <div class='com_file'>
	                <img alt="기업 대표이미지">
	            </div>
	            <div class='company-info'>
	                <h1 class='com_name'></h1>
	                <div class='company-rating'>
	                    ⭐ <span id="companyScore"></span>
	                </div>
	                <div class='company-details'>
	                    <span class='com_sector'></span> · <span class='com_size'></span> <br>
	                    <span class='com_addr'></span> <br>
	                    <a href="" class='com_url' target="_blank"></a>
	                </div>
	            </div>
	        </div>
        <div class='title'></div>
        <div class='section'>
            <div class='section-title'>기업 상세정보</div>
            <div><span class='title_s'>대표명 </span><span class='com_ceo'></span></div>
            <div><span class='title_s'>연매출 </span><span class='com_yrSales'></span> <span class='title_s'>원 </span></div>
            <div><span class='title_s'>사원 수 </span><span class='com_employeesNum'></span> <span class='title_s'>명</span></div>
        </div>
	        <div class='section'>
	            <div class='section-title'>요약</div>
	            <div><span class='title_s'>📅 마감 </span><span class='receiptCloseDt'></span></div>
	            <div><span class='title_s'>📈 모집인원 </span><span class='collectPsncnt'></span></div>
	            <div><span class='title_s'>💼 직무 </span><span class='position'></span></div>
	            <div><span class='title_s'>📶 경력 </span><span class='experience'></span></div>
	            <div><span class='title_s'>✔️ 고용형태 </span><span class='empTpNm'></span></div>
	            <div><span class='title_s'>📍 근무지역 </span><span class='region'></span></div>
	            <div class='skillContainer'><span class='title_s'>🪪 스킬 </span></div>
	        </div>
	        <div class='section'>
	            <div class='section-title'>주요 업무</div>
	            <div class='jobCont'></div>
	            <div class='file'><img alt="공고이미지 첨부파일"></div>
	        </div>
	        <div class='section'>
	            <div class='section-title'>복지 및 혜택</div>
	            <div class='etcWelfare'></div>
	        </div>
	        <div class='section'>
	            <div class='section-title'>추가 정보</div>
	            <div><span class='title_s'>근무시간</span> <span class='wkdWkhCnt'></span></div>
	            <div><span class='title_s'>퇴직금</span> <span class='retirepay'></span></div>
	            <div><span class='title_s'>임금 조건</span> <span class='salTpNm'></span></div>
	            <div><span class='title_s'>병역특례채용희망</span> <span class='mltsvcExcHope'></span></div>
	        </div>
	        <div class='section'>
	            <div class='section-title'>담당자정보</div>
	            <div><span class='title_s'>담당자 이름</span> <span class='empName'></span></div>
	            <div><span class='title_s'>담당자 이메일</span> <span class='empEmail'></span></div>
	            <div><span class='title_s'>담당자 연락처</span> <span class='empTel'></span></div>
	        </div>
		</div>
			<div class="btnContainer">
		<div id="icon_wrap">
			<a id="btnTwitter" href="javascript:shareTwitter();">
				<img src="/icon/icon-twitter.png" class="link-icon twitter"></a>
			<a id="btnFacebook" href="javascript:shareFacebook();"> <img src="/icon/icon-facebook.png" class="link-icon facebook"></a>
			<a id="btnKakao" href="javascript:shareKakao();">
				<img src="/icon/icon-kakao.png" class="link-icon kakao"></a>
		</div>
		<div id="btn_wrap">
			<div id="copyBtn" onclick="copyToClipboard()">
				<img style="width:25px; height:25px;" src="/icon/copy.png" alt="copyBtn">
			</div>
			<div id="scrapBtn" onclick="scrapJobad()">
				<img style="width:25px; height:25px;" src="/icon/save.png">
			</div>
			<div id="likeBtn" onclick="likeTheCom()">
				<img style="width:25px; height:25px;" src="/icon/heart.png">
			</div>
		</div>
		
		<button id="applyBtn" class="btn btn-onepick apply-btn" onclick="openRegModal()">지원하기</button>
		</div>
		</div>
		
		
		
		<div class="interviewees_list">
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			    
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">이력서 선택</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body" >
			        <div id="resumeList"></div>
			      </div>
			      <div class="modal-footer">
			        <button class="btn btn-primary" data-bs-dismiss="modal" onclick="closeModal()">창닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
		</div>
	</div>
	
<jsp:include page="../layout/footer.jsp"></jsp:include>

<script>
const jno = "${jno}";
const applyBtn = document.querySelector("#applyBtn");
let cid = null;
let liked = null;
let scrapped = null;


document.addEventListener('DOMContentLoaded', async () => {
  try {
    // 채용 공고 데이터 가져오기
    const jobResponse = await fetch("http://localhost:9001/api/v1/recruit/"+jno , {
      method: 'GET',
      headers: {
        'jwtToken': localStorage.getItem('jwtToken'),
        'username': localStorage.getItem('username'),
        'role': localStorage.getItem('role'),
        'Content-Type': 'application/json'
      }
    });

    if (!jobResponse.ok) {
      throw new Error('채용 공고 데이터를 가져오는 데 실패했습니다.');
    }

    const data = await jobResponse.json();

    const jobad = data.jobad;
    const company = data.jobad.company;
    const apply = data.apply;
    cid = company.username;
    const skills = data.skill;
    
	let displayMlService = jobad.mltsvcExcHope == 'y' ? '🅾️' : '✖️';
	let displayEtcWelfare = jobad.etcWelfare ? jobad.etcWelfare : '해당사항 없음';
	let displayRetirepay = jobad.retirepay ? jobad.retirepay : '해당사항 없음';
	const employeesNum = Number(company.employeesNum).toLocaleString('en-US');
	const yrSales = Number(company.yrSales).toLocaleString('en-US');
	let displayYrSales = company.yrSales ? yrSales : '정보 없음';
	//기업 정보 띄워주기
    document.querySelector(".com_name").innerHTML = company.name;
    document.querySelector(".com_ceo").innerHTML = company.ceo;
    document.querySelector(".com_sector").innerHTML = company.sector;
    document.querySelector(".com_size").innerHTML = company.size;
    document.querySelector(".com_yrSales").innerHTML = displayYrSales;
    document.querySelector(".com_addr").innerHTML = company.addr;
    document.querySelector(".com_employeesNum").innerHTML = employeesNum;
    document.querySelector(".com_url").innerHTML = '기업 홈페이지';
    document.querySelector(".com_url").href = "https://" + company.url;
    //기업 기본 사진
    if(company.fileName != null){
    	document.querySelector(".com_file img").src = "/images/" + company.fileName;
    }else{
    	document.querySelector(".com_file img").src = "/img/no_img.jpg";
    }
   
    //공고 정보 넣어주기
	document.querySelector(".title").innerHTML = jobad.wantedTitle;
	document.querySelector(".receiptCloseDt").innerHTML = jobad.receiptCloseDt;
	document.querySelector(".collectPsncnt").innerHTML = jobad.collectPsncnt;
	document.querySelector(".position").innerHTML = jobad.position1 + "   ,  "+ jobad.position2;
	document.querySelector(".experience").innerHTML = jobad.experience;
	document.querySelector(".empTpNm").innerHTML = jobad.empTpNm;
	document.querySelector(".region").innerHTML = jobad.region1 + "   ,  " + jobad.region2;
	document.querySelector(".jobCont").innerHTML = jobad.jobCont;
	document.querySelector(".etcWelfare").innerHTML = displayEtcWelfare;
	document.querySelector(".wkdWkhCnt").innerHTML = jobad.wkdWkhCnt ;
	document.querySelector(".retirepay").innerHTML = displayRetirepay;
	document.querySelector(".salTpNm").innerHTML = jobad.salTpNm;
	document.querySelector(".mltsvcExcHope").innerHTML = displayMlService;
	document.querySelector(".empName").innerHTML = jobad.empName;
	document.querySelector(".empEmail").innerHTML = jobad.empEmail;
	document.querySelector(".empTel").innerHTML = jobad.empTel;
	//공고 이미지 
	 if(jobad.fileName != null){
			document.querySelector(".file img").src = "/images/" + jobad.fileName;
	    }else{
	    	document.querySelector(".file img").style.display = "none";
	    }
	//디데이 계산
	 const dday = calcDday(jobad.receiptCloseDt);
	if(dday <=0 ){
		dDay.innerHTML = "공고마감";
		applyBtn.innerText="공고마감";
		applyBtn.style.backgroundColor="red";
		
	}else{
		dDay.innerHTML = "D- " + dday + " 일";
	}
	

	//스킬 정보 넣어주기
		const skillContainer = document.querySelector(".skillContainer");
		 skills.forEach(skill=>{
			let skillItems = document.createElement("span");
			skillItems.classList = "skill_items"
			skillItems.style.margin="5px";
			skillItems.innerHTML= "📌 " + skill.skillName + "   ";
			skillContainer.appendChild(skillItems);
		  })
			  
	//평균평점불러오기
	  const ratingResponse = await fetch("http://localhost:9001/api/v1/company/avg-rating", {
      method: 'GET',
      headers: {
        'jwtToken': localStorage.getItem('jwtToken'),
        'username': localStorage.getItem('username'),
        'role': localStorage.getItem('role'),
        'Content-Type': 'application/json'
      }
    });

    // 요청이 성공했는지 확인
    if (!ratingResponse.ok) {
      throw new Error('평균 평점을 가져오는 데 실패했습니다.');
    }

    const avgRating = await ratingResponse.text();
    const displayRating = avgRating ? Number(avgRating).toFixed(1) : "0.0";
    document.querySelector("#companyScore").innerHTML = displayRating;
		  
		  
    //구독상태체크
    await checkLikeStatus();
    //공고찜상태체크
    await checkScrapStatus();
    //지원이력체크
    apply.forEach(function(a) {
        if (a.user.username === localStorage.getItem("username")) {
            // 지원 버튼 텍스트를 "지원완료"로 변경
            document.querySelector("#applyBtn").innerText = "지원완료";
            // 지원 버튼을 비활성화
            document.querySelector("#applyBtn").setAttribute("disabled", "true");
        }
    });

  } catch (error) {
    console.error('작업 중 오류가 발생했습니다:', error);
  }
});

//구독상태체크
async function checkLikeStatus() {
  try {
    const response = await fetch('http://localhost:9001/api/v1/interested-company?cid=' + cid, {
      method: 'GET',
      headers: {
        'jwtToken': localStorage.getItem('jwtToken'),
        'username': localStorage.getItem('username'),
        'role': localStorage.getItem('role'),
        'Content-Type': 'application/json'
      }
    });

    if (response.ok) {
      const result = await response.text();

      if (result === "existed") {
        document.querySelector("#likeBtn img").src = "/icon/heart_full.png";
        liked = true;
      } else if (result === "not existed") {
        document.querySelector("#likeBtn img").src = "/icon/heart.png";
        liked = false;
      } else {
        console.error('예상치 못한 응답:', result);
      }
    } else {
      console.error('네트워크 응답이 정상적이지 않습니다:', response.statusText);
    }
  } catch (error) {
    console.error('구독 상태 확인 중 오류가 발생했습니다:', error);
  }
}

//구독하기 버튼 클릭이벤트
function likeTheCom() {
	console.log("ccccc")
	if(localStorage.getItem("role") == "ROLE_USER"){
		if(liked == true){
			if (confirm("정말 해당 기업을 구독 리스트에서 삭제하시겠습니까?")) {
				//구독취소하기
				const xhttp = new XMLHttpRequest();
				xhttp.onload = function () {
					if (this.responseText == "done") {
						//비어있는 버튼으로 바꿔주기
						document.querySelector("#likeBtn img").src = "/icon/heart.png";
						 liked = false;
					} 
				}
				xhttp.open("delete", 'http://localhost:9001/api/v1/interested-company?cid='+cid, true);
				xhttp.setRequestHeader("username", localStorage.getItem("username"));
				xhttp.send();
			}
		}else if(liked == false){
			//구독하기
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function () {
				if (this.responseText == "done") {
					alert("성공적으로 해당기업을 구독 했습니다!")
					//버튼 색칠한거로 바꿔주기
					document.querySelector("#likeBtn img").src = "/icon/heart_full.png";
					 liked = true;
				} 
			}
			xhttp.open("POST", 'http://localhost:9001/api/v1/interested-company?cid='+cid, true);
			xhttp.setRequestHeader("username", localStorage.getItem("username"));
			xhttp.send();
		}
		
	}else{
		alert("공고 스크랩은 일반 사용자만 사용 가능한 기능입니다.")
	}
	
} 

//공고찜상태체크
async function checkScrapStatus() {
  try {
    const response = await fetch('http://localhost:9001/api/v1/scrapped-recruit?jno=' + jno, {
      method: 'GET',
      headers: {
        'jwtToken': localStorage.getItem('jwtToken'),
        'username': localStorage.getItem('username'),
        'role': localStorage.getItem('role'),
        'Content-Type': 'application/json'
      }
    });

    if (response.ok) {
      const result = await response.text();
      if (result === "existed") {
        document.querySelector("#scrapBtn img").src = "/icon/save_full.png";
        scrapped = true;
      } else if (result === "not existed") {
        document.querySelector("#scrapBtn img").src = "/icon/save.png";
        scrapped = false;
      } else {
        console.error('예상치 못한 응답:', result);
      }
    } else {
      console.error('네트워크 응답이 정상적이지 않습니다:', response.statusText);
    }
  } catch (error) {
    console.error('구독 상태 확인 중 오류가 발생했습니다:', error);
  }
}

//공고찜하기 버튼 클릭이벤트
function scrapJobad() {
	console.log("ccccc")
	if(localStorage.getItem("role") == "ROLE_USER"){
		if(scrapped == true){
			if (confirm("정말 해당 공고를 스크랩 리스트에서 삭제하시겠습니까?")) {
				//구독취소하기
				const xhttp = new XMLHttpRequest();
				xhttp.onload = function () {
					if (this.responseText == "done") {
						//비어있는 버튼으로 바꿔주기
						document.querySelector("#scrapBtn img").src = "/icon/save.png";
						 scrapped = false;
					} 
				}
				xhttp.open("delete", 'http://localhost:9001/api/v1/scrapped-recruit?jno='+jno, true);
				xhttp.setRequestHeader("username", localStorage.getItem("username"));
				xhttp.send();
			}
		}else if(scrapped == false){
			//구독하기
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function () {
				if (this.responseText == "done") {
					alert("성공적으로 해당공고를 스크랩 했습니다!")
					//버튼 색칠한거로 바꿔주기
					document.querySelector("#scrapBtn img").src = "/icon/save_full.png";
					 scrapped = true;
				} 
			}
			xhttp.open("POST", 'http://localhost:9001/api/v1/scrapped-recruit?jno='+jno, true);
			xhttp.setRequestHeader("username", localStorage.getItem("username"));
			xhttp.send();
		}
	}else{
		alert("공고 스크랩은 일반 사용자만 사용 가능한 기능입니다.")
	}
	
} 




//소셜미디어 공유버튼
function shareTwitter() {
	const sendText = [[${ jobad.wantedTitle }]]; // 전달할 텍스트
	const sendUrl = window.location.href; // 전달할 URL
	window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}
function shareFacebook() {
	var sendUrl = window.location.href; // 전달할 URL
	window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}
function shareKakao() {
	// 사용할 앱의 JavaScript 키 설정
	Kakao.init('a65924b5ad21649d69b934fcd8c1eeea');
	// 카카오링크 버튼 생성
	Kakao.Link.createDefaultButton({
		container: '#btnKakao', // 카카오공유버튼ID
		objectType: 'feed',
		content: {
			title: "원픽 채용공고", // 보여질 제목
			description: "onepick", // 보여질 설명
			imageUrl: window.location.href, // 콘텐츠 URL
			link: {
				mobileWebUrl: window.location.href,
				webUrl: window.location.href
			}
		}
	});
}

//주소복사버튼
function copyToClipboard() {
	var t = document.createElement("textarea");
	document.body.appendChild(t);
	t.value = window.location.href;
	t.select();
	document.execCommand('copy');
	document.body.removeChild(t);
};
document.querySelector("#copyBtn").addEventListener("click", function () {
	copyToClipboard(window.location.href);
	alert('주소를 복사하였습니다');
})
//디데이 계산 
function calcDday(targetDate) {
	// 주어진 날짜와 현재 날짜 간의 차이 계산
	const oneDay = 24 * 60 * 60 * 1000; // 하루를 밀리초 단위로 표현
	const today = new Date(); // 현재 날짜
	const target = new Date(targetDate); // 주어진 날짜

	// 주어진 날짜와 현재 날짜 간의 차이를 일 단위로 계산
	const diffDays = Math.round((target - today) / oneDay);

	return diffDays;
}

 
 
/* function apply(){
	 if (confirm("해당 채용공고에 지원하시겠습니까?")) {
		 $.ajax({
			    url: 'http://localhost:9001/api/v1/apply?rno=' + 1 + '&jno=' + jno,
			    type: 'POST',
			    headers: {
			    	'username': username
			    }, 
			    success: function(data) {
			    	alert(data);
			    },
			    error: function(xhr, status, error) {
	                if (xhr.status === 409) {
	                    alert(xhr.responseText);
	                } else {
	                    alert('지원 중 오류가 발생했습니다.');
	                }
	                console.error('AJAX 요청 실패:', status, error);
	            }
			});

	 }
 }  */
 
 function clickHandle(e){
	 const selectedRno = e.target.parentElement.querySelector("span").innerText
	 window.open("http://localhost:8093/user/resumeDetailForApply?jno=" + jno + "&rno=" + selectedRno, "팝업 창", "width=1200,height=1000");
     $('#exampleModal').modal('hide');
 }
 
 function openRegModal() {
     $('#exampleModal').modal('show');

     $('#exampleModal').on('shown.bs.modal', function() {
         document.querySelector("#exampleModalLabel").innerText = "지원할 이력서 리스트 선택";
       
         $.ajax({
             url: 'http://localhost:9001/api/v1/resume',
             type: 'GET',
             headers: {
                 'username': username
             }, 
             success: function(data) {
                 var resumeList = $('#resumeList');
                 resumeList.empty(); // 기존 내용을 비웁니다
              
                 $.each(data, function(index, resume) {
                     var ul = $('<ul class="res p-4 mb-3"></ul>'); // ul 태그 생성
                     
                     if(resume.def === "Y"){
                    	 ul.append('<li style="color : #007bff;">대표 이력서📄</li>');
                     }
                     
                     ul.append('<li>' + (index + 1) + '번째 이력서</li>');
                     
                     
                     

                     ul.append('<li class="resumelink"><span style="display:none;">'+resume.rno+'</span><a href="#" onclick="clickHandle(event)">' + resume.title + '</a></li>');


                     if (resume.moddate == null) {
                         var regdate = new Date(resume.regdate).toISOString().split('T')[0];
                         ul.append('<li>최종수정날짜 : ' + regdate + '</li>');
                     } else {
                         var moddate = new Date(resume.moddate).toISOString().split('T')[0];
                         ul.append('<li>최종수정날짜 : ' + moddate + '</li>');
                     }
                     resumeList.append(ul); // ul 태그를 resumeList에 추가
                 });
                 
                 
             },
             error: function(xhr, status, error) {
                 console.error('AJAX 요청 실패:', status, error);
             }
         });

         
         function closeModal(){
             $('#exampleModal').modal('hide');
         }
     });
 }
 
 

 
 
 
 
 
 
 

</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>
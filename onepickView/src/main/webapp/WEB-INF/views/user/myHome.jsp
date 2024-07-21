<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>1PICK!</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<link href="/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="/js/notification.js" type="module"></script>
<link href="/css/company_myHome.css" rel="stylesheet">

</head>
<body class="d-flex flex-column h-100 min-h-100">
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="sub_header border-bottom">
	<div class="container">
		<div class="d-flex py-2">
			<button class="btn text-onepick" type="button" onclick="location.href='/user/myHome'">
			   MyHome
			</button>
			<div class="dropdown">
			  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
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

<div class="container">
	<div class='page_title'>🏠 My Home</div>
	<div class="d-flex">
		<img class="ms-auto"  data-bs-toggle="modal" data-bs-target="#exampleModal1" style="padding:5px; background-color:#42d056 ; border: 2px solid #42d056; width:40px; border-radius:10px;" src="/icon/notification-setting.png">
	</div>	
	<div class="company_myInfo bg-light">
		<div class="profileImg_box position-relative">
			<img src="" alt="사진">
			<button class="btn btn-sm btn-onepick position-absolute" data-bs-toggle="modal" data-bs-target="#exampleModal" style="bottom:0; right:0"><i class="bi bi-pencil-fill"></i></button>
		</div>
		<div>
		<div class="fw-blod fs-4"><span id="userName">이름</span> <a class="fs-6 link-primary d-inline link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" href="/user/userEdit">내정보수정<i class="bi bi-arrow-right"></i></a></div>
			<div>
			<span id="userGender">성별</span>
			<span class="text-secondary mx-2"> | </span>
			<span id="userAddr">주소</span></div>
			</div>
		</div>
	
		<div class='title mb-3 clearfix'>
			<span>내 이력서 리스트</span>
			<a class="float-end fs-6 link-primary d-inline link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover cursor" href="/user/resumeList">더보기</a>
		</div>
		<div>
			<div id="resumeList"></div>
		</div>
		
		<div class="row mb-5">
			<div class="col-3"><a class="btn btn-lg w-100 btn-outline-onepick-sub" href='/user/scrapList'>스크랩한 공고</a></div>
			<div class="col-3"><a class="btn btn-lg w-100 btn-outline-onepick-sub" href='/user/interestList'>관심 기업</a></div>
			<div class="col-3"><a class="btn btn-lg w-100 btn-outline-onepick-sub" href='/user/applyList'>지원 내역</a></div>
			<div class="col-3"><a class="btn btn-lg w-100 btn-outline-onepick-sub" href='/user/myQnaList'>QnA관리</a></div>
		</div>
		
	</div>
	
	
	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">사진 변경</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input type="file" name="file">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="updateFile(event)">변경</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">🔔 푸쉬 알림 받기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        웹 푸쉬 알림을 통해 필요한 소식을 모두 받아보실 수 있습니다.
        * 다른 사용자에게 불필요한 알림이 전송될 수 있으므로, 공용 컴퓨터나 브라우저에서 알림을 허용하지 마시고, 반드시 개인용 브라우저나 컴퓨터에서만 알림을 허용하세요.*
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">다음에</button>
        <button type="button" class="btn btn-primary" onclick="setNotification()">알림 받기</button>
      </div>
    </div>
  </div>
</div>


<script>
$(document).ready(function() {
	$.ajax({
        url: 'http://localhost:9001/api/v1/userInfo',
        type: 'GET',
        dataType: 'json',
        headers: {
            'username': username  // HTTP 요청 헤더에 username 추가
            
        }, 
        success: function(data) {
        	console.log(data);
        	
        	var userInfo = $('#userInfo');
        	    	
        	var user = data;
        	

            //var editLink = $('<a href="/user/userEdit" class="myHomelink">내정보 수정</a>');
            document.querySelector("#userName").innerHTML = user.name;
            document.querySelector("#userGender").innerHTML = user.gender;
            document.querySelector("#userAddr").innerHTML = user.addr;
            if(user.fileName == null){
    			document.querySelector(".profileImg_box img").src="/img/no_img.jpg";
    		}else{
    			document.querySelector(".profileImg_box img").src="/images/" + user.fileName;
    		}
            
            var userDetailsContainer = $('<div class="user-details-container"></div>');

           
        },
        error: function(xhr, status, error) {
            console.error('AJAX 요청 실패:', status, error);
        }
    });
	
	
	
    // AJAX 요청 보내기
	$.ajax({
        url: 'http://localhost:9001/api/v1/resume',
        type: 'GET',
        dataType: 'json',
        headers: {
            'username': username  // HTTP 요청 헤더에 username 추가
        }, 
        success: function(data) {
        	console.log(data);
        	

            var resumeList = $('#resumeList');
            resumeList.empty(); // 기존 내용을 비웁니다.
            
            if (data.length === 0) {
                resumeList.append('<p>이력서가 없습니다</p>');
            } else {

	            var count = 0;
	            $.each(data, function(index, resume) {
	                if (count >= 3) {
	                    return false; // 반복을 중지
	                }
	                count++;
	
	                var ul = $('<ul class="res p-4 bg-light ms-0 me-0 mt-0 mb-3 position-relative"></ul>'); // ul 태그 생성
	                var div = $('<div class="def_div"></div>');
	
	                if (resume.def == "Y") {
	                    div.append('<span class="def">대표 이력서✍</span>');
	                }
	
	                ul.append(div);
	                ul.append('<li><a class="fs-4 fw-bold" href="/user/resumeDetail?rno=' + resume.rno + '">' + resume.title + '</a></li>');
	
	                if (resume.moddate == null) {
	                    var regdate = new Date(resume.regdate).toISOString().split('T')[0];
	                    ul.append('<li>최종수정날짜 : ' + regdate + '</li>');
	                } else {
	                    var moddate = new Date(resume.moddate).toISOString().split('T')[0];
	                    ul.append('<li>최종수정날짜 : ' + moddate + '</li>');
	                }
	
	                resumeList.append(ul);
	            });
            }
           
        },
        error: function(xhr, status, error) {
            console.error('AJAX 요청 실패:', status, error);
        }
    });

});

     
     
function updateFile(event){
	event.preventDefault();
	const fileInput = document.querySelector("input[name='file']");
	const file = fileInput.files[0];
	
	if (file) {
		const formData = new FormData();
		formData.append('file', file);

		const xhttp = new XMLHttpRequest();
		xhttp.onload = function() {
			console.log(this.responseText);
			if (this.status === 200) {
				// 성공적으로 업로드 후 필요한 작업 수행
				console.log("File upload successful");
				location.reload(); // 페이지를 새로고침하여 변경된 내용을 반영
			} else {
				console.error("File upload failed");
			}
		};
		xhttp.open("PUT", "http://localhost:9001/api/v1/user/file", true);
		xhttp.setRequestHeader("jwtToken", localStorage.getItem("jwtToken"));
		xhttp.setRequestHeader("username", localStorage.getItem("username"));
		xhttp.setRequestHeader("role", localStorage.getItem("role"));
		xhttp.setRequestHeader("Access-Control-Expose-Headers", "jwtToken, username, role");
		xhttp.send(formData);
	} else {
		console.error("No file selected");
	}
}


</script>


<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="/js/userInterceptor.js"></script>
<script src="/js/CloseBrowserClearlocalStorage.js"></script>
</html>
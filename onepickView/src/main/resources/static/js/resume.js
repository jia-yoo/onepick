$(document).ready(function() {
    // 페이지 로드 후 실행되는 부분
    updateCheckboxValue(); // 초기 값 설정

    $('#disclo_check').change(function() {
        updateCheckboxValue();
    });

    function updateCheckboxValue() {
        if ($('#disclo_check').is(':checked')) {
            $('#disclo_check').val('public');
        } else {
            $('#disclo_check').val('private');
        }
        //console.log($('#disclo_check').val()); // 값 콘솔에 출력 (테스트용)
    }
});

//희망근무지역
const xhttp1 = new XMLHttpRequest();
xhttp1.onload = function() {
	const select1 = document.getElementById("select1");
    const select2 = document.getElementById("select2");
    const select3 = document.getElementById("select3");
    const select4 = document.getElementById("select4");
    
    let data = JSON.parse(this.responseText);

    // Populate select1 and select3 with keys from the data
    data.forEach((item, idx) => {
        const key = Object.keys(item)[0];
        /* console.log(idx + "번째 데이터 : " + key); */

        // Create separate option objects for select1 and select3
        const option1 = document.createElement("option");
        option1.value = key;
        option1.text = key;
        select1.appendChild(option1);

        const option2 = document.createElement("option");
        option2.value = key;
        option2.text = key;
        select3.appendChild(option2);
    });

    // Function to update select2 based on select1's selected value
    function updateSelect1() {
        const selectedKey = select1.value;

        // Clear previous options
        select2.innerHTML = '<option value="">구를 선택하세요!</option>';

        if (selectedKey) {
            const selectedItem = data.find(item => Object.keys(item)[0] === selectedKey);
            if (selectedItem) {
                const values = selectedItem[selectedKey];
                
                values.forEach(value => {
                    const option = document.createElement("option");
                    option.value = value;
                    option.text = value;
                    select2.appendChild(option);
                });
            }
        }
    }

    // Function to update select4 based on select3's selected value
    function updateSelect2() {
        const selectedKey = select3.value;

        // Clear previous options
        select4.innerHTML = '<option value="">구를 선택하세요!</option>';

        if (selectedKey) {
            const selectedItem = data.find(item => Object.keys(item)[0] === selectedKey);
            if (selectedItem) {
                const values = selectedItem[selectedKey];
                
                values.forEach(value => {
                    const option = document.createElement("option");
                    option.value = value;
                    option.text = value;
                    select4.appendChild(option);
                });
            }
        }
    }
    
    select1.addEventListener('change', updateSelect1);
    select3.addEventListener('change', updateSelect2);
  }
xhttp1.open("GET", "/json/korea-administrative-district.json", true);
xhttp1.send();



//관심업종
 const xhttp2 = new XMLHttpRequest();
xhttp2.onload = function() {
    const selectSector = document.getElementById("select_sector");
    
    const data = JSON.parse(this.responseText);

    data.forEach(item => {
        const sectorName = item["상위직무"];
        const option = document.createElement("option");
        option.value = item["상위직무"];
        option.text = sectorName;
        selectSector.appendChild(option);
    });
}
xhttp2.open("GET", "/json/job_category.json", true);
xhttp2.send();



//관심직무
const xhttp3 = new XMLHttpRequest();
xhttp3.onload = function() {
    const selectSector = document.getElementById("select_sector");
    const selectJob = document.getElementById("select_job");
    
    const data = JSON.parse(this.responseText);

    // 관심업종 선택 변경 시 관심직무 업데이트
    selectSector.addEventListener('change', function() {
        const selectedSectorCode = selectSector.value;

        // 관심직무 옵션 초기화
        selectJob.innerHTML = '<option value="">관심직무 선택</option>';

        data.forEach(item => {
            if (item["직무명"] == selectedSectorCode) {
                const option = document.createElement("option");
                option.text = item["직무 키워드명"];
                option.value = item["직무 키워드명"];
                selectJob.appendChild(option);
            }
        });
    });
}
xhttp3.open("GET", "/json/job.json", true);
xhttp3.send();




//업종
 const xhttp4 = new XMLHttpRequest();
xhttp4.onload = function() {
    const selectSector = document.getElementById("select_sector2");
    
    const data = JSON.parse(this.responseText);

    data.forEach(item => {
        const sectorName = item["상위직무"];
        const option = document.createElement("option");
        option.value = item["상위직무"];
        option.text = sectorName;
        selectSector.appendChild(option);
    });
}
xhttp4.open("GET", "/json/job_category.json", true);
xhttp4.send();



//직무
const xhttp5 = new XMLHttpRequest();
xhttp5.onload = function() {
    const selectSector = document.getElementById("select_sector2");
    const selectJob = document.getElementById("select_job2");
    
    const data = JSON.parse(this.responseText);

    // 관심업종 선택 변경 시 관심직무 업데이트
    selectSector.addEventListener('change', function() {
        const selectedSectorCode = selectSector.value;

        // 관심직무 옵션 초기화
        selectJob.innerHTML = '<option value="">관심직무 선택</option>';

        data.forEach(item => {
            if (item["직무명"] == selectedSectorCode) {
                const option = document.createElement("option");
                option.text = item["직무 키워드명"];
                option.value = item["직무 키워드명"];
                selectJob.appendChild(option);
            }
        });
    });
}
xhttp5.open("GET", "/json/job.json", true);
xhttp5.send();








// 현재 날짜와 시간을 가져옵니다.
var date = new Date();
var month = date.getMonth();
var year = date.getFullYear();
var today = date.getDate();

// 월과 요일 이름을 배열로 저장합니다.
var monthNames = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"];
var dayNames = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]; // 월요일부터 시작하도록 수정

// HTML에서 캘린더와 월 표시를 위한 요소를 가져옵니다.
var calendar = document.getElementById('calendar');
var monthDiv = document.getElementById('month-display');

// 이전 월, 다음 월 버튼 요소를 가져옵니다.
var prevMonthButton = document.querySelector('.prev-month');
var nextMonthButton = document.querySelector('.next-month');

// 서버에서 '선택불가'가 저장된 날짜를 가져오는 함수를 정의합니다.
function fetchBlockedDates(callback) {
  $.ajax({
  url: '/reservation/api/getAdminCalenderEvents',
  method: 'GET',
  success: function(response) {
    console.log(response); // 응답을 콘솔에 출력
    var $xml = $(response);

    // date 태그를 찾고, 각 태그의 텍스트를 타임스탬프에서 YYYY-MM-DD 형식으로 변환합니다.
    var blockedDates = $xml.find('date').map(function() {
      var timestamp = parseInt($(this).text());
      var date = new Date(timestamp);
      return `${date.getFullYear()}-${date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1}-${date.getDate() < 10 ? '0' + date.getDate() : date.getDate()}`;
    }).get();

      // 변환된 배열을 콜백으로 전달
      console.log("Blocked dates:", blockedDates);
      callback(blockedDates);
    },
    error: function(error) {
      console.error(error);
    }
  });
}

// 달력을 업데이트하는 함수를 정의합니다.
function updateCalendar(month, year) {
    // 해당 월의 첫째 날과 마지막 날을 구합니다.
    fetchBlockedDates(function(blockedDates) {
    var firstDay = new Date(year, month, 1);
    var lastDay = new Date(year, month + 1, 0);

    // 월 표시를 업데이트합니다.
    monthDiv.innerHTML = monthNames[month] + " " + year;
    
    // 달력을 초기화합니다.
    calendar.innerHTML = '';

    // 주(일~토)을 달력에 추가합니다.
for (let i = 0; i < 7; i++) {
    calendar.innerHTML += '<div>' + dayNames[i] + '</div>';
}

    // 첫째 날 이전은 빈 칸으로 처리합니다.
for (let i = 0; i < (firstDay.getDay() + 7) % 7; i++) { // 월요일부터 시작하도록 수정
    calendar.innerHTML += '<div></div>';
}

    // 달력에 일(Day)들을 추가합니다.
        for (let i = 1; i <= lastDay.getDate(); i++) {
            let dayDiv = document.createElement('div');
            let dateSpan = document.createElement('span');
            dateSpan.innerText = i;

            let blockSpan = document.createElement('span');
            let dateString = `${year}-${month + 1 < 10 ? '0' + (month + 1) : month + 1}-${i < 10 ? '0' + i : i}`;
            console.log("Date string:", dateString);

            // 해당 날짜가 블록된 날짜인지 확인합니다.
            if (blockedDates.includes(dateString)) {
                blockSpan.innerHTML = '(예약불가)';
                dayDiv.classList.add('blocked');
            }

            dayDiv.appendChild(dateSpan);
            dayDiv.appendChild(blockSpan);
            
            dayDiv.addEventListener('mouseover', function() {
                dayDiv.style.backgroundColor = "#999";
                dayDiv.style.borderRadius = "50%";
            });

            dayDiv.addEventListener('mouseout', function() {
                dayDiv.style.backgroundColor = "";
                dayDiv.style.borderRadius = "50%";
            });

            dayDiv.addEventListener('click', function() {
                showDayDetails(i, month, year);
            });

            // 달력에 일(Day)을 추가합니다.
            calendar.appendChild(dayDiv);
        }
    });
}
function showDayDetails(day, month, year) {
    let formattedDay = day < 10 ? '0' + day : day;
    let formattedMonth = (month + 1) < 10 ? '0' + (month + 1) : (month + 1).toString(); // 수정
    let dateString = `${year}-${formattedMonth}-${formattedDay}`;

    // Swal 팝업에서 날짜, 시간, 내용, 사용자 ID, 제품 유형을 입력받습니다.
    Swal.fire({
        title: 'Enter details',
        html: `
            <input type="date" id="swal-input1" class="swal2-input" value="${dateString}">
            <input type="time" id="swal-input2" class="swal2-input">
            <input type="text" id="swal-input3" class="swal2-input" placeholder="Enter content">
            <h3>-Identification-</h3>
            <input type="text" id="swal-input4" class="swal2-input" value="${ses}">
            <select id="swal-input5" class="swal2-input">
                <option value="">--Select Product Type--</option>
                <option value="정수기">정수기</option>
                <option value="에어컨">에어컨</option>
                <option value="공기청정기">공기청정기</option>
                <option value="매트리스">매트리스</option>
                <option value="식기세척기">식기세척기</option>
                <option value="무선청소기">무선청소기</option>
                <option value="밥솥">밥솥</option>
                <option value="로봇청소기">로봇청소기</option>
            </select>
        `,
        focusConfirm: false,
        preConfirm: () => {
            return [
                document.getElementById('swal-input1').value,
                document.getElementById('swal-input2').value,
                document.getElementById('swal-input3').value,
                document.getElementById('swal-input4').value,
                document.getElementById('swal-input5').value
            ]
        }
    }).then((result) => {
        if (result.value) {
            // Ajax 요청으로 서버에 데이터를 보냅니다.
            $.ajax({
    type: 'POST',
    url: '/reservation/calender',
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify({
        event_num: 0,
        date: result.value[0],
        time: result.value[1],
        request_term: result.value[2],
        cid: result.value[3],
        status: "pending",
        admin_confirmation: 0,
        type_a: result.value[4],
        pno: 0
    }),
    beforeSend: function() {
        console.log("Sending data to the server: ");
        console.log({
            event_num: 0,
            date: result.value[0],
            time: result.value[1],
            request_term: result.value[2],
            cid: result.value[3],
            status: "pending",
            admin_confirmation: 0,
            type_a: result.value[4],
            pno: 0 
        });
    },
                success: function(response) {
    console.log("Response from the server: ", response);
    if (response === 'Event created successfully') {
        Swal.fire('Success!', 'Your reservation has been saved.', 'success');
    } else {
        Swal.fire('Error!', 'Something went wrong.', 'error');
    }
},
    error: function(jqXHR, textStatus, errorThrown) {
        console.log("AJAX error: " + textStatus + ' : ' + errorThrown);
    }
});
        }
    });
}

// 이전 월 버튼을 클릭하면 달력을 업데이트합니다.
prevMonthButton.addEventListener('click', function() {
    if (month === 0) {
        month = 11;
        year -= 1;
    } else {
        month -= 1;
    }
    updateCalendar(month, year);
});

// 다음 월 버튼을 클릭하면 달력을 업데이트합니다.
nextMonthButton.addEventListener('click', function() {
    if (month === 11) {
        month = 0;
        year += 1;
    } else {
        month += 1;
    }
    updateCalendar(month, year);
});

// 첫 달력을 표시합니다.
updateCalendar(month, year);

function makeReservation() {
            Swal.fire({
                title: '예약완료되었습니다.',
                text: '',
                icon: 'success',
                confirmButtonText: 'Confirm.'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = '/home';
                }
            })
        }
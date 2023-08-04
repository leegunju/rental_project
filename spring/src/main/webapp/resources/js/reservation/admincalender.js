$(function () {
  var calendarEl = $('#calendar1')[0];

  var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,listWeek,listYear'
    },
    locale: 'en',
    editable: true,
    selectable: true,

    events: function (fetchInfo, successCallback, failureCallback) {
      $.ajax({
        url: '/reservation/api/events',
        method: 'GET',
        dataType: 'text',
        success: function (xmlStr) {
          var parser = new DOMParser();
          var xmlData = parser.parseFromString(xmlStr, 'text/xml');

          var x2js = new X2JS();
          var items = xmlData.getElementsByTagName('item');

          try {
            var events = [];
            for (var i = 0; i < items.length; i++) {
              var jsonData = x2js.xml2js(items[i].outerHTML);
              let date = new Date(parseInt(jsonData.item.date));
              date.setUTCMinutes(date.getUTCMinutes() + 9 * 60);

              if (jsonData != null || jsonData.length > 0) {
                events.push({
                  title: jsonData.item.cid + (jsonData.item.status === '예약완료' ? ' (예약완료)' : ''),
                  start: date.toISOString().slice(0, 10) + 'T' + jsonData.item.time,
                  extendedProps: {
                    event_num: jsonData.item.event_num,
                    request_term: jsonData.item.request_term,
                    cid: jsonData.item.cid,
                    type_a: jsonData.item.type_a,
                    date: date.toISOString().slice(0, 10),
                    time: jsonData.item.time
                  }
                });
              } else {
                console.error("데이터 형식이 잘못되었습니다. XML을 JSON으로 변환할 수 없습니다.");
              }
            }

            $.ajax({
              url: '/reservation/api/getAdminCalenderEvents',
              method: 'GET',
              dataType: 'xml',
              success: function (xmlData) {
                var items = xmlData.getElementsByTagName('item');

                try {
                  var unavailableEvents = [];
                  for (var i = 0; i < items.length; i++) {
                    var jsonData = x2js.xml2js(items[i].outerHTML);
                    unavailableEvents.push({
                      title: jsonData.item.status,
                      start: new Date(parseInt(jsonData.item.date)).toISOString(),
                      end: null
                    });
                  }

                  var existingEvents = events;
                  unavailableEvents.forEach(function (event) {
                    existingEvents.push(event);
                  });

                  successCallback(existingEvents);
                } catch (error) {
                  console.error("XML에서 이벤트 파싱 중 에러 발생: ", error);
                }
              },
              error: function () {
                alert('선택불가 이벤트를 불러오는데 실패했습니다!');
                failureCallback();
              }
            });
          } catch (error) {
            console.error("XML에서 이벤트 파싱 중 에러 발생: ", error);
          }
        }
      });
    },

    select: function(info) {
      var events = calendar.getEvents();
      var conflict = false;
      events.forEach(function(event) {
        if (info.start < event.end && info.end > event.start) {
          conflict = true;
        }
      });

      if (conflict) {
        Swal.fire({
          title: '중복 이벤트 감지',
          text: '다른 이벤트와 시간이 중복됩니다.',
          icon: 'error',
        });
      } else {
        Swal.fire({
          title: '이벤트 추가',
          text: '<선택불가> 이벤트를 추가하시겠습니까?',
          showCancelButton: true,
          confirmButtonText: '예',
          cancelButtonText: '아니요',
        }).then((result) => {
          if (result.isConfirmed) {
            var eventData = {
              event_num: 0,
              date: info.startStr,
              time: '00:00:00',
              request_term: null,
              cid: null,
              status: '선택불가',
              pno: 0,
              type_a: null,
              title: '선택불가',
              start: info.startStr,
              end: info.endStr,
              color: 'red',
              textColor: 'white'
            };
             // AJAX 요청을 사용하여 서버에 이벤트 데이터 전송
            $.ajax({
              url: '/reservation/api/saveUnavailableDate', // 서버의 엔드포인트 URL
              method: 'POST',
              data: JSON.stringify(eventData),
              contentType: "application/json; charset=utf-8",
              success: function(response) {
                // 성공적으로 저장되면 캘린더에 이벤트 추가
                calendar.addEvent({
                  title: eventData.title,
                  start: eventData.start,
                  end: eventData.end,
                  color: 'red', // 표시 색상 변경
                  textColor: 'white' // 글자색 변경
                });
              },
              error: function(jqXHR, textStatus, errorThrown) {
                alert('이벤트를 저장하는데 실패했습니다: ' + jqXHR.responseText);
              }
            });
          }
        });
      }
    },

    eventClick: function(info) {
      Swal.fire({
        title: '예약 확인',
        html: ' - 예약 정보 - <br>' +
              '예약번호: ' + info.event.extendedProps.event_num + '<br>' +
              '내용: ' + info.event.extendedProps.request_term + '<br>' +
              '고객아이디: ' + info.event.extendedProps.cid + '<br>' +
              '상품종류: ' + info.event.extendedProps.type_a + '<br>' +
              '날짜: ' + info.event.extendedProps.date + '<br>' +
              '시간: ' + info.event.extendedProps.time,
        showCancelButton: true,
        confirmButtonText: '확인',
      preConfirm: () => {
          var dataToSend = {
            event_num: info.event.extendedProps.event_num,
            date: info.event.extendedProps.date,
            time: info.event.extendedProps.time, 
            request_term: info.event.extendedProps.request_term, 
            cid: info.event.extendedProps.cid,
            status: '예약완료',
            pno: 0, 
            type_a: info.event.extendedProps.type_a
          };
          console.log('전송하는 데이터:', dataToSend);  // 데이터 출력
          
          $.ajax({
            url: '/reservation/api/updateEvent',
            method: 'POST',
            data: JSON.stringify(dataToSend),
            contentType: "application/json; charset=utf-8",
            success: function() {

              info.event.extendedProps.status = '예약완료';
              // 선택적으로 다른 속성도 서버 응답에 따라 업데이트할 수 있습니다.
              // 예를 들어: info.event.extendedProps.admin_confirmation = true;

              // 캘린더에 이벤트를 다시 렌더링
              info.event.setProp('title', info.event.title + ' (예약완료)');
              calendar.renderEvent(info.event);

              Swal.fire({
                title: '성공',
                text: '이벤트가 성공적으로 업데이트되었습니다.',
                icon: 'success',
              });
            },
            error: function() {
              Swal.fire({
                title: '실패',
                text: '이벤트 업데이트에 실패했습니다.',
                icon: 'error',
              });
            }
          });
        }
      });
    },

    eventDidMount: function(info) {
      if (info.event.title === '선택불가') {
        info.el.style.backgroundColor = 'red';
        info.el.style.color = 'white';
      }
    }
  });
$('#save').on('click', function() {
  var events = calendar.getEvents();
  var unavailableEvents = events.filter(event => event.title === '선택불가');

  var eventData = unavailableEvents.map(event => ({
    title: event.title,
    start: event.start,
    end: event.end
  }));

  // 필요한 경우 여기에서 eventData를 서버에 전송하는 AJAX 요청을 추가할 수 있습니다.

  Swal.fire({
    title: '저장 완료',
    text: '확인/수정 되었습니다',
    icon: 'success',
    confirmButtonText: '확인'
  }).then((result) => {
    if (result.isConfirmed) {
      window.location.href = '/home';
    }
  });
});
  calendar.render();
});
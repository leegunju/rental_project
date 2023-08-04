package com.myweb.www.controller;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myweb.www.domain.CalenderVO;
import com.myweb.www.service.ReservaionService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/reservation/*")
@Controller
public class ReservationController {
	
	@Inject
	private ReservaionService rssv;
	
	@GetMapping("/calender")
	public String calenderGet() {
		log.info("캘린더 페이지 진입");
		return "/reservation/calender";
	}
	
	@PostMapping("/calender")
	public ResponseEntity<String> calenderPost(@RequestBody CalenderVO clvo) {
	    log.info("캘린더 폼 시작");

	    Date date = clvo.getDate(); // date 추출
	    String timeString = clvo.getTime();

	    // 'HH:MM' 형식의 시간 데이터를 'HH:MM:SS' 형식으로 변환
	    if (timeString.matches("\\d{2}:\\d{2}")) {
	        timeString += ":00";
	    } else {
	        log.error("Invalid time format received: " + timeString);
	        return new ResponseEntity<>("Invalid time format", HttpStatus.BAD_REQUEST);
	    }

	    Time time = Time.valueOf(timeString); // time 추출
	    log.info("CalenderVO: " + clvo);

	    log.info("Filtered date: " + date);
	    log.info("Filtered time: " + time);
	    log.info("Clvo: " + clvo);
	    
	    int isOk = rssv.calender(clvo);
	    if(isOk > 0) {
	        log.info(">>>>>> 성공");
	        return new ResponseEntity<>("Event created successfully", HttpStatus.OK);
	    } else {
	        log.info(">>>>>> 실패");
	        return new ResponseEntity<>("Error in creating event", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}

	
	@GetMapping("/admincalender")
	public String admincalenderGet() {
		log.info("캘린더 페이지 진입");
		return "/reservation/admincalender";
	}
	
	@GetMapping("/api/events")
	@ResponseBody
	public List<CalenderVO> getEvents() {
		log.info("예약값확인하는것 >>>>> : ");
		List<CalenderVO> clvo = rssv.getAllEvents();
		log.info("clvo >>>>> : " + clvo.toString());
		
	    return clvo;
	}
	
	@PostMapping("/api/updateEvent")
	public ResponseEntity<String> updateEvent(@RequestBody CalenderVO clvo) {
	  log.info("받은 데이터: " + clvo.toString());  // 데이터 출력

	  try {
	    int isOk = rssv.updateEvent(clvo);
	    log.info(">>>>>>"+isOk);

	    if (isOk > 0) {
	      log.info(">>>>>> 성공");
	      return new ResponseEntity<>("이벤트가 성공적으로 업데이트되었습니다.", HttpStatus.OK);
	    } else {
	      log.info(">>>>>> 실패");
	      return new ResponseEntity<>("이벤트 업데이트에 실패하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	  } catch (Exception e) {
	    log.error("이벤트 업데이트 실패: " + e.getMessage(), e);
	    return new ResponseEntity<>("이벤트 업데이트 중 오류가 발생하였습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
	  }
	}

	@PostMapping("/api/saveEvents")
	public ResponseEntity<String> saveEvents(@RequestBody List<CalenderVO> events) {
	    log.info("새로 저장할 이벤트 데이터 수신" + events);

	    try {
	        for (CalenderVO event : events) {
	            int isOk = rssv.saveEvent(event);

	            if (isOk > 0) {
	                log.info("이벤트 '" + event.getEvent_num() + "' 저장 성공");
	            } else {
	                log.error("이벤트 '" + event.getEvent_num() + "' 저장 실패");
	                return new ResponseEntity<>("이벤트 저장에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
	            }
	        }

	        return new ResponseEntity<>("모든 이벤트가 성공적으로 저장되었습니다.", HttpStatus.OK);
	    } catch (Exception e) {
	        log.error("이벤트 저장 중 오류 발생: " + e.getMessage(), e);
	        return new ResponseEntity<>("이벤트 저장 중 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
	@PostMapping("/api/saveUnavailableDate")
	public ResponseEntity<String> saveUnavailableDate(@RequestBody CalenderVO clvo) {
	    log.info("선택불가 날짜 데이터 수신: " + clvo.toString());

	    clvo.setStatus("선택불가"); // 상태를 서버 측에서 직접 설정

	    try {
	        int isOk = rssv.saveUnavailableDate(clvo); // 서비스 메서드 호출
	        log.info("선택불가 날짜 저장 호출 결과: " + (isOk == 1 ? "성공" : "실패")); // 성공/실패 로그 추가

	        if (isOk > 0) {
	            log.info("선택불가 날짜 저장 성공");
	            return new ResponseEntity<>("날짜가 선택불가로 저장되었습니다.", HttpStatus.OK);
	        } else {
	            log.error("선택불가 날짜 저장 실패");
	            return new ResponseEntity<>("저장에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    } catch (Exception e) {
	        log.error("선택불가 날짜 저장 중 오류 발생: " + e.getMessage(), e);
	        return new ResponseEntity<>("저장 중 오류가 발생했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
	
	@GetMapping("/api/getAdminCalenderEvents")
	@ResponseBody
	public List<CalenderVO> getAdminCalenderEvents() {
	    log.info("어드민 캘린더의 이벤트들을 불러오는 중");
	    List<CalenderVO> events = rssv.getAdminCalenderEvents(); // 서비스 메서드 호출
	    log.info("어드민 캘린더의 이벤트들: " + events.toString());
	    return events;
	}


}

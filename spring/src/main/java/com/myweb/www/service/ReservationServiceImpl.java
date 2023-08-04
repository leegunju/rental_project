package com.myweb.www.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.CalenderVO;
import com.myweb.www.repository.ReservationDAO;
import com.myweb.www.repository.adminDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReservationServiceImpl implements ReservaionService {
	
	@Inject
	private ReservationDAO rdao;
	
	@Inject
	private adminDAO adao;

	@Override
	public int calender(CalenderVO clvo) {
		log.info(">>> reservation calender in");
		return rdao.calender(clvo);
	}

	@Override
	public List<CalenderVO> getAllEvents() {
		// TODO Auto-generated method stub
		log.info(">>> reservation admin_calender in");
		return adao.getAllEvents();
	}

	@Override
	public int saveEvent(CalenderVO event) {
	    if (event.getDate() == null) {
	        log.error(">>> 이벤트 저장 실패: date 값이 없습니다");
	        return 0;
	    }
	    log.info(">>> 이벤트 저장 시작");
	    int result = rdao.saveEvent(event);
	    if(result > 0){
	        log.info(">>> 이벤트 저장 성공");
	    } else {
	        log.info(">>> 이벤트 저장 실패");
	    }
	    return result;
	}

	@Override
	   public int updateEvent(CalenderVO clvo) {
	      // TODO Auto-generated method stub
	      return adao.updateEvent(clvo);
	   }

	@Override
	public int saveUnavailableDate(CalenderVO clvo) throws SQLException {
	    try {
	        log.info("DB 연결 시작...");
	        int result = adao.saveUnavailableDate(clvo); // DB 연결 및 데이터 저장 코드 호출
	        if(result > 0) {
	            log.info("DB 연결 및 저장 성공!");
	            return 1; // 성공
	        } else {
	            log.error("DB 연결 및 저장 실패!");
	            return 0; // 실패
	        }
	    } catch (Exception e) {
	        log.error("알 수 없는 오류 발생: " + e.getMessage(), e);
	        return 0; // 실패
	    }
	}

	@Override
	public List<CalenderVO> getAdminCalenderEvents() {
	    log.info(">>> 어드민 캘린더 이벤트 불러오기 시작");
	    List<CalenderVO> events = adao.getAdminCalenderEvents();
	    if(events != null && !events.isEmpty()){
	        log.info(">>> 어드민 캘린더 이벤트 불러오기 성공");
	    } else {
	        log.info(">>> 어드민 캘린더 이벤트 없음");
	    }
	    return events;
	}



}

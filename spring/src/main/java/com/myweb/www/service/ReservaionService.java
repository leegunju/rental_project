package com.myweb.www.service;

import java.sql.SQLException;
import java.util.List;

import com.myweb.www.domain.CalenderVO;

public interface ReservaionService {

	int calender(CalenderVO clvo);

	List<CalenderVO> getAllEvents();

	int saveEvent(CalenderVO event);

	int updateEvent(CalenderVO clvo);

	int saveUnavailableDate(CalenderVO clvo) throws SQLException;

	List<CalenderVO> getAdminCalenderEvents();

}

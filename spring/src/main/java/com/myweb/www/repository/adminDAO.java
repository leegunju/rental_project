package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.CalenderVO;

public interface adminDAO {

	List<CalenderVO> getAllEvents();

	int updateEvent(CalenderVO clvo);

	int saveUnavailableDate(CalenderVO clvo);

	List<CalenderVO> getAdminCalenderEvents();

}

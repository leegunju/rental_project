package com.myweb.www.repository;

import com.myweb.www.domain.CalenderVO;

public interface ReservationDAO {

	int calender(CalenderVO clvo);

	int updateEvent(CalenderVO clvo);

	int saveEvent(CalenderVO event);

	int saveUnavailableDate(CalenderVO clvo);


}

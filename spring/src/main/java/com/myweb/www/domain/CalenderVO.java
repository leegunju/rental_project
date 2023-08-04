package com.myweb.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;
import java.sql.Time;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class CalenderVO {
    private int event_num;            // 이벤트 번호
    private Date date;                // 날짜
    private String time;                // 시간
    private String request_term;      // 요청 기간
    private String cid;               // 사용자 ID
    private String status;            // 상태
    private boolean admin_confirmation; // 관리자 확인 여부
    private int pno;                  // 제품 번호
    private String type_a;
}
package com.service.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CouponVO {
	
	private int no;
	private String phone;
	private String couponNo;
	private Date issuedDate;
		
	
}

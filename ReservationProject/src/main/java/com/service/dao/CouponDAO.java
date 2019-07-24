package com.service.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.service.mapper.CouponMapper;
import com.service.vo.CouponVO;

@Repository
public class CouponDAO {
	
	@Autowired
	private CouponMapper mapper;
	
	// 모바일 번호 중복 체크
	public List<CouponVO> userPhoneData() {
		return mapper.userPhoneData();
	}
	
	// 데이터 저장
	public void couponData(CouponVO vo) {
		mapper.couponData(vo);
	}
	
	// 데이터 목록
	public List<CouponVO> listData() {
		return mapper.listData();
	}
	
	// 데이터 개수
	public int listCount() {
		return mapper.listCount();
	}
}

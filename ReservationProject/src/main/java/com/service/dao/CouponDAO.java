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
	
	// ����� ��ȣ �ߺ� üũ
	public List<CouponVO> userPhoneData() {
		return mapper.userPhoneData();
	}
	
	// ������ ����
	public void couponData(CouponVO vo) {
		mapper.couponData(vo);
	}
	
	// ������ ���
	public List<CouponVO> listData() {
		return mapper.listData();
	}
	
	// ������ ����
	public int listCount() {
		return mapper.listCount();
	}
}

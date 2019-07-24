package com.service.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.service.vo.CouponVO;

public interface CouponMapper {

	@Select("SELECT phone FROM coupon")
	public List<CouponVO> userPhoneData();
	
	@Insert("INSERT INTO coupon VALUES((SELECT NVL(MAX(no)+1,1) FROM coupon), #{phone}, #{couponNo}, SYSDATE)")
	public void couponData(CouponVO vo);
	
	@Select("SELECT * FROM coupon ORDER BY no DESC")
	public List<CouponVO> listData();
	
	@Select("SELECT COUNT(*) FROM coupon")
	public int listCount();
}

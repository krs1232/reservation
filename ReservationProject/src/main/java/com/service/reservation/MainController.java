package com.service.reservation;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.service.dao.CouponDAO;
import com.service.vo.CouponVO;

@Controller
public class MainController {
	
	@Autowired
	private CouponDAO dao;
	
	@RequestMapping("main/main.do")
	public String mainController(Model model, String tel1, String tel2, String tel3) {
		List<CouponVO> phoneList = dao.userPhoneData();
		String phone = tel1 + "-" + tel2 + "-" + tel3;
		int count = dao.listCount();
		
		if (!phone.equals("null-null-null")) {
			if (count == 0) {
				model.addAttribute("unusedPhone", phone);
				model.addAttribute("tel2", tel2);
				model.addAttribute("tel3", tel3);
			}
			
			for (CouponVO vo : phoneList) {
				if (vo.getPhone().equals(phone)) {				// 핸드폰 중복시
					model.addAttribute("usedPhone", phone);
				} else {										// 핸드폰 데이터가 없을시
					model.addAttribute("unusedPhone", phone);
					model.addAttribute("tel2", tel2);
					model.addAttribute("tel3", tel3);
				}
			}
		}
		
		return "main/main";
	}
	
	@RequestMapping("main/coupon.do")
	public String couponController() {
		
		return "main/coupon";
	}
	
	@RequestMapping("main/insert.do")
	public String insertController(String redeem, String phone) {
		CouponVO vo = new CouponVO();
		vo.setPhone(phone);
		vo.setCouponNo(redeem);
		
		dao.couponData(vo);
		
		return "main/main";
	}
	
	@RequestMapping("main/list.do")
	public String listController(Model model, String page) {
		List<CouponVO> list = dao.listData();
		int count = dao.listCount();
		
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		
		return "main/list";
	}
}

package com.service.reservation;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.service.vo.CouponVO;

@RestController
public class MainRestController {

	@RequestMapping("main/couponVO.do") 
	public String listvo(String tel2) {
		Double seed = Double.parseDouble(tel2);	// 초기값
		String[] arr = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
						"A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
					    "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T",
						"U", "V", "W", "X", "Y", "Z",
		                "a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
						"k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
						"u", "v", "w", "x", "y", "z"};
		String redeemCode = "";
		// 선형합동법
		double m = Math.pow(2, 32);		// 최대 난수 주기
		int a = 22695477;
		int c = 1;
		double ran = 0;
	
		for (int i = 0; i < 12; i++) {
		
			ran = (a*seed + c) % m;	// 선형합동법 공식
			
			System.out.println(ran);
			
			String str = Double.toString(ran);
			str = str.substring(1,4);
			
			str = str.replace(".", "0.");
			Double d = Double.parseDouble(str);
			int random = (int)(d*62);
			redeemCode += arr[random];
			if (redeemCode.length() == 4 || redeemCode.length() == 9)
				redeemCode += "-";
			
			seed = ran;
			
		}

		return redeemCode;
	}
	
}

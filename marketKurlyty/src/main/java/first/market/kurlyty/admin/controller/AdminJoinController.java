package first.market.kurlyty.admin.controller;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminVO;
import first.market.kurlyty.user.controller.SecurityUtil;
import first.market.kurlyty.user.vo.UserVO;

@Controller
public class AdminJoinController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/join.mdo")
	public String adminJoin(Model model) {
		return "admin_join";
	}
	
	//관리자 회원가입
	@RequestMapping("joinProc.mdo")
	public String joinProc(AdminVO admin) {
		int success = 0;
		try {
			System.out.println(admin);/////
			String securityPw = SecurityUtil.sha256(admin.getAdmin_pw());
			admin.setAdmin_pw(securityPw);
			System.out.println(securityPw);///////
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		success = adminService.joinProc(admin);
		if(success==1) {
			return "admin_index";
		}else {
			return "redirect:join.mdo";
		}
	}

	//관리자 회원가입-아이디 체크
		@RequestMapping(value="/idCheck.mdo", produces="html/text; charset=utf-8")
		@ResponseBody
		public String idCheck(AdminVO admin) {
			boolean used = adminService.idCheck(admin);
			if(used)
				return "{\"message\":\"사용가능한 아이디 입니다.\",\"usedId\":\"가능\"}";
			else
				return "{\"message\":\"사용 불가능한 아이디 입니다.\",\"usedId\":"
						+ "\"불가능\"}";
		}
	
}

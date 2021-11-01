package first.market.kurlyty.admin.controller;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminVO;
import first.market.kurlyty.user.controller.SecurityUtil;

@Controller
public class MainController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/join.mdo")
	public String adminJoin(Model model) {
		return "join";
	}
	
	@RequestMapping("joinProc.mdo")
	public String joinProc(AdminVO admin, Model model) {
		int success = 0;
		try {
			String securityPw = SecurityUtil.sha256(admin.getAdmin_pw());
			admin.setAdmin_pw(securityPw);
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

}

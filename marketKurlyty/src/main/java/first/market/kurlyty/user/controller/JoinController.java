package first.market.kurlyty.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.user.service.UserService;
import first.market.kurlyty.user.vo.UserVO;

@Controller
public class JoinController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/join.do")
	public String loginAndJoin1() {
		return "login_and_join/join";
	}
	
	@RequestMapping("/joinProc.do")
	public String loginProc(UserVO user, Model model) {
		int success = 0;
		System.out.println("user_id : "+user.getUser_id());
		System.out.println("user_pw : "+user.getUser_pw());
		System.out.println("user_name : "+user.getUser_name());
		System.out.println("user_email : "+user.getUser_email());
		System.out.println("user_phone : "+user.getUser_phone());
		System.out.println("user_address1 : "+user.getUser_address1());
		System.out.println("user_address2 : "+user.getUser_address2());
		System.out.println("user_zipcode : "+user.getUser_zipcode());
		System.out.println("user_sex : "+user.getUser_sex());
		System.out.println("user_birth : "+user.getUser_birth());
		success = userService.loginProc(user);
//		model.addAttribute("joinfalse",true);
//		model.addAttribute("id",user.getUser_id());
//		model.addAttribute("email",user.getUser_email());
//		model.addAttribute("name",user.getUser_name());
		if(success==1) {
			return "mainPage/index";//=>/WEB-INF/user/mainPAge
		}else {
			return "redirect:join.do";
		}
//		return "redirect:index.do";
	}
	
	@RequestMapping(value="/idCheck.do", produces="html/text; charset=utf-8")
	@ResponseBody
	public String idCheck(UserVO user) {
		boolean used = userService.idCheck(user);
		if(used)
			return "{\"message\":\"사용가능한 아이디 입니다.\",\"usedId\":\"가능\"}";
		else
			return "{\"message\":\"사용 불가능한 아이디 입니다.\",\"usedId\":"
					+ "\"불가능\"}";
	}
	
	@RequestMapping(value="/emailCheck.do", produces="html/text; charset=utf-8")
	@ResponseBody
	public String emailCheck(UserVO user) {
		boolean used = userService.emailCheck(user);
		if(used)
			return "{\"message\":\"사용가능한 이메일 입니다.\",\"usedEmail\":\"가능\"}";
		else
			return "{\"message\":\"사용 불가능한 이메일 입니다.\",\"usedEmail\":"
					+ "\"불가능\"}";
	}
}

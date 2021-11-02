package first.market.kurlyty.user.controller;

import java.security.NoSuchAlgorithmException;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import first.market.kurlyty.sms.MessageService;
import first.market.kurlyty.user.service.UserService;
import first.market.kurlyty.user.vo.UserVO;

@Controller
public class UserJoinController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/join.do")
	public String loginAndJoin1(Model model) {
		return "login_and_join/join";
	}
	
	//ȸ������
	@RequestMapping("/joinProc.do")
	public String joinProc(UserVO user, Model model) {
		int success = 0;
		try {
			String securityPw = SecurityUtil.sha256(user.getUser_pw());
			user.setUser_pw(securityPw);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		success = userService.joinProc(user);
		if(success==1) {
			userService.initUserDetails(user);
			userService.initUserAddressList(user);
			return "mainPage/index";//=>/WEB-INF/user/mainPAge
		}else {
			return "redirect:join.do";
		}
	}
	
	//ȸ������-���̵� üũ
	@RequestMapping(value="/idCheck.do", produces="html/text; charset=utf-8")
	@ResponseBody
	public String idCheck(UserVO user) {
		boolean used = userService.idCheck(user);
		if(used)
			return "{\"message\":\"��밡���� ���̵� �Դϴ�.\",\"usedId\":\"����\"}";
		else
			return "{\"message\":\"��� �Ұ����� ���̵� �Դϴ�.\",\"usedId\":"
					+ "\"�Ұ���\"}";
	}
	
	//ȸ������ - �̸���üũ
	@RequestMapping(value="/emailCheck.do", produces="html/text; charset=utf-8")
	@ResponseBody
	public String emailCheck(UserVO user) {
		boolean used = userService.emailCheck(user);
		if(used)
			return "{\"message\":\"��밡���� �̸��� �Դϴ�.\",\"usedEmail\":\"����\"}";
		else
			return "{\"message\":\"��� �Ұ����� �̸��� �Դϴ�.\",\"usedEmail\":"
					+ "\"�Ұ���\"}";
	}
	
	//ȸ������ -��������
	@RequestMapping(value="/smsCheck.do", produces="html/text; charset=utf-8" )
	@ResponseBody
	public String smsService(UserVO user) {
		System.out.println("sms�߼�");
		MessageService sms = new MessageService();
		
		int randomNum = (int)(Math.random()*10000)+1;
		String randomStr;
		if(randomNum/1000==0)randomStr="0"+randomNum;
		else if(randomNum/100==0)randomStr="00"+randomNum;
		else if(randomNum/10==0)randomStr="000"+randomNum;
		else randomStr=String.valueOf(randomNum);
		
		sms.sendMessage(user.getUser_phone(), randomStr);
		String numberData;
		numberData = "{\"checkNum\":"+randomStr+"}";
		return numberData;
	}
}

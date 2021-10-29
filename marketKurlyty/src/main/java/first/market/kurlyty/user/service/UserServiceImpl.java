package first.market.kurlyty.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.user.dao.UserDAO;
import first.market.kurlyty.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDao;
	
	@Override
	@RequestMapping("/join.do")
	public String loginAndJoin1() {
		return "login_and_join/join"; 
	}
	
	@Override
	@RequestMapping("/joinProc.do")
	public String loginProc(UserVO user, Model model) {
		int success = 0;
		success = userDao.insertUser(user);
		model.addAttribute("joinfalse",true);
		model.addAttribute("id",user.getUser_id());
		model.addAttribute("email",user.getUser_email());
		model.addAttribute("name",user.getUser_name());
		if(success==1) {
			return "mainPage/index";//=>/WEB-INF/user/mainPAge
		}else {
			return "redirect:join.do";
		}
	}
}

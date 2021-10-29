package first.market.kurlyty.user.service;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.user.vo.UserVO;

public interface UserService {

	String loginAndJoin1();

	String loginProc(UserVO user, Model model);

}
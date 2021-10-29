package first.market.kurlyty.user.service;

import first.market.kurlyty.user.vo.UserVO;

public interface UserService {
	boolean idCheck(UserVO user);
	boolean emailCheck(UserVO user);
	int loginProc(UserVO user);

}
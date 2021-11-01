package first.market.kurlyty.user.service;

import first.market.kurlyty.user.vo.UserVO;

public interface UserService {
	boolean idCheck(UserVO user);
	boolean emailCheck(UserVO user);
	int joinProc(UserVO user);
	void initUserDetails(UserVO user);
	void initUserAddressList(UserVO user);
	UserVO loginGetUser(UserVO user);
	
}
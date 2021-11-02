package first.market.kurlyty.user.service;

import first.market.kurlyty.user.vo.UserVO;

public interface oneToOneInquiryBoardService {
	
//제목만 수정 >>이하 수정해야함 
	boolean idCheck(UserVO user);
	boolean emailCheck(UserVO user);
	int joinProc(UserVO user);
	void initUserDetails(UserVO user);
	void initUserAddressList(UserVO user);
	UserVO loginGetUser(UserVO user);
	
}
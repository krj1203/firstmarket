package first.market.kurlyty.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.UserDAO;
import first.market.kurlyty.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDao;
	
	@Override
	public boolean idCheck(UserVO user) {
		UserVO userData = userDao.getUser(user);
		if(userData==null)
			return true;
		else
			return false;
	}
	
	@Override
	public int joinProc(UserVO user) {
		int success = 0;
		success = userDao.insertUser(user);
		return success;
	}

	@Override
	public boolean emailCheck(UserVO user) {
		UserVO userData = userDao.checkEmail(user);
		if(userData==null) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public void initUserDetails(UserVO user) {
		userDao.insertUserDetails(user);
	}

	@Override
	public void initUserAddressList(UserVO user) {
		userDao.insertUserAddressList(user);
	}
	
	@Override
	public UserVO loginGetUser(UserVO user) {
		return userDao.getUser(user);
	}
	
	
}

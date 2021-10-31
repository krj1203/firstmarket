package first.market.kurlyty.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public UserVO getUser(UserVO user) {
		return sqlSession.selectOne("UserDAO.getUser", user);
	}
	public UserVO checkEmail(UserVO user) {
		return sqlSession.selectOne("UserDAO.checkEmail",user);
	}
	public int insertUser(UserVO user) {
		return sqlSession.insert("UserDAO.insertUser", user);
	}
	public void insertUserDetails(UserVO user) {
		sqlSession.insert("UserDAO.insertUserDetails",user);
	}
	public void insertUserAddressList(UserVO user) {
		sqlSession.insert("UserDAO.insertUserAddressList", user);
	}
	
}

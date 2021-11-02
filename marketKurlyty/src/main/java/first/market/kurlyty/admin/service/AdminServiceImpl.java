package first.market.kurlyty.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.admin.dao.AdminDAO;
import first.market.kurlyty.admin.vo.AdminVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDao;
	
	@Override
	public boolean idCheck(AdminVO admin) {
		AdminVO adminData = adminDao.getAdmin(admin);
		if(adminData ==null)
			return true;
		else
			return false;
	}
	
	@Override
	public int joinProc(AdminVO admin) {
		int success = 0;
		success = adminDao.insertAdmin(admin);
		return success;
	}
	
	
	
	
	
	
}

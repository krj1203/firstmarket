package first.market.kurlyty.admin.service;

import first.market.kurlyty.admin.vo.AdminVO;

public interface AdminService {

	boolean idCheck(AdminVO admin);

	int joinProc(AdminVO admin);

}
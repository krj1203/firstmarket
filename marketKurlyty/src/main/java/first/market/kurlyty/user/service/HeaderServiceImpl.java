package first.market.kurlyty.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.HeaderDAO;
import first.market.kurlyty.vo.ProductVO;

@Service
public class HeaderServiceImpl implements HeaderService {
	@Autowired
	private HeaderDAO headerDao;
	
	@Override
	public List<ProductVO> getCategoryProduct(ProductVO product){
		return headerDao.getProduct(product);
	}
}

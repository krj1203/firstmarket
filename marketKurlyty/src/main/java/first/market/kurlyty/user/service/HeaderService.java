package first.market.kurlyty.user.service;

import java.util.List;

import first.market.kurlyty.vo.ProductVO;

public interface HeaderService {

	List<ProductVO> getCategoryProduct(ProductVO product);

}
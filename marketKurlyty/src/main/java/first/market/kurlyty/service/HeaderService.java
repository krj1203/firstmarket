package first.market.kurlyty.service;

import java.util.List;

import first.market.kurlyty.vo.ProductVO;

public interface HeaderService {

	List<ProductVO> getCategoryProduct(ProductVO product);

}
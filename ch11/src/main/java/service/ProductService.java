package service;

import java.util.List;

import dao.ProductDAO;
import dto.ProductDTO;

public enum ProductService {
	
	// 열거타입으로 싱글톤 생성
	INSTANCE;
	
	private ProductDAO dao = ProductDAO.getInstance();
	
	
	public void insertProduct(ProductDTO dto) {
		dao.insertProduct(dto);
	}
	
	public ProductDTO selectProduct(String prodNo) {
		return dao.selectProduct(prodNo);
	}
	
	public List<ProductDTO> selectProducts() {
		return dao.selectProducts();
	}
	
	public void updateProduct(ProductDTO dto) {
		dao.updateProduct(dto);
	}
	
	public void deleteProduct(String prodNo) {
		dao.deleteProduct(prodNo);
	}
}

package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.ProductDTO;
import util.DBHelper;

public class ProductDAO extends DBHelper {
	
	private static ProductDAO instance = new ProductDAO();
	public static ProductDAO getInstance() {
		return instance;
	}
	private ProductDAO() {}
	
	private Logger logger = LoggerFactory.getLogger("CustomerDAO");
	
	
	public void insertProduct(ProductDTO dto) {
		
		String sql = "insert into Product values (?,?,?,?,?)";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getProdNo());
			psmt.setString(2, dto.getProdName());
			psmt.setInt(3, dto.getStock());
			psmt.setInt(4, dto.getPrice());
			psmt.setString(5, dto.getCompany());
			psmt.executeUpdate();
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ProductDTO selectProduct(String prodNo) {
		ProductDTO dto = null;
		
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `product` where `prodNo` = ?");
			psmt.setString(1, prodNo);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new ProductDTO();
				dto.setProdNo(rs.getInt(1));
				dto.setProdName(rs.getString(2));
				dto.setStock(rs.getInt(3));
				dto.setPrice(rs.getInt(4));
				dto.setCompany(rs.getString(5));
			}
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public List<ProductDTO> selectProducts() {
		
		List<ProductDTO> products = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from `Product`");
			
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProdNo(rs.getInt(1));
				dto.setProdName(rs.getString(2));
				dto.setStock(rs.getInt(3));
				dto.setPrice(rs.getInt(4));
				dto.setCompany(rs.getString(5));
				products.add(dto);
			}
			closeAll();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return products;
	}
	
	public void updateProduct(ProductDTO dto) {
		
		String sql = "update `product` set `prodname`=?, `stock`=?, `price`=?, `company`=? where `prodNo`=?";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString	(1, dto.getProdName());
			psmt.setInt		(2, dto.getStock());
			psmt.setInt		(3, dto.getPrice());
			psmt.setString	(4, dto.getCompany());
			psmt.setInt 	(5, dto.getProdNo());
			psmt.executeUpdate();
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteProduct(String prodNo) {

		try {
			conn = getConnection();
			psmt = conn.prepareStatement("delete from `Product` where `prodNo`=?");
			psmt.setString(1, prodNo);
			psmt.executeUpdate();
			closeAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
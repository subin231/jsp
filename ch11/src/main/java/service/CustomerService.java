package service;

import java.util.List;

import dao.CustomerDAO;
import dto.CustomerDTO;

public enum CustomerService {
	
	// 열거타입으로 싱글톤 생성
	INSTANCE;
	
	private CustomerDAO dao = CustomerDAO.getInstance();
	
	
	public void insertCustomer(CustomerDTO dto) {
		dao.insertCustomer(dto);
	}
	
	public CustomerDTO selectCustomer(String custid) {
		return dao.selectCustomer(custid);
	}
	
	public List<CustomerDTO> selectCustomers() {
		return dao.selectCustomers();
	}
	
	public void updateCustomer(CustomerDTO dto) {
		dao.updateCustomer(dto);
	}
	
	public void deleteCustomer(String custid) {
		dao.deleteCustomer(custid);
	}
}

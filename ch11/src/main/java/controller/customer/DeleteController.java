package controller.customer;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CustomerService;

@WebServlet("/customer/delete.do")
public class DeleteController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private CustomerService service = CustomerService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 수신
		String custId = req.getParameter("custId"); 
	
		//데이터 삭제
		service.deleteCustomer(custId);
		
		//리다이렉트
		resp.sendRedirect("/ch11/customer/list.do");
		
	}
	
	
}

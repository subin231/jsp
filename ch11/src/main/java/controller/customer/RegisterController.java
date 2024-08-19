package controller.customer;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CustomerDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CustomerService;

@WebServlet("/customer/register.do")
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private CustomerService service = CustomerService.INSTANCE;
	
	private Logger logger  = LoggerFactory.getLogger("RegisterController");
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/customer/register.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	// 서비스 인스턴스 멤버
	


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 데이터 수신
		String custid 	= 	req.getParameter("custid");
		System.out.println(custid);
		String name		= 	req.getParameter("name");
		String hp 		= 	req.getParameter("hp");
		String addr		= 	req.getParameter("addr");
		String rdate 	= 	req.getParameter("rdate");
		
		
		logger.debug("custId : "+ custid );
		logger.debug("name : "+ name );
		logger.debug("hp : "+ hp );
		
		
		// DTO 생성
		CustomerDTO dto = new CustomerDTO();
		dto.setCustId(custid);
		dto.setName(name);
		dto.setHp(hp);
		dto.setAddr(addr);
		dto.setRdate(rdate);
		
		// 서비스 실행
		service.insertCustomer(dto);
		
		
		// 리다이렉트
		resp.sendRedirect("/ch11/customer/list.do");
		
	}

}



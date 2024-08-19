package controller.product;

import java.io.IOException;

import dto.ProductDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ProductService;

@WebServlet("/product/modify.do")
public class ModifyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 데이터 수신
		String prodNo = req.getParameter("prodNo");
		
		// 데이터 조회
		ProductDTO productlist = service.selectProduct(prodNo);
		
		// 데이터 공유
		req.setAttribute("products", productlist);
		
		// View 포워드
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/product/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 데이터 수신
		String prodNo = req.getParameter("prodNo");
		String prodName = req.getParameter("prodName");
		String stock = req.getParameter("stock");
		String price = req.getParameter("price");
		String company = req.getParameter("company");
		
		// DTO 생성(DTO - 데이터 전송 객체, 컴포넌트간 데이터 교환을 위한 객체)
		ProductDTO dto = new ProductDTO();
		dto.setProdNo(prodNo);
		dto.setProdName(prodName);
		dto.setStock(stock);
		dto.setPrice(price);
		dto.setCompany(company);
		
		// 데이터 수정 요청
		service.updateProduct(dto);
		
		// 리다이렉트
		resp.sendRedirect("/ch11/product/list.do");
	}
}
package controller.product;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.ProductDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ProductService;

@WebServlet("/product/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProductService service = ProductService.INSTANCE;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 데이터 조회
		List<ProductDTO> productlist = service.selectProducts();
		
		logger.info("products - "+ productlist);
		
		// 데이터 공유 참조
		req.setAttribute("products", productlist);
		
		// 포워드
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/product/list.jsp");
		dispatcher.forward(req, resp);
	}
	
}
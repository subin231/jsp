package controller.user1;

import java.io.IOException;

import dto.User1DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User1Service;

@WebServlet("/user1/register.do")
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user1/register.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	// 서비스 인스턴스 멤버
	private User1Service service = User1Service.getInstance();
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. 데이터 수신 필요
		
		String uid = req.getParameter("uid");
		String name = req.getParameter("name");
		String birth = req.getParameter("birth");
		String hp = req.getParameter("hp");
		String age = req.getParameter("age");
		
		// 2. DTO(data transfer object) 생성
		User1DTO dto = new User1DTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setBirth(birth);
		dto.setHp(hp);
		//dto에 parseint 붙여서 스트링 허용(오버로딩)
		dto.setAge(age);
		
		
		// 3. 모델 서비스 호출
		service.insertUser1(dto);
		
		// 4. 리다이렉트
		resp.sendRedirect("/ch10/user1/list.do");
	}

}



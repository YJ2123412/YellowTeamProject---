package mybatis.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.controller.Controller;
import mybatis.dao.MemberDao;
import mybatis.vo.Member;

public class MyPageDropController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = ((Member)session.getAttribute("user")).getCode();
		
		MemberDao dao = MemberDao.getInstance();
		dao.drop(id);
		session.invalidate();
		RequestDispatcher dispatcher = request.getRequestDispatcher("/myPage/drop.jsp");
		dispatcher.forward(request, response);
	}

}

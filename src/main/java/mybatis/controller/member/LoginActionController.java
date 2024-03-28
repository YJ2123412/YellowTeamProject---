package mybatis.controller.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import mybatis.controller.Controller;
import mybatis.controller.service.MemberService;
import mybatis.vo.Member;

public class LoginActionController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(LoginActionController.class);
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("code");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		logger.info("code = " + id);
		logger.info("password = " + password);
		Map<String, String> map = new HashMap<>();
		map.put("code", id);
		map.put("password", password);
		MemberService pas = new MemberService();
		Member user = pas.login(map);
		
		String url = request.getContextPath();
		if (user != null) {
		    session.setAttribute("user", user);
		    
		    System.out.println("아이디"+session.getAttribute("user"));
		} else {
		    Cookie cookie = new Cookie("incorrect", "y");
		    cookie.setPath("/");
		    response.addCookie(cookie);
		    url = request.getContextPath() + "/login"; // 로그인 실패 시 로그인 페이지로 리다이렉트
		}
		response.sendRedirect(url);
	}
}

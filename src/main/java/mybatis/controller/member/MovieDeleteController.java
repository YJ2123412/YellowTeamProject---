package mybatis.controller.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.controller.Controller;
import mybatis.dao.ReserveDao;
import mybatis.vo.Member;


//요청 매핑 : mapping.put(new RequestKeyValue("/community/delete","GET"), new DeleteController() );
public class MovieDeleteController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReserveDao dao = ReserveDao.getInstance();
		HttpSession session = request.getSession();
		String member_code = ((Member)session.getAttribute("user")).getCode();
		Object rcode= (String)request.getParameter("rcode");
		String rcode2= (String)request.getParameter("rcode");
		Map<String, String> map = new HashMap<>();
		
		map.put("member_code", member_code);
		map.put("rcode", rcode2);
		
		int result = dao.delete(map);
		
		System.out.println(member_code);
		System.out.println(rcode);
		System.out.println(rcode2);
		System.out.println(result);
		
		response.sendRedirect("#");
	}
		

}

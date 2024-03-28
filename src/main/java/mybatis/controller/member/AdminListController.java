package mybatis.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;

import mybatis.controller.Controller;
import mybatis.dao.MemberDao;
import mybatis.vo.Member;

public class AdminListController implements Controller {
	public static final Logger logger = LoggerFactory.getLogger(AdminListController.class);

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao dao = MemberDao.getInstance();
		List<Member> list = dao.selectAdmin();
		request.setAttribute("list", list);
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonData = null;
		jsonData = objectMapper.writeValueAsString(list);
		logger.info("전송할 json문자열: {}", jsonData);

		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonData);
		
	}

}

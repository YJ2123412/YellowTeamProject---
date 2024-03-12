package mybatis.controller.api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import mybatis.controller.Controller;
import mybatis.dao.MemberDao;
import mybatis.vo.Member;

@Slf4j
public class ApiGetAllMembersController implements Controller {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objmapper = new ObjectMapper();
		MemberDao dao = MemberDao.getInstance();
		List<Member> list = dao.selectAll();
		log.info("member list : {}", list);

		Map<String, Object> data = new HashMap<>();
		data.put("memberlist", list);
		String jsonData = objmapper.writeValueAsString(data);
		
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(jsonData);
	}

}

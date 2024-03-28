package mybatis.controller.api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;

import mybatis.controller.Controller;
import mybatis.dao.MemberDao;

public class ApiCheckIdController implements Controller{
	private static final Logger logger = LoggerFactory.getLogger(ApiCheckIdController.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ObjectMapper objmapper = new ObjectMapper();
		MemberDao memberDao = MemberDao.getInstance();
		boolean result = memberDao.isExistId(request.getParameter("code"));
		
		Map<String,Boolean> data = new HashMap<>();
		data.put("isExist", result);
		String jsonData = objmapper.writeValueAsString(data);
		
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(jsonData);
		
	}

}

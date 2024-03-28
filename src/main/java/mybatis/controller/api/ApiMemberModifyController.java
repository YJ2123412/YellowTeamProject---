package mybatis.controller.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.controller.Controller;
import mybatis.dao.MemberDao;
import mybatis.vo.Member;

public class ApiMemberModifyController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(ApiMemberModifyController.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		InputStream inputStream = request.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8));
		StringBuffer sb = new StringBuffer();
		String line = null;
		
		while((line = br.readLine()) != null) {
			sb.append(line);
		}
		logger.info("json : {}",sb.toString());
		
		ObjectMapper objMapper = new ObjectMapper();
		Member member = objMapper.readValue(sb.toString(), Member.class);
		
		logger.info("member : {}",member);
		
		MemberDao dao = MemberDao.getInstance();
		dao.modify(member);
		
		HttpSession session = request.getSession();
		session.setAttribute("user", dao.getById(member.getCode()));
		
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("회원정보가 수정되었습니다.");
	}
}

package mybatis.controller.movie;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import mybatis.controller.Controller;
import mybatis.dao.ReserveDao;
import mybatis.vo.Member;
import mybatis.vo.ReserveList;

public class MoviecompleteController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(MovieReserveController.class);

	@Override
public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("---------------------------");
			
			HttpSession session = request.getSession();
			String member_code = ((Member)session.getAttribute("user")).getCode();
			String movie_code = request.getParameter("movie_code"); 
				
			ReserveDao dao = ReserveDao.getInstance(); 
			Map<String, String> map = new HashMap<>();
			map.put("movie_code", movie_code); 
			map.put("member_code", member_code);
			  
			List<ReserveList> list= dao.reserve(map); 
			request.setAttribute("list", list);
			request.setAttribute("member_code", member_code);
			 
			logger.info("movie_code: {}", movie_code);
			logger.info("member_code: {}", member_code);
            logger.info("list: {}", list);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("complete.jsp");
            dispatcher.forward(request, response);
		
		}
	}
		
		

package mybatis.controller.movie;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import mybatis.controller.Controller;
import mybatis.dao.MovieDao;
import mybatis.vo.Movie;

// 요청 매핑 : mapping.put(new RequestKeyValue("/community/read", "GET"), new ReadController() );
public class ReadController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(ReadController.class);

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//지정된 idx 메인글 읽기
		String temp = request.getParameter("mcode");			//메인글 글번호 파라미터로 받기
		long mcode=0;
		try {
			mcode= Long.parseLong(temp);
			MovieDao dao = MovieDao.getInstance();
			Movie bo = dao.selectByIdx(mcode);
			if(bo==null) throw new RuntimeException();   //잘못된 파라미터로 vo가 null 일때 런타임예외 발생시키기
			logger.debug("::::::: bo-{}:::::::",bo);
			request.setAttribute("bo", bo);
			
		
			request.setAttribute("page", request.getParameter("page"));    //현재페이지 번호 전달 -순서2)
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("read.jsp");
			dispatcher.forward(request, response);
		}catch (NumberFormatException  e) {
			response.sendRedirect("search_list");			// NumberFormatException  처리
		}
	}

}

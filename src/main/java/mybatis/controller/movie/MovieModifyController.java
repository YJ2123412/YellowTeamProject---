package mybatis.controller.movie;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.controller.Controller;
import mybatis.dao.MovieDao;
import mybatis.vo.Movie;

public class MovieModifyController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MovieDao dao = MovieDao.getInstance();
		List<Movie> list = dao.selectAll();
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("modify.jsp");
		dispatcher.forward(request, response);
	}

}

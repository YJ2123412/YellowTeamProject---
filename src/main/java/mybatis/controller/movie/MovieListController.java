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

public class MovieListController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MovieDao dao = MovieDao.getInstance();
		String type = 	request.getParameter("type");
		List<Movie> list = null;

		if (type == null) {
	        list = dao.selectAll();
		} else {
			switch (type) {
			case "all": 
				list = dao.selectAll();
				break;
			case "ing": 
				list = dao.selectCurrentMovies();
				break;
			case "later": 
				list = dao.selectUpcomingMovies();
				break;
			case "end":
				list = dao.selectEndMovies();
				break;
			default:
				list = dao.selectAll();
			
			}
		}

	    request.setAttribute("list", list);

		RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
		dispatcher.forward(request, response);
	}

}

package mybatis.controller.movie;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.controller.Controller;
import mybatis.dao.MovieCommentsDao;
import mybatis.dao.MovieDao;
import mybatis.vo.Movie;
import mybatis.vo.MovieComments;

public class MovieCommentsGetController implements Controller {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MovieDao dao = MovieDao.getInstance();
		String type = request.getParameter("type");
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
				break;
			}
		}

		if (list.size() > 0) {
			MovieCommentsDao comDao = MovieCommentsDao.getInstance();
			List<MovieComments> comments = comDao.selectAll();
			list.forEach((item) -> {
				if (item.getComments() > 0) {
					Map<String, String> cl = new HashMap<String, String>();
					comments.forEach(cm -> {
						if (cm.getMcode() == item.getMcode()) {
							cl.put(cm.getWriter(), cm.getContent());
						}
					});

					item.setCommentMap(cl);
				}
			});
		}

	    request.setAttribute("list", list);

		RequestDispatcher dispatcher = request.getRequestDispatcher("comments.jsp");
		dispatcher.forward(request, response);
	}
}

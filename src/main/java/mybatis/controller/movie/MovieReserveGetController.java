package mybatis.controller.movie;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mybatis.controller.Controller;
import mybatis.dao.CinemaDao;
import mybatis.dao.MovieDao;
import mybatis.dao.ScheduleDao;
import mybatis.vo.Cinema;
import mybatis.vo.Member;
import mybatis.vo.Movie;
import mybatis.vo.Schedule;

public class MovieReserveGetController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  MovieDao dao = MovieDao.getInstance();
	      int mcode = Integer.parseInt(request.getParameter("movie_code"));	// mcode 전달
	      Movie movie = dao.selectByIdx(mcode);

	      ScheduleDao scheduleDao = ScheduleDao.getInstance();
	      Schedule schedule = scheduleDao.selectDate(mcode);

	      request.setCharacterEncoding("UTF-8");
	      HttpSession session = request.getSession();
	      String member_code = ((Member)session.getAttribute("user")).getCode();

		  CinemaDao dao2 = new CinemaDao();
		  List<Cinema> cinelist = dao2.selectAll();

		  request.setAttribute("cinelist", cinelist);
	      request.setAttribute("movie", movie);
	      request.setAttribute("member_code", member_code);
	      request.setAttribute("schedules", schedule);

		  RequestDispatcher dispatcher = request.getRequestDispatcher("reserve.jsp");
		  dispatcher.forward(request, response);
	}
}
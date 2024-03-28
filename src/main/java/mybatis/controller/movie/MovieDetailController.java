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

import lombok.extern.slf4j.Slf4j;
import mybatis.controller.Controller;
import mybatis.dao.MemberDao;
import mybatis.dao.MovieCommentsDao;
import mybatis.dao.MovieDao;
import mybatis.dao.ScheduleDao;
import mybatis.vo.Member;
import mybatis.vo.Movie;
import mybatis.vo.MovieComments;
import mybatis.vo.Schedule;

@Slf4j
public class MovieDetailController implements Controller {
	   @Override
	    public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   MovieDao movieDao = MovieDao.getInstance();
		   ScheduleDao schedule = ScheduleDao.getInstance();
		   int mcode = Integer.parseInt(request.getParameter("mcode"));

		   Movie movie = movieDao.selectByIdx(mcode);
		   int rating = movie.getRating();

		   Schedule date = schedule.selectDate(mcode);
		   String color = null;

		   if (rating == 0) {
			   color = "green";
		   } else if (rating == 12) {
			   color = "orange";
		   } else if (rating == 15) {
			   color = "blue";
		   } else if (rating == 18) {
			   color = "red";
		   } else {
			   color = "";
		   }

		   HttpSession session = request.getSession();
		   String member_code = null;
			try {
				member_code = ((Member)session.getAttribute("user")).getCode();
			    request.setAttribute("member_code", member_code);
			    MemberDao memberdao = MemberDao.getInstance();
			    int age = memberdao.getAge(member_code);
			    request.setAttribute("member_age", age);
			} catch (Exception e) {
				log.info("예외 발생: {}", e.getMessage());
			}

	       request.setAttribute("color", color);
	       request.setAttribute("movie", movie);
	       request.setAttribute("date", date);

	       MovieCommentsDao commentsDao = MovieCommentsDao.getInstance();
	       Map<String, Object> map = new HashMap<String, Object>();
	       map.put("mcode", mcode);
	       List<MovieComments> comments = commentsDao.search(map);
	       request.setAttribute("comments", comments);
	       log.info("후기 목록 : {}", comments);

	       RequestDispatcher dispatcher = request.getRequestDispatcher("showMovieDetail.jsp");
	       dispatcher.forward(request, response);
	   }
}

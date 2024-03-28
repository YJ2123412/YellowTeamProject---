package mybatis.controller.movie;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import mybatis.controller.Controller;
import mybatis.vo.Reserve;

@Slf4j
public class MovieReserveController implements Controller {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러 진입");
		request.setCharacterEncoding("UTF-8");
		    BufferedReader reader = request.getReader();
		    StringBuilder sb = new StringBuilder();
		    String line;
		    while ((line = reader.readLine()) != null) {
		        sb.append(line);
		    }
		    System.out.println("컨트롤러 line"+sb.toString());
		    ObjectMapper objMapper = new ObjectMapper();
			Reserve reserve = objMapper.readValue(sb.toString(), Reserve.class);

		/*
		 * int result=0; String member_code= request.getParameter("member_code"); String
		 * temp2=request.getParameter("cinemas"); String
		 * movie_code=request.getParameter("movie_code"); String
		 * scheduleDate=request.getParameter("schedule"); String seatsAll=
		 * request.getParameter("seatsAll"); int price = 10000;
		 * System.out.println(temp2);
		
		 * int theater = 0; if (temp2.length() != 0) { theater =
		 * Integer.parseInt(temp2); }
		 */

		String seatsAll= reserve.getSeat();
		String[] seatarr= seatsAll.split(",");
//		System.out.println("seatarr"+seatarr);
		System.out.println("seatsAll"+seatsAll);
		log.info("seatarr: {}", Arrays.toString(seatarr));
		log.info("seatsAll: {}", seatsAll);
		List<Reserve> reservearr = new ArrayList<Reserve>();

		for (String seat : seatarr) {
			reserve = new Reserve(
					   reserve.getMember_code(), 
					   reserve.getTheater(),
					   reserve.getMovie_code(),
					   reserve.getScheduleDate(),
					   seat,
					   reserve.getPrice());
			log.info("reserve!!:{}",reserve);
			System.out.println("reserve"+reserve);
			reservearr.add(reserve);
		} 

		HttpSession session = request.getSession();
		session.setAttribute("reservearr", reservearr);
		System.out.println("reservearr"+reservearr);

		

		/*
		 * if (result == 0) { response.setContentType("text/html; charset=UTF-8");
		 * response.sendRedirect("reserve"); }
		   response.sendRedirect("complete"+"?movie_code="+movie_code+"&member_code="+member_code);*/

		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("1");
	}
}


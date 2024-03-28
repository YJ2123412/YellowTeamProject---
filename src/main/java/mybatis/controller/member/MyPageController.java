package mybatis.controller.member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mybatis.controller.Controller;
import mybatis.dao.ReserveDao;
import mybatis.vo.Member;
import mybatis.vo.ReserveList;

public class MyPageController implements Controller {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String member_code = ((Member)session.getAttribute("user")).getCode();

		ReserveDao dao = ReserveDao.getInstance(); 
		List<ReserveList> list= dao.reserveAll(member_code); 
		String strNewFormatDate = null;

		if (!list.isEmpty()) {
		    for (int i = 0; i < list.size(); i++) {
		        ReserveList firstReserve = list.get(i); 
		        Date reserveDate = firstReserve.getReserve_date(); // reserve_date 속성 가져오기
		        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		        strNewFormatDate = formatter.format(reserveDate); // 포맷팅된 예약 날짜
		        firstReserve.setReserve_datef(strNewFormatDate); // 변환된 예약 날짜 설정
		    }
		}

		request.setAttribute("list", list);
		request.setAttribute("isEmpty", list.isEmpty());

        RequestDispatcher dispatcher = request.getRequestDispatcher("myPage.jsp");
        dispatcher.forward(request, response);
	}
}

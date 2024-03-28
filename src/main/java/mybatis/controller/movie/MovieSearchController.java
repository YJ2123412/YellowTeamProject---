package mybatis.controller.movie;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;
import mybatis.controller.Controller;
import mybatis.dao.MovieDao;
import mybatis.vo.Paging;

@Slf4j
public class MovieSearchController implements Controller {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.info(":::::::: 요청 ListController 처리 시작 : {} ::::::::",request.getServletPath());
		int currentPage = 1;		//현재 페이지 초기값
		//db에서 글목록 가져오기
		MovieDao dao = MovieDao.getInstance();

//		request.setAttribute("list", dao.list());
//			ㄴ 아래 페이지 만들기로 변경합니다.
		
		String page=request.getParameter("page");
		if(page != null) currentPage = Integer.parseInt(page);		//list.jsp 에 page 파라미터를 찾아보세요.
		int pageSize=8;		//pageSize 를 5 또는 20으로 변경해서 실행해 봅시다.
		int totalCount = dao.count();
		
		// 위의 값들을 이용해서 Paging 객체를 생성하면서 다른 필드값을 계산합니다.
		Paging paging = new Paging(currentPage, totalCount, pageSize);
		log.info(":::::::: ListController paging : {} ::::::::",paging);
		
		// pagelist() 메소드를 실행하기 위한 Map을 생성합니다.
		Map<String,Integer> map = new HashMap<>();
		map.put("start",paging.getStartNo());
		map.put("end",paging.getEndNo());
		
		// 메소드 실행하고 애트리뷰트 저장합니다.
		request.setAttribute("list", dao.pagelist(map));
		
		// 페이지 목록을 화면구현하기 위한 애트리뷰트를 저장합니다.
		request.setAttribute("paging", paging);
		
		// 현재날짜 애트리뷰트에 저장. 어디에 사용될까요?
		/* request.setAttribute("today", LocalDate.now()); */
		
		//요청링크가 /community/list 였고 원하는 jsp도 community 폴더에 있으므로 다음과 같음.
		RequestDispatcher dispatcher = request.getRequestDispatcher("search_list.jsp");
		dispatcher.forward(request, response);
	}
}

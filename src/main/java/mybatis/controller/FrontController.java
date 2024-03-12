package mybatis.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


//css와 js도 요청에 대한 응답으로 처리해야 하므로 web.xml 에서 리소스에 대한 처리 설정
@WebServlet(urlPatterns = {"/"})		
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);
	private RequestKeyValue key = null;		
	
	@Override
	public void init() throws ServletException {
		RequestControllerMapping.init();
		logger.info(">>>>>>> FrontController 서블릿 생성  <<<<<<<");
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {   //Get,Post 방식 둘다 처리
		String url = request.getServletPath();
		String method = request.getMethod();

		key = new RequestKeyValue(url, method);
		Controller controller = RequestControllerMapping.getController(key);
		if (url.equals("/")) {
			logger.info("::::::::::::::::::::");
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		} else if (controller != null) { 
			logger.info("::::::::::{}-{}::::::::::", key, controller.getClass());
			controller.handle(request, response);
		}
	//	else { throw new RuntimeException(); }
		// else 는 debuging 완료되면 error 페이지로 구현.
	}

	@Override
	public void destroy() {
		logger.info("::::::::::destroy -{}::::::::::",key);
	}
}

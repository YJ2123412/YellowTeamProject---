package mybatis.controller.movie;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import mybatis.controller.Controller;

public class PayRequestFailController implements Controller {

	private static final Logger logger = LoggerFactory.getLogger(PayRequestFailController.class);

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Map<String,Object> payErr = new HashMap<>();
		payErr.put("code", request.getParameter("code"));
		payErr.put("orderId", request.getParameter("orderId"));
		payErr.put("message", request.getParameter("message"));
		
		logger.info("payErr : {}",payErr);
		request.setAttribute("payErr", payErr);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("reqfail.jsp");
		dispatcher.forward(request, response);
	}

}
package mybatis.controller.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.ReserveDao;
import mybatis.vo.Payment;
import mybatis.vo.Reserve;

public class ApiPaymentSaveController implements mybatis.controller.Controller{
	private static final Logger logger = LoggerFactory.getLogger(ApiPaymentSaveController.class);
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		InputStream inputStream = request.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(inputStream , StandardCharsets.UTF_8));
		StringBuffer sb = new StringBuffer();
		String line = null;
		
		while((line = br.readLine()) != null) {
			sb.append(line);
		}
		logger.info("json : {}",sb.toString());
		logger.info("line : {}",line);
		
		ObjectMapper objMapper = new ObjectMapper();
		Payment pay = objMapper.readValue(sb.toString(), Payment.class);
		
		HttpSession session = request.getSession();
		
		ReserveDao rdao = ReserveDao.getInstance();
		List<Reserve> rList = (List<Reserve>) session.getAttribute("reservearr");
		logger.info("List<Reserve> : {}",(List<Reserve>)session.getAttribute("reservearr"));
		logger.info("pay : {}",pay);
		System.out.println("List<Reserve> : "+(List<Reserve>)session.getAttribute("reservearr"));
		System.out.println("pay : "+pay);
		int result = rdao.insertAll(rList, pay);
		
		
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(result==1) {
			out.print("결제가 완료되었습니다.");
		session.removeAttribute("reservearr");}
		else
			out.print("결제 오류가 발생했습니다.");
	}

}
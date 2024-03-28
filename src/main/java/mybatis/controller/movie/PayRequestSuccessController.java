package mybatis.controller.movie;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import mybatis.controller.Controller;
import mybatis.dao.ReserveDao;
import mybatis.vo.Member;
import mybatis.vo.ReserveList;


public class PayRequestSuccessController implements Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(PayRequestSuccessController.class);

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String orderId = request.getParameter("orderId");
		int amount = Integer.parseInt(request.getParameter("amount"));
		ReserveDao dao = ReserveDao.getInstance();

		HttpSession session = request.getSession();
		String member_code = ((Member)session.getAttribute("user")).getCode();
			
		Map<String, String> map = new HashMap<>();
		map.put("movie_code", orderId.substring(0, 5)); 
		map.put("member_code", member_code);
		List<ReserveList> reserveList = dao.reserve(map); 
		  
		List<ReserveList> paylist= dao.payment(map); 
		request.setAttribute("paylist", paylist);
		request.setAttribute("member_code", member_code);
		 
		logger.info("movie_code: {}", orderId.substring(0, 5));
		logger.info("member_code: {}", member_code);
        

        // API 엔드포인트 및 요청 데이터
        String apiUrl = "https://api.tosspayments.com/v1/payments/confirm";
        String paymentKey = request.getParameter("paymentKey");
        //amount , orderId도 필요함.
        
        // Authorization 헤더 생성
        String secretKey = "test_sk_BX7zk2yd8yqP5POE7D708x9POLqK";
        String authorizationHeader = createAuthorizationHeader(secretKey);

        // JSON 데이터 생성
        String jsonData = String.format("{\"paymentKey\":\"%s\",\"amount\":%d,\"orderId\":\"%s\",\"id\":\"%s\"}", paymentKey, amount, orderId, member_code);
        System.out.println(jsonData);
        
        // HTTP POST 요청 보내기
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        // 요청 메소드 설정
        connection.setRequestMethod("POST");

        // 헤더 설정
        connection.setRequestProperty("Authorization", authorizationHeader);
        connection.setRequestProperty("Content-Type", "application/json");

        // POST 데이터를 전송 가능하도록 설정
        connection.setDoOutput(true);

        // POST 데이터 전송
        try (DataOutputStream outputStream = new DataOutputStream(connection.getOutputStream())) {
            outputStream.writeBytes(jsonData);
            outputStream.flush();
        }

        // 응답 코드 확인
        int responseCode = connection.getResponseCode();
        if(responseCode != 200 && responseCode != 201) 
    		throw new IOException("결제 오류가 발생했습니다.");
        
        logger.info("Response Code: {}" , responseCode);
        String payment=null;
        // 응답 데이터 읽기
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
            String line;
            StringBuilder responseStr = new StringBuilder();
            while ((line = reader.readLine()) != null) {
            	responseStr.append(line);
            }
            payment=responseStr.toString();
            logger.info("Response: {}" , payment);
       }
              
        // 연결 종료
        connection.disconnect();
		request.setAttribute("payment", payment);
		request.setAttribute("reserveList", reserveList);
		request.setAttribute("paylist", paylist);
		RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
		dispatcher.forward(request, response);

	}

	
	 private static String createAuthorizationHeader(String secretKey) {
	        String credentials = secretKey + ":";
	        String encodedCredentials = Base64.getEncoder().encodeToString(credentials.getBytes(StandardCharsets.UTF_8));
	        return "Basic " + encodedCredentials;
	    }
}

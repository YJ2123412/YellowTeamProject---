package mybatis.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import mybatis.controller.Controller;
import mybatis.dao.MemberDao;

public class ApiAdminDeleteController implements Controller {
    private static final Logger logger = LoggerFactory.getLogger(ApiAdminDeleteController.class);

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MemberDao dao =  MemberDao.getInstance();
        String code = request.getParameter("code");
        logger.info("\t 입력값 code : {}", code);
        int result = 0;
        try {
            result = dao.delete(code);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String jsonData = "{\"result\" : " + result + "}";
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().print(jsonData);
    }
}
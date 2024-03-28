package mybatis.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import lombok.extern.slf4j.Slf4j;
import mybatis.SqlSessionBean;
import mybatis.vo.Cinema;
@Slf4j
public class CinemaDao {
	

	public List<Cinema> selectAll() {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<Cinema> list = sqlSession.selectList("cinemas.selectAll");
		log.info("selectAll :{}", list);
		sqlSession.close();
		return list;
	}
	
	
}

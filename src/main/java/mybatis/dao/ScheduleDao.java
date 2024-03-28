package mybatis.dao;

import java.sql.Date;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import lombok.extern.slf4j.Slf4j;
import mybatis.SqlSessionBean;
import mybatis.vo.Schedule;

@Slf4j
public class ScheduleDao {
	private static ScheduleDao dao = new ScheduleDao();
	private ScheduleDao() {};
	public static ScheduleDao getInstance() {
		return dao;
	}

	public Schedule selectDate(int mcode){
	    SqlSession sqlSession = SqlSessionBean.getSession();
	    Schedule schedule = sqlSession.selectOne("schedules.selectDate", mcode);
	    log.info("schedule 정보: {}", schedule);
	    sqlSession.close();
	    return schedule;
	}

	public Schedule checkByMcode(long mcode) {
		SqlSession sqlSession = SqlSessionBean.getSession();
	    Schedule schedule = sqlSession.selectOne("schedules.checkByMcode", mcode);
	    log.info("schedule: {}", schedule);
	    sqlSession.close();
	    return schedule;
	}

	public int insert(Map<String, Object> map) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = sqlSession.insert("schedules.insert", new Schedule(
			(long)map.get("mcode"), (int)map.get("cidx"), (Date)map.get("schedule")
		));
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
}

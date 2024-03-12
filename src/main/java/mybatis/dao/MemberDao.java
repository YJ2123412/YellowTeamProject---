package mybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import lombok.extern.slf4j.Slf4j;
import mybatis.SqlSessionBean;
import mybatis.vo.Member;

@Slf4j
public class MemberDao {
	private static MemberDao dao = new MemberDao();
	private MemberDao() {}
	public static MemberDao getInstance() {
		return dao;
	}

	public List<Member> selectAll() {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<Member> list = sqlSession.selectList("members.selectAll");
		log.info("selectAll :{}", list);
		sqlSession.close();
		return list;
	}
	
	public List<Member> selectById(String code) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<Member> list = sqlSession.selectList("members.getById", code);
		log.info("selectById :{}", list);
		sqlSession.close();
		return list;
	}
	
}

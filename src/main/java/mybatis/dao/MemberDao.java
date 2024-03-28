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

	public List<Member> selectAdmin() {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<Member> list = sqlSession.selectList("members.selectAdmin");
		log.info("selectAdmin :{}", list);
		sqlSession.close();
		return list;
	}

	public void join(Member member) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		sqlSession.insert("members.join", member);
		sqlSession.commit();
		sqlSession.close();
	}

	public void modify(Member member) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		sqlSession.update("members.modify",member);
		sqlSession.commit();
		sqlSession.close();
	}

	public Member login(Map<String, String> map) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		Member vo = sqlSession.selectOne("members.login",map);
		sqlSession.close();
		return vo;
	}

	public boolean isExistId(String id) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		Member vo = sqlSession.selectOne("members.getById", id);
		boolean result = false;
		if (vo!=null) result = true;
		return result;
	}
	
	public Member getById(String id) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		Member vo = sqlSession.selectOne("members.getById",id);
		return vo;
	}

	public void drop(String id) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		sqlSession.update("members.drop",id);
		sqlSession.commit();
		sqlSession.close();
	}

	public int delete(String code) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = 0;
		result = sqlSession.delete("members.delete", code);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public void adminJoin(Member member) {
      SqlSession sqlSession = SqlSessionBean.getSession();
      sqlSession.insert("members.adminJoin", member);
      sqlSession.commit();
      sqlSession.close();
   }

	public int getAge(String code) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int age = sqlSession.selectOne("members.getAge",code);
		sqlSession.close();
		return age;
	}
}


package mybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import lombok.extern.slf4j.Slf4j;
import mybatis.SqlSessionBean;
import mybatis.vo.MovieComments;

@Slf4j
public class MovieCommentsDao {
	private static MovieCommentsDao dao = new MovieCommentsDao();
	private MovieCommentsDao() {}
	public static MovieCommentsDao getInstance() {
		return dao;
	}

	public List<MovieComments> selectAll() {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<MovieComments> list = sqlSession.selectList("movieComments.selectAll");
		log.info("selectAll :{}", list);
		sqlSession.close();
		return list;
	}
	
	public List<MovieComments> search(Map<String, Object> map) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<MovieComments> list = sqlSession.selectList("movieComments.search", map);
		sqlSession.close();
		return list;
	}

	public int maxOf() {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = sqlSession.selectOne("movieComments.maxOf");
		sqlSession.close();
		return result;
	}

	public int insert(MovieComments vo) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = sqlSession.insert("movieComments.insert", vo);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}

	public int delete(int idx) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = sqlSession.delete("movieComments.delete", idx);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
}

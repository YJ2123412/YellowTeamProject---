package mybatis.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import lombok.extern.slf4j.Slf4j;
import mybatis.SqlSessionBean;
import mybatis.vo.Payment;
import mybatis.vo.Reserve;
import mybatis.vo.ReserveList;

@Slf4j
public class ReserveDao {
	private static ReserveDao dao =  new ReserveDao();
	private ReserveDao(){}
	public static ReserveDao getInstance() {
		return dao;
	}
	
	public int insertAll(List<Reserve> list,Payment movie) {
		log.info("list:{}",list);
		log.info("movie:{}",movie);
		
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = 0;
	     try {
	    		sqlSession.insert("reserves.insertArr",list);
	    		sqlSession.insert("reserves.saleOne",movie);
	    		sqlSession.commit();
	    		result=1;
	     }catch (Exception e) {
	    	 sqlSession.rollback();
		}
	     sqlSession.close();
	     return result;
	}
	
	public int insert(Reserve vo){
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = 0;
		result = sqlSession.insert("reserves.insert",vo);
		log.info("insert :{}", result);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	public int insertArr(List<Reserve> list){
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = 0;
		result = sqlSession.insert("reserves.insertArr",list);
		sqlSession.close();
		return result;
	}
	
	public int delete(Map<String, String> map) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = 0;
		result = sqlSession.delete("reserves.delete",map);
		sqlSession.commit();
		sqlSession.close();
		log.info("delete :{}", result);
		return result;
	}

	public List<ReserveList> reserveAll(String member_code){
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<ReserveList> list = sqlSession.selectList("reserves.reserveAll",member_code);
		log.info("reserveAll :{}", list);
		sqlSession.close();
		return list;
	}
	
	public List<ReserveList> reserve(Map<String,String> map){
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<ReserveList> list = sqlSession.selectList("reserves.reserve",map);
		log.info("reserve :{}", list);
		sqlSession.close();
		return list;
	}

	public int saleOne(Payment movie) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = 0;	
		try {
			result = sqlSession.insert("reserves.saleOne",movie);
			sqlSession.commit();
		} catch(Exception e) {
			log.warn("영화 결제 오류 : {}",e.getMessage());
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}

		return result;
	}

	public Payment getOne(String mcode) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		Payment pay = sqlSession.selectOne("reserves.getOne",mcode);
		sqlSession.close();
		return pay;
	}

	public List<ReserveList> paymentId(String id){
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<ReserveList> list = sqlSession.selectList("reserves.paymentId",id);
		log.info("reserve :{}", list);
		sqlSession.close();
		return list;
	}

	public List<ReserveList> payment(Map<String, String> map){
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<ReserveList> list = sqlSession.selectList("reserves.payment",map);
		log.info("reserve :{}", list);
		sqlSession.close();
		return list;
	}

}
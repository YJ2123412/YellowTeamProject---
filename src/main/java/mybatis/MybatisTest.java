package mybatis;

import java.util.List;

import lombok.extern.slf4j.Slf4j;
import mybatis.dao.MemberDao;
import mybatis.vo.Member;

@Slf4j
public class MybatisTest {
	public static void main(String[] args) {
		MemberDao dao = MemberDao.getInstance();
		List<Member> list = dao.selectAll();

		log.info("list 0 name : {}", list.get(0).getName());
	}
}

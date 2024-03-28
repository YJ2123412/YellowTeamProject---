package mybatis.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import mybatis.dao.MemberDao;
import mybatis.vo.Member;

public class MemberService {
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	private MemberDao dao = MemberDao.getInstance();
	
	public void join(Member member) {
		try {
			String password = encrypt(member.getPassword());
			member.setPassword(password);
			dao.join(member);
		}catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	}
	public Member login (Map<String,String> map) {
		Member result = null;
		try {
			String password = encrypt(map.get("password"));
			map.put("password",password);
			result = dao.login(map);
		}catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
	public String encrypt(String text) throws NoSuchAlgorithmException{
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(text.getBytes());
		return bytesToHex(md.digest());
	}
	private String bytesToHex(byte[] bytes) {
		StringBuilder builder = new StringBuilder();
		for (byte b : bytes) {
			builder.append(String.format("%02x", b));
			
		}
		return builder.toString();
	}
	public void adminJoin(Member member) {
	      String password;
	      try {
	         password = encrypt(member.getPassword());
	         member.setPassword(password);
	         dao.adminJoin(member);
	      } catch (NoSuchAlgorithmException e) {
	         e.printStackTrace();
	      }
	      
	   }
}

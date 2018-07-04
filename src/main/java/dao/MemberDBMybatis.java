package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.MemberDataBean;

public class MemberDBMybatis extends MybatisConnector{
private final String namespace = "member.mybatis";
	
	private static MemberDBMybatis instance = new MemberDBMybatis();
	private MemberDBMybatis() {
	}
	
	public static MemberDBMybatis getInstance() {
		return instance;
	}
	SqlSession sqlSession;
	
	//로그인
	public int login(String email,String pwd) {
		sqlSession = sqlSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		String chk = sqlSession.selectOne(namespace+".login", map);
		if(chk != null) {
			if(chk.equals(pwd)) {
				return 1;
			}else {
				return 0;
			}
		}
		sqlSession.close();
		return -1;
	}
	
	//정보 가져오기
	public MemberDataBean getMember(String email) {
		sqlSession = sqlSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		MemberDataBean member = sqlSession.selectOne(namespace+".getmember", map);
		sqlSession.close();
		return member;
		
	}
	
	//이메일 체크 (회원가입)
		public boolean emailcheck(String email) {
			sqlSession = sqlSession();
			boolean result = false;
			Map map = new HashMap();
			map.put("email", email);
			Map map2 = sqlSession.selectOne(namespace+".emailcheck", map);
			
			if(map2!=null) {
				result=true;
			}
			sqlSession.close();
			return result;
		}
	
		public void insertMember(MemberDataBean article) {
			sqlSession = sqlSession();
			int num = sqlSession.selectOne(namespace+".getNextNumber",article);
			article.setNum(num);
			sqlSession.insert(namespace+".insertMember",article);
			sqlSession.commit();
			sqlSession.close();
		}
		
		public int myPageUp(MemberDataBean member) {
			sqlSession =sqlSession();
			int chk = sqlSession.update(namespace+".myPageUp",member);
			sqlSession.commit();
			sqlSession.close();
			return chk;
		}
		
		public void deregister(int num) {
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("num", num);
			sqlSession.delete(namespace+".deregister",map);
			sqlSession.commit();
			sqlSession.close();
		}
		
		public void changePw(int num,String changePwd) {
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("num", num);
			map.put("pwd", changePwd);
			sqlSession.update(namespace+".changePw",map);
			sqlSession.commit();
			sqlSession.close();
		}
		
		public List getMembers() {
			sqlSession = sqlSession();
			List member = sqlSession.selectList(namespace+".getMembers");
			sqlSession.close();
			return member;
		}
		
		//비밀번호 찾기 > email,birthday 체크 
		public int pwCheck(String email,String birthday) {
			sqlSession = sqlSession();
			Map<String, String> map = new HashMap<String, String>();
			map.put("email", email);
			map.put("birthday", birthday);
			int chk = sqlSession.selectOne(namespace+".pwCheck", map);
			return chk;
		}
		
		public void update_pwd(String email,String pwd) {
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("pwd", pwd);
			map.put("email", email);
			sqlSession.update(namespace+".update_pwd",map);
			sqlSession.commit();
			sqlSession.close();	
		}
		
		public String getName(String email) {
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("email", email);
			String name = sqlSession.selectOne(namespace+".getName",map);
			sqlSession.close();
			return name;
		}
		
		public String getPwd(String email) {
			sqlSession = sqlSession();
			Map map = new HashMap();
			map.put("email", email);
			String pwd = sqlSession.selectOne(namespace+".getPwd",map);
			sqlSession.close();
			return pwd;
		}
}





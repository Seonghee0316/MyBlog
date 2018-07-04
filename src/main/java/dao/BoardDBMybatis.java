package dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import model.BoardDataBean;

public class BoardDBMybatis extends MybatisConnector{
private final String namespace = "board.mybatis";
	
	private static BoardDBMybatis instance = new BoardDBMybatis();
	private BoardDBMybatis() {
	}
	
	public static BoardDBMybatis getInstance() {
		return instance;
	}
	SqlSession sqlSession;
	
	public int getPostsCount(int board_num) {
		//해당 글쓴이의 해당 게시판 글의 개수를 가져온다.
		int x=0;
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("board_num", board_num);
		x = sqlSession.selectOne(namespace+".getPostsCount", map) ;	
		sqlSession.close();
		return x;
		
	}

	public int getAllPostsCount(String email) {
		//해당 글쓴이의 모든 글 수
		int x=0;
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("writer", email);
		x = sqlSession.selectOne(namespace+".getAllPostsCount", map) ;	
		sqlSession.close();
		return x;
		
	}
	
	public List getPosts(int startRow, int endRow,int board_num,String email) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		map.put("board_num",board_num);
		map.put("email",email);
		List li = sqlSession.selectList(namespace+".getPosts",map);
		sqlSession.close();
		return li;
	}
	
	public List getMainPosts(String writer,int start,int end) {
		sqlSession = sqlSession();
		Map map = new HashMap();;
		map.put("writer",writer);
		map.put("start", start);
		map.put("end", end);
		
		List li = sqlSession.selectList(namespace+".getMainPosts",map);
		sqlSession.close();
		return li;
	}
	
	public void addBoard(BoardDataBean article) {
		//게시판 추가(insert)
		sqlSession = sqlSession();
		int num = sqlSession.selectOne(namespace+".getNextNumber",article);
		article.setBoard_num(num);
		sqlSession.insert(namespace+".addBoard",article);
		sqlSession.commit();
		sqlSession.close();	
	}
	
	public List boardList(String email){
		//게시판 목록 보기
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("email",email);
		List li = sqlSession.selectList(namespace+".boardList",map);
		sqlSession.close();
		return li;
	}
	
	//count 가져옴
	public int getBoardCount(String email) {
		int x=0;
		sqlSession = sqlSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		x = sqlSession.selectOne(namespace+".getBoardCount", map) ;	
		sqlSession.close();
		return x;
	}
	
	public int updateBoard(BoardDataBean article) {
		sqlSession = sqlSession();
		int chk = sqlSession.update(namespace+".updateBoard",article);
		sqlSession.commit();
		sqlSession.close();
		return chk;
	}
	
	public int deleteBoard(int board_num) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("board_num", board_num);
		int chk = sqlSession.delete(namespace + ".deleteBoard",map);
		sqlSession.commit();
		sqlSession.close();
		return chk;
	}
	
	public String getBoard_name(int board_num) {
		String board_name;
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("board_num", board_num);
		board_name = sqlSession.selectOne(namespace+".getBoard_name", map) ;	
		sqlSession.close();
		return board_name;
	}
	
	public int insertPost(BoardDataBean article) {
		sqlSession = sqlSession();
		int num = sqlSession.selectOne(namespace+".getNextNumber2",article);
		article.setPosts_num(num);
		int chk = sqlSession.insert(namespace+".insertPost",article);
		sqlSession.commit();
		sqlSession.close();	
		return chk;
	}
	
	public BoardDataBean viewPost(int posts_num) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("posts_num", posts_num);
		BoardDataBean dbPro = sqlSession.selectOne(namespace+".viewPost",map);	//one인지 list인지?
		return dbPro;
	}
	public int updatePost(BoardDataBean article) {
		int chk;
		sqlSession = sqlSession();
		chk = sqlSession.update(namespace+".updatePost",article);
		sqlSession.commit();
		sqlSession.close();
		return chk;
		
	}
	public int deletePost(int posts_num) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("posts_num", posts_num);
		int chk = sqlSession.delete(namespace + ".deletePost",map);
		sqlSession.commit();
		sqlSession.close();
		return chk;
	}
	
	public List searchList(String search,String email,int startRow,int endRow) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("search", search);
		map.put("email", email);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List searchList = sqlSession.selectList(namespace+".searchList",map);
		sqlSession.close();
		return searchList;
	}
	
	public int searchCount(String search,String email) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("search", search);
		map.put("email", email);
		int searchCount = sqlSession.selectOne(namespace+".searchCount",map);
		sqlSession.close();
		return searchCount;
	}
}







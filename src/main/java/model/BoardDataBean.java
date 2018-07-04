package model;

public class BoardDataBean {
	//blog_board 테이블
	private int board_num;			//게시판 번호
	private String board_name;	//게시판 이름
	/*private String writer;*/
	
	//blog_posts 테이블
	private int posts_num;
	/*private int board_num;*/
	private String writer;
	private String subject;
	private String content;
	private String filename;
	private int filesize;
	private String regdate;
	private int ref;
	private int re_step;
	private int re_level;
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public int getPosts_num() {
		return posts_num;
	}
	public void setPosts_num(int posts_num) {
		this.posts_num = posts_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	
	@Override
	public String toString() {
		return "BoardDataBean [board_num=" + board_num + ", board_name=" + board_name + ", posts_num=" + posts_num
				+ ", writer=" + writer + ", subject=" + subject + ", content=" + content + ", filename=" + filename
				+ ", filesize=" + filesize + ", regdate=" + regdate + ", ref=" + ref + ", re_step=" + re_step
				+ ", re_level=" + re_level + "]";
	}	
	
}

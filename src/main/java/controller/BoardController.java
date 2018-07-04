package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.BoardDBMybatis;
import model.BoardDataBean;

@Controller
@RequestMapping("/board")
public class BoardController {
	BoardDBMybatis dbPro = BoardDBMybatis.getInstance();
	
	@RequestMapping("board1")
	public String board1(HttpServletRequest req, Model mv,HttpSession session) throws Exception{
		//페이지 처리, 게시판 목록 들어가야함. 글이 있으면 보이게 해야함.
		int pageSize = 4;
		String pageNum = req.getParameter("pageNum");
		if(pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0; //페이지 계산
		int board_num = Integer.parseInt(req.getParameter("num"));
		String email = (String) session.getAttribute("email");
	/*	System.out.println(num);*/
		/*int board_num = Integer.parseInt(req.getParameter("board_num"));*/
/*		int board_num = 87;*/
		List board1List = null;
		String board_name = dbPro.getBoard_name(board_num);
		count = dbPro.getPostsCount(board_num);
		if(count > 0) {
			board1List = dbPro.getPosts(startRow, endRow, board_num,email);
		}
		number = count - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		
		if(endPage > pageCount) endPage = pageCount;
		req.setAttribute("count", count);
		req.setAttribute("board1List", board1List);
		req.setAttribute("number", number);
		req.setAttribute("startPage", startPage);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("board_name", board_name);
		req.setAttribute("board_num", board_num);
		return "board/board1";
	}	
	
	
	@RequestMapping("mgPage")
	public String mgPage(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String email = (String) session.getAttribute("email");
		//관리 페이지 클릭시 블로그 주인의 게시판 목록이 나오게.
		int count = 0;
		List articleList = null;
		count = dbPro.getBoardCount(email);
		articleList = dbPro.boardList(email);
		model.addAttribute("articleList", articleList);
		model.addAttribute("count",count);
		return "board/mgPage";
	}
	
	@RequestMapping("addBoard")
	public String addBoard(HttpServletRequest req,BoardDataBean article,Model model) {
		HttpSession session = req.getSession();
		String board_name = req.getParameter("board_name");
		String email = (String) session.getAttribute("email");
		int count = dbPro.getBoardCount(email);
		if(count < 10) {
			article.setBoard_name(board_name);
			article.setWriter(email);
			dbPro.addBoard(article);	
		}else{
			return "redirect:mgPage";
		}
		List boardList = dbPro.boardList(email);
		session.setAttribute("boardList", boardList);
		return "redirect:mgPage";
	}
	
	@RequestMapping("updateBoard")
	public String updateBoard(HttpServletRequest req, Model model, BoardDataBean article) {
		HttpSession session = req.getSession();
		dbPro.updateBoard(article);
		String email = (String) session.getAttribute("email");
		List boardList = dbPro.boardList(email);
		session.setAttribute("boardList", boardList);
		/*return mgPage(req,model);*/ /*와우.... 밑에꺼로 대신 하면 됨.*/
		return "redirect:mgPage";
	}
	
	@RequestMapping("deleteBoard")
	public String deleteBoard(HttpServletRequest req, Model model,int board_num) {
		HttpSession session = req.getSession();
		dbPro.deleteBoard(board_num);
		String email = (String) session.getAttribute("email");
		List boardList = dbPro.boardList(email);
		session.setAttribute("boardList", boardList);
		return "redirect:mgPage";
	}
	@RequestMapping("writePost")
	public String writePost(Model model,int board_num) {
		
		model.addAttribute("board_num",board_num);
		return "page2/writePost";
	}
	
	@RequestMapping("writePostPro")
	public String writePostPro(HttpServletRequest req, Model model,BoardDataBean article) throws Exception {
		HttpSession session = req.getSession();
		dbPro.insertPost(article);
		String email = (String) session.getAttribute("email");
		List boardList = dbPro.boardList(email);
		session.setAttribute("boardList", boardList);
		model.addAttribute("num",article.getBoard_num());
		return"redirect:board1";
		
		/*return "page/main";*/
	}
	
	@RequestMapping("viewPost")
	public String viewPost(Model model,int post_num) {
		BoardDataBean article = dbPro.viewPost(post_num);
		model.addAttribute("article",article);
		return "page2/viewPost";
	}
	
	@RequestMapping("updatePost")
	public String updatePost(Model model,int posts_num) {
		BoardDataBean article = dbPro.viewPost(posts_num);
		model.addAttribute("article",article);
		return "page2/updatePost";
	}
	@RequestMapping("updatePostPro")
	public String updatePostPro(HttpServletRequest req,Model model,BoardDataBean article) {
		HttpSession session = req.getSession();
		dbPro.updatePost(article);
		String email = (String) session.getAttribute("email");
		List boardList = dbPro.boardList(email);
		session.setAttribute("boardList", boardList);
		model.addAttribute("num",article.getBoard_num());	//num이 board1로 전송됨.
		return "redirect:board1";
	}
	@RequestMapping("deletePost")
	public String deletePost(HttpServletRequest req, Model model,int board_num, int posts_num) {	
		HttpSession session = req.getSession();
		dbPro.deletePost(posts_num);
		String email = (String) session.getAttribute("email");
		List boardList = dbPro.boardList(email);
		session.setAttribute("boardList", boardList);
		model.addAttribute("num",board_num); //board_num을 여기에 써주면 return할 곳에 전달되나보다.
		return "redirect:board1";
	}
	
	
	
}





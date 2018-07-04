package controller;

import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.BoardDBMybatis;
import model.BoardDataBean;



@Controller
@RequestMapping("/page")
public class PageController {
	BoardDBMybatis dbPro2 = BoardDBMybatis.getInstance();
	@RequestMapping("/main")
	public String main(Model mv, HttpServletRequest req) throws Throwable {
		int count = 0;
		List mainList = null;
		HttpSession session = req.getSession();
		String email = (String) session.getAttribute("email");
		count = dbPro2.getAllPostsCount(email);
		int start = 1;
		int end = 4;
		/*if(count > 0) {*/
			mainList = dbPro2.getMainPosts(email,start,end);
			mv.addAttribute("mainList",mainList);
			mv.addAttribute("count",count);
			
		/*mv.addAttribute("mainList",req.getParameter("mainList"));
		System.out.println(req.getParameter("mainList"));
		mv.addAttribute("count",req.getParameter("count"));*/
			List boardList = dbPro2.boardList(email);
			session.setAttribute("boardList", boardList);
			mv.addAttribute("boardList",boardList);
		return "page/main";
	}
	
	//검색 페이지
	@RequestMapping("/searchPage")
	public String searchPage(HttpServletRequest req,Model model,String search) {
		int pageSize = 4;
		String pageNum = req.getParameter("pageNum");
		if(pageNum == null || pageNum == "") {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		//search변수를 넣어 검색 결과 list를 갖고 온다.
		HttpSession session =  req.getSession();
		String email = (String) session.getAttribute("email");
		List searchList = null;
		int searchCount = dbPro2.searchCount(search,email);
		if(searchCount > 0) {
			searchList = dbPro2.searchList(search,email,startRow, endRow);
		}
		int number = 0; //페이지 계산
		number = searchCount - (currentPage - 1) * pageSize;
		int bottomLine = 3;
		int pageCount = searchCount / pageSize + (searchCount % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		
		model.addAttribute("search",search);
		model.addAttribute("searchList",searchList);
		model.addAttribute("searchCount",searchCount);		
		req.setAttribute("number", number);
		req.setAttribute("startPage", startPage);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("endPage", endPage);
		
		return "page/searchPage";
	}
	
	@RequestMapping("/mainImage")
	public String mainImage(Model mv, HttpServletRequest req) throws Throwable {
		List mainList = null;
		List imgMainList = new ArrayList();
		HttpSession session = req.getSession();
		String email = (String) session.getAttribute("email");
		int start = 1;
		int end = 10;
		int postcount = dbPro2.getAllPostsCount(email);
		
		// 10개의 글을 받아오는거야
		// 받아온 글에서 	boolean isIMG = bean.getContent().contains("<img");
		// 이게 true면 카운트를 1 증가(4까지 증가해야함)
		
		// 만약 카운트가 4 미만이면 다시 10개 글 받아서 반복
		
		// 4개가 채워지면 리스트로 반환
		for(int count = 0; count < 4;) {
			//갖고 오는 리스트  처음 start =1 end = 10 이다.
			mainList = dbPro2.getMainPosts(email,start,end);
		
			//list 수 만큼 for문을 돌린다.
			for(int i = 0; i < mainList.size(); i++) {
				//count가 4보다 크면 break
				if(count == 4) {
					break; }
				
				BoardDataBean bean = (BoardDataBean)mainList.get(i);
				boolean isIMG = bean.getContent().contains("<img");
				
				//사진이 있으면 count를 1 증가한다.
				if(isIMG == true) {
					count += 1;
					imgMainList.add(bean);
				}
			}
			
			//end 수가 전체 글 개수보다 많으면 안되니까 그 전까지 돌린다. 리스트 갖고오는 개수가 한번에 4개니까 1~4 / 5~8 / 이런식으로 증가 시켜준다.
			if(end < postcount) {
			start = end + 1;
			end = end + 10;

			//end수가 전체글개수 보다 많아지면 break 한다. 만약 글이 100개인데 그 중 사진이 4개도 없다면 100개 다돌고 멈춰야하기때문.
			}else {
				break;
			}	
		}
		mv.addAttribute("postcount",postcount);
		mv.addAttribute("imgMainList",imgMainList);
		return "page/mainImage";
	}
	
	
	@RequestMapping("/logoutPro")
	public String logoutPro(HttpSession session,HttpServletResponse res,HttpServletRequest req)throws Exception {
		//세션아이디가 널값이 아닐때만 로그아웃.
		if(session.getAttribute("email") != null){
			session.invalidate();	//세션 끊기
		}
		res.sendRedirect(req.getContextPath() + "/member/login"); 
	       return null;
	}
}



/*//로그아웃
		@RequestMapping("/logout")
		public ModelAndView logout(HttpSession session) {
			//세션아이디가 널값이 아닐때만 로그아웃.
			if(session.getAttribute("id") != null){
				session.invalidate();	//세션 끊기
			}
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/index");
			return mav; 
		}*/
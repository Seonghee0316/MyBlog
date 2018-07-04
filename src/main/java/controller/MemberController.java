package controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dao.BoardDBMybatis;
import dao.MemberDBMybatis;
import model.MemberDataBean;


@Controller
@RequestMapping("/member")
public class MemberController {
	MemberDBMybatis dbPro = MemberDBMybatis.getInstance();
	BoardDBMybatis dbPro2 = BoardDBMybatis.getInstance();
	
	@RequestMapping("login")
	public String login(HttpServletRequest req,HttpServletResponse res)throws Exception{
		/*int num = 0;
		if (req.getParameter("num") != null) {
			num = Integer.parseInt(req.getParameter("num"));
		}
		req.setAttribute("num", num);*/
		return "login/login";
	}
	
	@RequestMapping("managerPage")
	public String managerPage(HttpServletRequest req,Model model) {
		List memberList = dbPro.getMembers();
		model.addAttribute("memberList",memberList);
		return "page2/managerPage";
	}
	
	
	@RequestMapping("loginPro")
	public String loginPro(HttpServletRequest req,HttpServletResponse res,Model model)throws Exception {
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		List boardList = null;
		int pwcheck = dbPro.login(email, pwd);
		if(pwcheck == 1) {
			MemberDataBean member = dbPro.getMember(email);
			boardList = dbPro2.boardList(email);
			HttpSession session = req.getSession();
			session.setAttribute("email", email);
			session.setAttribute("name", member.getName());
			session.setAttribute("profile", member.getProfile());
			session.setAttribute("boardList", boardList);
			if(member.getEmail().equals("admin@myblog.com")) {
				return "redirect:/member/managerPage";
			}
			res.sendRedirect(req.getContextPath() + "/page/main");
			/*return "/page/main";*/
		}else {
			req.setAttribute("pwcheck", pwcheck);
			return "login/loginPro";
		}
		return "/page/main";
	}
	
	@RequestMapping("joinPro")
	public String joinPro(MultipartHttpServletRequest request, HttpServletResponse response, 
			MemberDataBean article, Model model) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MultipartFile multi = request.getFile("profileimage");
		
		String filename = multi.getOriginalFilename();
		
		//profile image
		if(filename != null && !filename.equals("")) {
			String uploadPath = request.getRealPath("/")+"fileSave";
			FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(uploadPath+"/"+multi.getOriginalFilename()));
			article.setProfile(filename);
			//article.setFilesize((int) multi.getSize()); 
			}else {
				article.setProfile("");
				//article.setFilesize(0); 
			}
		
			dbPro.insertMember(article);
		//return "member/adminpage";
		
		//메세지 창
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");
		response.setHeader("Content-Type", "text/html;charset=EUC-KR");
		String msg = "가입이 완료 되었습니다.";
		PrintWriter out = response.getWriter();
		 
		out.println("<script>alert('"+msg+"'); location.href='/MyBlog/member/login';</script>");
		out.flush(); 
		out.close();
		
		return null;
	}
	
	//이메일 중복확인
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public @ResponseBody boolean emailCheck(@RequestParam("email") String email) {
		boolean result = false;
		result=dbPro.emailcheck(email);
		return result;
	}
	
	@RequestMapping("myPage")
	public String myPage(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		String email = (String) session.getAttribute("email");
		MemberDataBean member = dbPro.getMember(email);
		model.addAttribute("li",member);
		return "member/myPage";
	}
	
	@RequestMapping("myPageUp")
	public String myPageUp(MemberDataBean member,MultipartHttpServletRequest request,HttpServletResponse response,String profile) throws FileNotFoundException, IOException {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		
		MultipartFile multi = request.getFile("profileimage");
		
		String filename = multi.getOriginalFilename();
		
		//profile image
		if(filename != null && !filename.equals("")) {
			String uploadPath = request.getRealPath("/")+"fileSave";
			FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(uploadPath+"/"+multi.getOriginalFilename()));
			member.setProfile(filename);
			//article.setFilesize((int) multi.getSize()); 
			}else {
				member.setProfile(profile);
				//article.setFilesize(0); 
			}		
			dbPro.myPageUp(member);
		//메세지 창
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Content-Type", "text/html;charset=UTF-8");
		String msg = "수정 되었습니다.";
		PrintWriter out = response.getWriter();

		session.setAttribute("profile", member.getProfile());
		session.setAttribute("name", member.getName());
		out.println("<script>alert('"+msg+"'); location.href='/MyBlog/member/myPage';</script>");
		out.flush(); 
		out.close();
		
		return null;
	/*	return"redirect:myPage";*/
	}
	
	//회원 탈퇴
	@RequestMapping("deregister")
	public String deregister(HttpServletRequest request,HttpServletResponse response,int num) throws IOException {
		dbPro.deregister(num);
		//메세지 창
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Content-Type", "text/html;charset=UTF-8");
		String msg = "탈퇴 되었습니다. 그동안  Myblog를 이용해주셔서 감사합니다.";
		PrintWriter out = response.getWriter();
		out.println("<script>alert('"+msg+"'); location.href='/MyBlog/page/logoutPro';</script>");
		out.flush(); 
		out.close();
		return null;
	}

	@RequestMapping("changePw")
	public String changePw(HttpServletRequest request,HttpServletResponse response,int num,String changePwd)throws IOException {
		dbPro.changePw(num,changePwd);
		//메세지 창
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Content-Type", "text/html;charset=UTF-8");
		String msg = "변경된 비밀번호로 로그인 해주세요!";
		PrintWriter out = response.getWriter();
		out.println("<script>alert('"+msg+"'); location.href='/MyBlog/page/logoutPro';</script>");
		out.flush(); 
		out.close();
		return null;
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	public @ResponseBody int find_pw(@RequestParam("email")String email,@RequestParam("birthday")String birthday,HttpServletResponse res) throws Exception {
		
		int check = dbPro.pwCheck(email, birthday);
		if(check == 0) {
			System.out.println("check=0");
			/*String result = "해당 회원이 존재하지 않습니다.";*/
			return check;
		}else {
			// 임시 비밀번호 생성
						String pwd = "";
						for (int i = 0; i < 12; i++) {
							pwd += (char) ((Math.random() * 26) + 97);
						}
						// 비밀번호 변경
						dbPro.update_pwd(email,pwd);
						// 비밀번호 변경 메일 발송
						send_mail(email, "find_pw");
						
						/*String result="이메일로 임시 비밀번호를 발송하였습니다.";*/
						
					return check;
		}
	}	
	
	// 이메일 발송
	public void send_mail(String email, String div) throws Exception {
		
		// 메일 발송용 프로퍼티 설정
		// 수정할 필요 없습니다.
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		// 자신의 gmail / password
		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					// 
					return new PasswordAuthentication("email","pwd");
				}
			});

		try {

			Message message = new MimeMessage(session);
			
			// 발송하는 이메일 주소를 등록합니다.
			// 인증을 받은 메일 계정이어야 합니다.
			message.setFrom(new InternetAddress("email"));
			
			// 받는 사람 E-Mail 주소
			String mail = email;
			// 받는 사람 이메일을 등록합니다.
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(mail));
			
			
			// 메일 제목을 등록합니다.
			message.setSubject("Myblog 임시 비밀번호 입니다.");
			
			// 메일 내용을 등록합니다.
			message.setText(dbPro.getName(email) + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요."
					+"\n 임시 비밀번호 : " + dbPro.getPwd(email));

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
}







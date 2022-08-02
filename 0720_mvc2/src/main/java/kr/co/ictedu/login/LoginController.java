package kr.co.ictedu.login;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.util.dto.MemberDTO;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private LoginService service;
	
	@RequestMapping ( value = "/logout", method = RequestMethod.GET)
	public String logout( HttpSession session ) {
		session.invalidate(); //세션 아웃 처리
		return "home";//jsp file name
	}//logout
	
	@RequestMapping ( value = "/login", method = RequestMethod.POST)
	public void login( MemberDTO dto, PrintWriter out, HttpSession session ) {//mid와 mpwd 두 개 인자를 받아오기 위한 dto 생성
		
		MemberDTO dtoFromDB = null;  //dto = 정보를 넘길 dto, dtoFromDB = 정보를 받아오는 dto (로그인 하면 아이디, 이메일 정보 등 가져옴) 
		dtoFromDB = service.login( dto );
		if ( dtoFromDB == null ) {
			out.print(0);//아이디 없는 사용자 또는 패스워드 오류 사용자.
		} else if( dtoFromDB != null && dtoFromDB.getMno() != null && dtoFromDB.getMno() != "") { 
			out.print(1);//아이디, 패스워드 모두 OK
			session.setAttribute("login_info", dtoFromDB); //세션에 로그인한 사용자 정보 저장
		}
		out.close();
		
	}//login
	
	@RequestMapping ( value = "/login_form", method = RequestMethod.GET)
	public String loginForm() {
		return "/login/login_form"; //jsp file name
	}//loginForm
	
}

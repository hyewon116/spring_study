package kr.co.ictedu.join;

import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.util.dto.MemberDTO;

@Controller
@RequestMapping ( value = "/join" )
public class JoinController {
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	@Autowired
	private JoinService service;
	
	@RequestMapping ( value = "/", method = RequestMethod.POST )
	private void join( MemberDTO dto, PrintWriter out ) {
		int successCount = 0;
		successCount = service.join( dto );
		out.print(successCount);
		out.close();
	}//join
	
	@RequestMapping ( value = "/id_chk", method = RequestMethod.GET ) 
	public void idCheck( String mid, PrintWriter out ) {//가입하려는 아이디가 이미 존재하는지 체크
		int isYN = 0;
		isYN = service.idCheck( mid );
		out.print(isYN);
		out.close();
	}//idCheck
	
	@RequestMapping ( value = "/form", method = RequestMethod.GET )
	public String joinForm() {
		
		return "/join/join_form"; //jsp file name
	}//joinForm
	
}//class

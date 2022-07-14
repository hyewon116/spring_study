package kr.co.ictedu;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger; //logger - 3번 째 걸로 import 
import org.slf4j.LoggerFactory; //import 주의
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller //Controller 반드시 import
public class EL1Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(EL1Controller.class);
	
	@RequestMapping( value = "/el3", method = RequestMethod.GET ) 
	public String day1El3( Model model, ArrayList<String> list
				, HashMap<String, String> map ) {
		
		map.put("반장", "홍길동"); map.put("부반장", "고길동"); map.put("부장", "둘리");
		model.addAttribute("mymap", map);
		
		list.add("hi"); list.add("hello"); list.add("how are you");
		model.addAttribute("mylist", list);
	
		return "day1el3"; //jsp 파일 이름
	}//day1El3
	
	@RequestMapping ( value = "/el2", method = RequestMethod.GET) //@RequestMapping의 value 값이 같은 값이 있는 경우, 서버가 켜지지 않는다.
	public String day1El2( Model model, FreeBoardDTO dto
			, HttpServletRequest request, HttpSession session ) {//필요한 객체들 import
	
		request.setAttribute("messageFromRequest", "이것은 리퀘스트를 통해 전달된 메시지입니다.");	
		
		session.setAttribute("messageFromSession", "이것은 세션을 통해 전달된 메시지입니다.");
		
		dto.setBno("111"); dto.setBtitle("노인과 바다"); dto.setBwriter("헤밍웨이");
		dto.setBcnts("sad ending"); dto.setBdate("1945-08-15");
		model.addAttribute("free_board_dto", dto);
		
		return "day1el2"; //jsp 파일 이름
	}
	
	@RequestMapping( value = "/el1", method = RequestMethod.GET )
	public String day1El1() { //return type = string -> jsp 파일 이름이니까.
		return "day1el1"; //jsp 파일 이름
	}
	
}//class

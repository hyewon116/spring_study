package kr.co.ictedu;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class); //logger 세팅은 필수!!
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, TestObj to) { //메소드 이름은 아무거나 가능!!
		logger.info("Welcome home! The client locale is {}.", locale);
		logger.info("시스아웃은 이제 안녕!");
		to.print(); //TestObj를 new로 불러오지 않아도 사용 가능.
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		//model.addAttribute("이름 오는 자리", "넣고 싶은 data가 오는 자리");
		model.addAttribute("yourName", "박 혜 원");
		
		return "home"; //jsp 파일 이름 -> home.jsp 실행 
	}//testhometest
}//class











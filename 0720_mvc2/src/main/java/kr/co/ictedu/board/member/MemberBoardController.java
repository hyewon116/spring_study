package kr.co.ictedu.board.member;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.SearchDTO;

@Controller
@RequestMapping( value = "/board/member" )
public class MemberBoardController {

	private final static Logger logger = LoggerFactory.getLogger(MemberBoardController.class);
	
	@Autowired
	private MemberBoardService service;
	
	@RequestMapping ( value="/update", method = RequestMethod.POST )
	public void update( MemberBoardDTO dto, HttpSession session, PrintWriter out ) {
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setMno( mDto.getMno() );
		
		int successCount = 0;
		successCount = service.update(dto);
		out.print(successCount);
		out.close();
	}//update
	
	@RequestMapping ( value = "/update_form", method = RequestMethod.GET)
	public String updateForm( String board_no, Model model ) { //해당 게시글 번호 받아옴 (특정 게시글을 수정하는 거니까)
		MemberBoardDTO dto = null;
		dto = service.detail(board_no);
		model.addAttribute("detail_dto", dto);
		
		return "/board/member/update_form"; //jsp file name 
	}//updateForm
	
	@RequestMapping ( value = "/delete", method = RequestMethod.GET) 
	public void delete( MemberBoardDTO dto, HttpSession session, PrintWriter out ) {
		
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info"); //로그인 정보 전달
		dto.setMno(mDto.getMno()); 
		
		int successCount = 0;
		successCount = service.delete( dto );
		out.print(successCount);
		out.close();
	}//delete
			
	@RequestMapping ( value = "/detail", method = RequestMethod.GET) //get = 주소를 직접 지정하는 방식
	public String detail( String board_no, Model model ) {
		MemberBoardDTO dto = service.detail(board_no); 
		
		logger.info(dto.toString()); 
		model.addAttribute("detail_dto", dto); 
		return "/board/member/detail";
	}
	
	@RequestMapping ( value = "/write_form", method = RequestMethod.GET )
	public String writeForm() {
		return "/board/member/write_form";//jsp file name
	}//writeForm
	
	@RequestMapping ( value = "/write", method = RequestMethod.POST )
	public void write ( MemberBoardDTO dto, HttpSession session, PrintWriter out ) {
		//logger.info(dto.toString());
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setMno( mDto.getMno() );
		
		int successCount = 0;
		successCount = service.write(dto);
		out.print(successCount);
		out.close();
	}
	
	@RequestMapping ( value = "/list", method = RequestMethod.GET )
	public String list( SearchDTO dto, String userWantPage, Model model ) {
		if(userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchListCount( dto ); 
		
		if( totalCount > 10 ) {
			lastPageNum = ( totalCount / 10 ) + ( totalCount % 10 > 0 ? 1 : 0 );
		}
		
		if( userWantPage.length() >= 2 ) {//페이지 넘버(userwantpage)가 2자릿수 이상인 경우 ex.125 클릭 기준  
			String frontNum = userWantPage.substring(0, userWantPage.length()-1); //125 -> 12
			startPageNum = Integer.parseInt(frontNum) * 10 + 1; //12*10+1 = 121
			endPageNum = (Integer.parseInt(frontNum) + 1) * 10; //12+1*10 = 130
			
			String backNum = userWantPage.substring(userWantPage.length()-1, userWantPage.length());
			if (backNum.contentEquals("0")) { //끝자리가 0일 경우 (ex.120)
				startPageNum = startPageNum - 10; //121-10 = 111
				endPageNum = endPageNum - 10; //130-10 = 120
			}//if
		}//if
		if(endPageNum > lastPageNum) endPageNum = lastPageNum;//총 페이지가 13인데 20페이지까지 나오는 거 방지
		
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("userWantPage", userWantPage);
		model.addAttribute("lastPageNum", lastPageNum);
		
		dto.setLimitNum( (Integer.parseInt(userWantPage) -1) * 10 );//sql의 limit 함수 첫번째 자리에 넣을 값. ex. 11페이지의 첫번쨰 게시글 순서
		List<MemberBoardDTO> list = null;
		list = service.searchList( dto );//SearchDTO
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);
	
		return "/board/member/list"; //jsp file name
	}//list
	
}//class

/*
create table memberboard (
  board_no int primary key auto_increment
, title varchar(150)
, mno int
, contents varchar(1500)
, view_cnt int
, write_date datetime
); 
*/
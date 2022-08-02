package kr.co.ictedu.board.free;

import java.io.PrintWriter;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.util.dto.SearchDTO;

@Controller
@RequestMapping ( value = "/board/free")
public class FreeBoardController {

		private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
		
		@Autowired
		private FreeBoardService service;
		
		/*
		 * 핵심 메소드 목록 : final_list, update, updateForm, delete, detail, write, writeForm
		 * 나머지는 연습용 : search1, search1Test, pagingList, list3, list2, list
		 */
		
		@RequestMapping (value = "/final_list", method = RequestMethod.GET)
		private String finalList( SearchDTO dto, String userWantPage, Model model ) {
			if(userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
			
			int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
			totalCount = service.searchListCount( dto ); //조회 조건에 따라 count를 가져오는 객체 //이전의 totalListCount는 그냥 freeboard의 모든 결과를 가져왔었음.
			
			if( totalCount > 10 ) {
				lastPageNum = ( totalCount / 10 ) + ( totalCount % 10 > 0 ? 1 : 0 );
			}
			
			if( userWantPage.length() >= 2 ) {//페이지 넘버(userwantpage)가 2자릿수 이상인 경우 ex.125 클릭 기준  
				String frontNum = userWantPage.substring(0, userWantPage.length()-1); //125 -> 12
				startPageNum = Integer.parseInt(frontNum) * 10 + 1; //12*10+1 = 121
				endPageNum = (Integer.parseInt(frontNum) + 1) * 10; //12+1*10 = 130
				
				String backNum = userWantPage.substring(userWantPage.length()-1, userWantPage.length());
				if (backNum.contentEquals("0")) { //120클릭하면 121~130으로 넘어가는 거 방지
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
			List<FreeBoardDTO> list = null;
			list = service.searchList( dto );//SearchDTO
			model.addAttribute("list", list);
			model.addAttribute("search_dto", dto);
			
			return "/board/free/list5";//jsp file name
		}//finalList

		@RequestMapping (value = "/search1_test", method = RequestMethod.GET)
		public String search1Test( SearchDTO dto, Model model ) {
			List<FreeBoardDTO> list = null;
			list = service.search1Test( dto );
			logger.info(list.toString());
			model.addAttribute("list", list);
			model.addAttribute("search_dto", dto);
			return "/board/free/search1";//jsp file name
		}//search1Test
		
		@RequestMapping (value = "/search1", method = RequestMethod.GET)
		public String search1() {
			return "/board/free/search1";//jsp file name
		}//search1
		
		@RequestMapping ( value = "/list4", method = RequestMethod.GET )
		private String pagingList ( Model model, String userWantPage ) {
			if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
			int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
			totalCount = service.totalListCount();
			
			if( totalCount > 10 ) {
				lastPageNum = ( totalCount / 10 ) + ( totalCount % 10 > 0 ? 1 : 0 ); //10으로 나눈 후 나머지가 있다면 1, 아니면 0을 더해라.
			}
			//페이징 일반 요소 끝
			
			//페이지 롤링
			//userWantPage가 10보다 작거나 같으면, 화면에 보이는 페이지는 1 2 3 4 5 6 7 8 9 10
			//userWantPage가 12인 경우, 아래쪽에 보이는 페이지 숫자는 11 12 13 14 15 16 17 18 19 20
			//userWantPage가 27인 경우, 아래쪽에 보이는 페이지 숫자는 21 22 23 24 25 26 27 28 29 30
			if(userWantPage.length() >= 2) { //userWantPage가 10보다 큰 경우 (=두자릿수)
				String frontNum = userWantPage.substring(0, userWantPage.length()-1); //ex.15->5 잘리고 1만 남음, 26->6잘리고 2만 남음, 125->12
				startPageNum = Integer.parseInt(frontNum) * 10 + 1; // ex. 1*10+1 = 11, 2*10+1 = 21
				endPageNum = (Integer.parseInt(frontNum) + 1) * 10; // ex. (1+1)*10 = 20, (2+1)* 10 = 30 
				
				String backNum = userWantPage.substring(userWantPage.length()-1, userWantPage.length()); //10 누를때 11로 넘어가는 거 방지
				if(backNum.equals("0")) {
					startPageNum = startPageNum - 10;
					endPageNum = endPageNum -10;
				}
			}
			
			if(endPageNum > lastPageNum) {
				endPageNum = lastPageNum;
			}
			
			model.addAttribute("startPageNum", startPageNum);
			model.addAttribute("endPageNum", endPageNum);
			model.addAttribute("userWantPage", userWantPage);
			model.addAttribute("lastPageNum", lastPageNum);
			
			int limitNum = ( Integer.parseInt(userWantPage) -1 ) * 10;
			List<FreeBoardDTO> list = null;
			list = service.pagingList(limitNum);
			model.addAttribute("list", list);
			//logger.info(list.toString());
			
			return "/board/free/list4";//jsp file name
		}
		
		@RequestMapping ( value = "/list3", method = RequestMethod.GET )
		public String list3( Model model, String userWantPage ) {
			if ( userWantPage == null || userWantPage.equals("") ) userWantPage = "1"; //아무것도 클릭 안해도 1페이지가 클릭되어 있도록 설정
			
			int totalCount = 0;
			totalCount = service.totalListCount();
			int startPageNum = 1;
			int endPageNum = 1;
			if(totalCount > 10) { 
				endPageNum = ( totalCount / 10 ) + ( totalCount % 10 > 0 ? 1 : 0 );
			}
			
			model.addAttribute("startPageNum", startPageNum);
			model.addAttribute("endPageNum", endPageNum);
			model.addAttribute("userWantPage", userWantPage);
			
			return "/board/free/list3"; //jsp file name
		}
		
		@RequestMapping ( value = "/list2", method = RequestMethod.GET )
		public String list2( Model model ) {//목록 아래쪽의 페이징 정보만 리스팅해보자.
			//한 페이지에 10건을 보여줄 때  : 한 페이지에 보여주는 게시물의 총 건수
			//페이지 총 건수 - 예) 128건  
			//리스팅 건수 - (128 / 10) + (128 % 10 > 0 ? 1 : 0) == 13 
			int totalCount = 0; 
			totalCount = service.totalListCount(); //페이지 총 건수 
			
			int startPageNum = 1;
			int endPageNum = 1; 
			if(totalCount > 10) { //한 페이지당 10건씩 했을때 나오는 페이지 수 
				endPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);				
			}
			
			model.addAttribute("startPageNum", startPageNum);
			model.addAttribute("endPageNum", endPageNum);

			return "/board/free/list2"; //jsp file name
		}//list2
		
		@RequestMapping (value = "/list", method = RequestMethod.GET)
		public String list(Model model) {
			//dbms에서 게시판 전체를 select : FreeBoardService.list() -> FreeBoardDAO.list() 
			// -> freeboard-mapper.xml(namespace:FreeBoardMapper.list) 
			List<FreeBoardDTO> list = null;
			list = service.list();
			
			model.addAttribute("list",list);
			return "/board/free/list"; //list.jsp (view name) 호출
		}//list
		
		@RequestMapping ( value="/update", method = RequestMethod.POST)
		public void update( FreeBoardDTO dto, PrintWriter out ) {
			//dbms에 게시글을  update : FreeBoardService.update(dto) -> FreeBoardDAO.update(dto) 
			// -> freeboard-mapper.xml(namespace:FreeBoardMapper.update)
			int successCount = 0;
			successCount = service.update(dto);
			out.print(successCount);
			out.close();
		}//update
		
		@RequestMapping ( value = "/update_form", method = RequestMethod.GET)
		public String updateForm( String board_no, Model model ) { //해당 게시글 번호 받아옴 (특정 게시글을 수정하는 거니까)
			FreeBoardDTO dto = null;
			dto = service.detail(board_no);
			model.addAttribute("detail_dto", dto);
			
			return "/board/free/update_form"; //jsp file name 
		}//updateForm
		
		@RequestMapping ( value = "/delete", method = RequestMethod.GET) //get = 주소를 직접 지정하는 방식
		public void delete( FreeBoardDTO dto, PrintWriter out ) { //no & pwd = 값이 두 개이므로 DTO로 받아옴. (mapper가 값을 두개 못 받음)
			//dbms에서 게시글 하나를 delete : FreeBoardService.delete(board_no) -> FreeBoardDAO.delete(board_no) 
			// -> freeboard-mapper.xml(namespace:FreeBoardMapper.delete) 
			int successCount = 0;
			successCount = service.delete( dto );
			out.print(successCount);
			out.close();
		}
				
		@RequestMapping ( value = "/detail", method = RequestMethod.GET) //get = 주소를 직접 지정하는 방식
		public String detail( String board_no, Model model ) {
			//dbms에서 게시글 하나를 select : FreeBoardService.detail(board_no) -> FreeBoardDAO.detail(board_no) 
			// -> freeboard-mapper.xml(namespace:FreeBoardMapper.detail) 
			FreeBoardDTO dto = service.detail(board_no); //글 한 개 정보를 dto에 담을 거임. 
			
			logger.info(dto.toString()); // 콘솔창에 확인용 (중요한거 x)
			model.addAttribute("detail_dto", dto); //dto를 model에 담을 거임.
			return "/board/free/detail";//jsp file name
		}
		
		@RequestMapping ( value = "/write", method = RequestMethod.POST ) //-> /board/free는 상위 request mapping에 이미 있음!!
		public void write( FreeBoardDTO dto, PrintWriter out ) {
			//dbms에 게시글을  insert : FreeBoardService.write(dto) -> FreeBoardDAO.write(dto) 
			// -> freeboard-mapper.xml(namespace:FreeBoardMapper.write)
			int successCount = 0;
			successCount = service.write(dto);
			out.print(successCount);
			out.close();
		}//write
		
		@RequestMapping ( value = "/write_form", method = RequestMethod.GET)
		public String writeForm() {
			return "/board/free/write_form";//jsp 파일 이름
		}//writeForm
}

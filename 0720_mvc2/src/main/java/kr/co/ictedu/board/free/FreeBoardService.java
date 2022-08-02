package kr.co.ictedu.board.free;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.SearchDTO;

@Service
public class FreeBoardService {

	@Autowired
	private FreeBoardDAO dao;
	
	/*
	 * 핵심 메소드 목록 : searchList, searchListCount, update, delete, detail, write 
	 * 나머지는 연습용 : search1Test, pagingList, totalListCount, list
	 */
	
	public List<FreeBoardDTO> searchList( SearchDTO dto ) {
		List<FreeBoardDTO> list = null;
		list = dao.searchList( dto );
		return list;
	}//searchList
	
	public int searchListCount( SearchDTO dto ) { //count 값을 가져오니까 int 
		int totalCount = 0;
		totalCount = dao.searchListCount ( dto );
		return totalCount;
	}//searchListCount
	
	public List<FreeBoardDTO> search1Test ( SearchDTO dto ) {
		List<FreeBoardDTO> list = null;
		list = dao.search1Test( dto );
		return list;
	}//search1Tes
	
	public List<FreeBoardDTO> pagingList( int limitNum ) {
		List<FreeBoardDTO> list = null;
		list = dao.pagingList(limitNum);
		return list;
	}//pagingList
	
	public int totalListCount() {
		int totalCount = 0;
		totalCount = dao.totalListCount();
		return totalCount;
	}//totalListCount
	
	public int update( FreeBoardDTO dto ) {
		int successCount = 0;
		successCount = dao.update(dto);
		return successCount;
	}//update
	
	public int delete( FreeBoardDTO dto ) {
		int successCount = 0;
		successCount = dao.delete(dto);
		return successCount;
	}//delete
	
	public FreeBoardDTO detail( String board_no ) { //결과값이 글 한개에 대한 정보이므로 String 아니고 dto로 리턴되게.
		dao.incrementViewCnt(board_no);
		FreeBoardDTO dto = null;
		dto = dao.detail(board_no);
		return dto;
	}//detail
	
	public int write( FreeBoardDTO dto ) {
		int successCount = 0;
		successCount = dao.write(dto);
		return successCount;
	}//write
	
	public List<FreeBoardDTO> list() {
		
		List<FreeBoardDTO> list = null; //dao에서 list 타입으로 데이터 가져올 거니 list 선언.
		list = dao.list();
		
		return list;
	}//lis
}

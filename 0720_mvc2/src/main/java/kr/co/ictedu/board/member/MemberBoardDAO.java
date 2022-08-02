package kr.co.ictedu.board.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.SearchDTO;

@Repository
public class MemberBoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int update( MemberBoardDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("MemberBoardMapper.update", dto);
		return successCount;
	}
	
	public int delete( MemberBoardDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.delete("MemberBoardMapper.delete", dto);
		return successCount;
	}//delete
	
	public MemberBoardDTO detail( String board_no ) {
		MemberBoardDTO dto = null;
		dto = sqlSession.selectOne("MemberBoardMapper.detail", board_no); //board_no를 가지고 mapper의 select 작업 수행하라.
		return dto;
	}//detail
	
	public void incrementViewCnt( String board_no ) {
		sqlSession.update("MemberBoardMapper.incrementViewCnt", board_no);//조회수 
	}//incrementViewCnt
	
	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("MemberBoardMapper.searchListCount", dto);//dto를 가지고 mapper의 select 작업 수행하라.
		return totalCount;
	}//searchListCount
	
	public List<MemberBoardDTO> searchList( SearchDTO dto ) {
		List<MemberBoardDTO> list = null;
		list = sqlSession.selectList("MemberBoardMapper.searchList", dto);
		return list;
	}//searchList
	
	public int write( MemberBoardDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.insert("MemberBoardMapper.write", dto); 										 
		return successCount;
	}//write 

}

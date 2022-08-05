package kr.co.ictedu.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.board.member.MemberBoardDTO;
import kr.co.ictedu.util.dto.SearchDTO;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSession sqlSession;

	public int delete( ProductDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("ProductMapper.delete", dto);
		return successCount;
	}//delete

	public void incrementViewCnt( String prdt_no ) {
		sqlSession.update("ProductMapper.incrementViewCnt", prdt_no);
	}//incrementViewCnt

	public ProductDTO detail( String prdt_no ) {
		ProductDTO dto = null;
		dto = sqlSession.selectOne("ProductMapper.detail", prdt_no);
		return dto;
	}//detail

	public List<ProductDTO> searchList( SearchDTO dto ) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("ProductMapper.selectList", dto);
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("ProductMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount

	public int insert(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("ProductMapper.insert", dto);
		return successCount;
	}//insert

}//class

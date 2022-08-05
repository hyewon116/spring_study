package kr.co.ictedu.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.SearchDTO;

@Service
public class ProductService {

	@Autowired
	private ProductDAO dao;

	public int delete( ProductDTO dto ) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete

	public ProductDTO detail( String prdt_no ) {
		dao.incrementViewCnt( prdt_no );

		ProductDTO dto = null;
		dto = dao.detail( prdt_no );
		return dto;
	}//detail

	public List<ProductDTO> searchList( SearchDTO dto ) {
		List<ProductDTO> list = null;
		list = dao.searchList( dto );
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount

	public int insert( ProductDTO dto ) {
		int successCount = 0;
		successCount = dao.insert(dto);
		return successCount;
	}//insert

}//class

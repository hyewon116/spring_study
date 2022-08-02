package kr.co.ictedu.board.free;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FBService {

	@Autowired
	private FbDAO dao;
	
	public int fbwrite( FbDTO dto ) {
		int successCount = 0;
		successCount = dao.fbwrite(dto);
		return successCount;
	}
}

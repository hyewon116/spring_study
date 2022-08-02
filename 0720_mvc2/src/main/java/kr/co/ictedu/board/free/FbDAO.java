package kr.co.ictedu.board.free;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FbDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public int fbwrite(FbDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("FBMapper.write", dto); 
		return successCount;
	}
}

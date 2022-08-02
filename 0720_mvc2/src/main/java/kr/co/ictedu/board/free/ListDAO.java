package kr.co.ictedu.board.free;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ListDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<ListDTO> list() {
	
		List<ListDTO> list = null;
		list = sqlSession.selectList("ListMapper.list");
		return list;
	}//list
}

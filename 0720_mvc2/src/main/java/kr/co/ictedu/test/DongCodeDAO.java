package kr.co.ictedu.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DongCodeDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<DongCodeDTO> dongName( String key_word ) {
		List<DongCodeDTO> list = null;
		list = sqlSession.selectList("DongCodeMapper.dongName", key_word);
		return list;
	}//dongName
	
	public List<DongCodeDTO> dongSelect( String gugun_code ) {
		List<DongCodeDTO> list = null;
		list = sqlSession.selectList("DongCodeMapper.dongSelect", gugun_code);
		return list;
	}//dongSelect
	
	public List<DongCodeDTO> gugunSelect( String sido_code ) {
		List<DongCodeDTO> list = null;
		list = sqlSession.selectList("DongCodeMapper.gugunSelect", sido_code);
		return list;
	}//gugunSelect
	
	public List<DongCodeDTO> sidoSelect() {
		List<DongCodeDTO> list = null;
		list = sqlSession.selectList("DongCodeMapper.sidoSelect");
		return list;
	}//sidoSelect
	
}

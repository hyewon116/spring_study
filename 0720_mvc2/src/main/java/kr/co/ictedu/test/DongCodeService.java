package kr.co.ictedu.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DongCodeService {

	@Autowired
	private DongCodeDAO dao;
	
	public List<DongCodeDTO> dongName( String key_word ) {
		List<DongCodeDTO> list = null;
		list = dao.dongName( key_word );
		return list;
	}//dongName
	
	public List<DongCodeDTO> dongSelect ( String gugun_code ) {
		List<DongCodeDTO> list = null;
		list = dao.dongSelect( gugun_code );
		return list;
	}//dongSelect
	
	public List<DongCodeDTO> gugunSelect ( String sido_code ) {
		List<DongCodeDTO> list = null;
		list = dao.gugunSelect( sido_code );
		return list;
	}//gugunSelect
	
	public List<DongCodeDTO> sidoSelect() {
		List<DongCodeDTO> list = null;
		list = dao.sidoSelect();
		return list;
	}//sidoSelect
	
}//class

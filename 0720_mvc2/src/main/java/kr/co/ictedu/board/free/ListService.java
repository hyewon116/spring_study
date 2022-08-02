package kr.co.ictedu.board.free;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ListService {

	@Autowired
	private ListDAO dao;
	
	public List<ListDTO> list() {
		
		List<ListDTO> list = null; 
		list = dao.list();
		
		return list;
	}//list
}

package kr.co.ictedu.board.free;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping ( value = "/board/free")
public class ListController {
		
		@Autowired
		private ListService service;

		@RequestMapping (value = "/list_test", method = RequestMethod.GET)
		public String list( Model model ) {
			List<ListDTO> list = null;
			list = service.list();
			
			model.addAttribute("list", list);
			return "/board/free/list_test";
		}//list
}

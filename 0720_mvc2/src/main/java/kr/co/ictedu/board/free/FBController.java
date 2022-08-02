package kr.co.ictedu.board.free;

import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping ( value = "/board/free")
public class FBController {

		private static final Logger logger = LoggerFactory.getLogger(FBController.class);
		
		@Autowired
		private FBService service;

		@RequestMapping ( value = "/fbwrite", method = RequestMethod.POST )
		public void fbwrite( FbDTO dto, PrintWriter out ) {
			int successCount = 0;
			successCount = service.fbwrite(dto);
			out.print(successCount);
			out.close();
		}//fbwrite
		
		@RequestMapping ( value = "/fbwrite_form", method = RequestMethod.GET)
		public String fbwriteForm() {
			return "/board/free/fbwrite_form";
		}//fbwriteForm
}

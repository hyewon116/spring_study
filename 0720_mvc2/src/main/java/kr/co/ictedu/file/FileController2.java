package kr.co.ictedu.file;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping ( value = "/file2" )
public class FileController2 {

	private final static Logger logger = LoggerFactory.getLogger(FileController2.class);
	
	@RequestMapping( value = "/ajax_upload", method = RequestMethod.POST )
	public void ajaxUpload( FileTestDTO dto, PrintWriter out ) throws IOException {
		logger.info( dto.getTitle() );
		logger.info( dto.getContents() );
		logger.info( dto.getUpload_file().getOriginalFilename() );
		
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMdd"); //dd 꼭 소문자로!!
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);
		
		File newFolder = new File("C:/upload/" + todayNalja + "/");
		if( newFolder.exists() == false ) newFolder.mkdirs();
		
		MultipartFile file = dto.getUpload_file();
		
		InputStream is = file.getInputStream();
		FileOutputStream fos 
			= new FileOutputStream(newFolder + "/" + todaySigan + "_" + file.getOriginalFilename());
		FileCopyUtils.copy(is, fos);
		is.close();
		fos.close();
		
		dto.setUpload_file_path( newFolder + "/" + todaySigan + "_" + file.getOriginalFilename() );
		
		int successCount = 1;
		//successCount는 service 통해서 dao 통해서 DBMS에 insert한 결과 값.
		out.print(successCount);
		out.close();
	}//ajaxUpload
	
	@RequestMapping( value = "/form", method = RequestMethod.GET )
	public String form() {
		
		return "/file2/form"; //jsp file name
	}//form
	
}//class







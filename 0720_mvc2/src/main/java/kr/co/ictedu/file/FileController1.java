package kr.co.ictedu.file;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

@Controller
@RequestMapping ( value = "/file1" )
public class FileController1 {
	
	private final static Logger logger = LoggerFactory.getLogger(FileController1.class);
	
	@RequestMapping ( value="/upload4", method = RequestMethod.POST )
	public String upload4( FileTestDTO dto, Model model ) throws IOException {
		logger.info(dto.getFile_memo());
		
		Date today = new Date(); //오늘 날짜 시분초까지.
		DateFormat nalja = new SimpleDateFormat("YYYYMMdd");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);
		
		File newFolder = new File("C:/upload/" + todayNalja + "/"); 
		if( newFolder.exists() == false ) newFolder.mkdirs(); //newFolder가 없다면 만들어라.
		
		MultipartFile file = dto.getUpload_file();
		
		InputStream is = file.getInputStream();
		FileOutputStream fos 
			= new FileOutputStream(newFolder + "/" + todaySigan + "_" + file.getOriginalFilename());
		
		FileCopyUtils.copy(is,fos);
		is.close();
		fos.close();
		
		model.addAttribute( "file_content_type", file.getContentType() );
		model.addAttribute( "file_name", newFolder + todaySigan + "_" + file.getOriginalFilename() );
		model.addAttribute( "file_original_name", file.getOriginalFilename() );
		model.addAttribute( "file_size", file.getSize() );
		
		return "file1/complete"; //jsp file name	}//upload4
	}//upload4
	
	@RequestMapping ( value = "/upload3", method = RequestMethod.POST )
	public String upload3( MultipartFile file, Model model ) throws IOException {
		
		Date today = new Date(); //오늘 날짜 시분초까지.
		DateFormat nalja = new SimpleDateFormat("YYYYMMdd");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);
		
		File newFolder = new File("C:/upload/" + todayNalja + "/"); 
		if( newFolder.exists() == false ) newFolder.mkdirs(); //newFolder가 없다면 만들어라.
		
		InputStream is = file.getInputStream();
		FileOutputStream fos = new FileOutputStream(newFolder + "/" + todaySigan + "_" + file.getOriginalFilename());
		FileCopyUtils.copy(is,fos);
		is.close();
		fos.close();
		
		model.addAttribute( "file_content_type", file.getContentType() );
		model.addAttribute( "file_name", newFolder + todaySigan + "_" + file.getOriginalFilename() ) ;
		model.addAttribute( "file_original_name", file.getOriginalFilename() );
		model.addAttribute( "file_size", file.getSize() );
		
		return "file1/complete"; //jsp file name
	}//upload3
	
	@RequestMapping ( value = "/upload2", method = RequestMethod.POST ) 
	public String upload2 ( MultipartFile file, Model model ) throws IOException {
		//multipartfile name = form.jsp의 name과 같아야 함
		
		InputStream is = file.getInputStream();
		FileOutputStream fos = new FileOutputStream("C:/upload/test/" + file.getOriginalFilename()); 
		FileCopyUtils.copy(is, fos);
		is.close();
		fos.close();
		
		model.addAttribute( "file_content_type", file.getContentType() );
		model.addAttribute( "file_name", file.getName() ) ;
		model.addAttribute( "file_original_name", file.getOriginalFilename() );
		model.addAttribute( "file_size", file.getSize() );
		
		return "/file1/complete";//jsp file name
	}//upload2
	
	@RequestMapping ( value = "/upload1", method = RequestMethod.POST)
 	public String upload1( MultipartRequest multipartRequest, Model model ) {
		
		MultipartFile file = multipartRequest.getFile("upload_file_1"); //form.jsp에서 설정한 name값
		
		model.addAttribute( "file_content_type", file.getContentType() );
		model.addAttribute( "file_name", file.getName() ) ;
		model.addAttribute( "file_original_name", file.getOriginalFilename() );
		model.addAttribute( "file_size", file.getSize() );
		
		return "/file1/complete";//jsp file name
 	}//upload1
	
	@RequestMapping ( value = "/form", method = RequestMethod.GET ) 
	public String form() {
		return "/file1/form"; //jsp file name
	}//form
	
}//class






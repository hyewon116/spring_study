package kr.co.ictedu.file;

import org.springframework.web.multipart.MultipartFile;

public class FileTestDTO {
	
	private String title;
	private String contents;
	private String file_memo;
	private MultipartFile upload_file;
	private String upload_file_path; 
	
	public String getFile_memo() {
		return file_memo;
	}
	public void setFile_memo(String file_memo) {
		this.file_memo = file_memo;
	}
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getUpload_file_path() {
		return upload_file_path;
	}
	public void setUpload_file_path(String upload_file_path) {
		this.upload_file_path = upload_file_path;
	}	
	
}//class

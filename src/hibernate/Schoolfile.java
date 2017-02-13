package hibernate;

import java.sql.Timestamp;
import javax.persistence.Entity;

/**
 * Schoolfile entity. @author MyEclipse Persistence Tools
 */

@Entity
public class Schoolfile implements java.io.Serializable {

	// Fields

	private String fileid;
	
	private String filetitle;
	private String filedate;
	private String fileurl;
	private String filename;
	private String filecontent;
	private String filenumber;

	// Constructors

	/** default constructor */
	public Schoolfile() {
	}

	/** minimal constructor */
	public Schoolfile(String fileid, String filetitle, String filedate) {
		this.fileid = fileid;
		this.filetitle = filetitle;
		this.filedate = filedate;
	}

	/** full constructor */
	public Schoolfile(String fileid, String filetitle, String filedate, String fileurl, String filename,String filecontent,String filenumber) {
		this.fileid = fileid;
		this.filetitle = filetitle;
		this.filedate = filedate;
		this.fileurl = fileurl;
		this.filename = filename;
		this.filecontent = filecontent;
		this.filenumber = filenumber;
	}

	// Property accessors

	public String getFileid() {
		return this.fileid;
	}

	public void setFileid(String fileid) {
		this.fileid = fileid;
	}

	public String getFiletitle() {
		return this.filetitle;
	}

	public void setFiletitle(String filetitle) {
		this.filetitle = filetitle;
	}

	public String getFiledate() {
		return this.filedate;
	}

	public void setFiledate(String filedate) {
		this.filedate = filedate;
	}

	public String getFileurl() {
		return this.fileurl;
	}

	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}

	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilecontent() {
		return filecontent;
	}

	public void setFilecontent(String filecontent) {
		this.filecontent = filecontent;
	}

	public String getFilenumber() {
		return filenumber;
	}

	public void setFilenumber(String filenumber) {
		this.filenumber = filenumber;
	}
	
	

}
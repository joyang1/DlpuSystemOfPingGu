package hibernate;

import javax.persistence.Entity;

/**
 * Downfile entity. @author MyEclipse Persistence Tools
 */

@Entity
public class Downfile implements java.io.Serializable {

	// Fields

	private String fileid;
	private String filename;
	private String fileurl;

	// Constructors

	/** default constructor */
	public Downfile() {
	}

	/** full constructor */
	public Downfile(String fileid, String filename, String fileurl) {
		this.fileid = fileid;
		this.filename = filename;
		this.fileurl = fileurl;
	}

	// Property accessors

	public String getFileid() {
		return this.fileid;
	}

	public void setFileid(String fileid) {
		this.fileid = fileid;
	}

	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFileurl() {
		return this.fileurl;
	}

	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}

}
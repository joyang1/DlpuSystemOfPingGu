package hibernate;

import java.sql.Timestamp;
import javax.persistence.Entity;

/**
 * Notice entity. @author MyEclipse Persistence Tools
 */

@Entity
public class Notice implements java.io.Serializable {

	// Fields

	private String noticeid;
	private Integer noticetype;
	private String noticetitle;
	private String noticecontent;
	private Timestamp noticetime;

	// Constructors

	/** default constructor */
	public Notice() {
	}

	/** minimal constructor */
	public Notice(String noticeid, Integer noticetype, String noticetitle, Timestamp noticetime) {
		this.noticeid = noticeid;
		this.noticetype = noticetype;
		this.noticetitle = noticetitle;
		this.noticetime = noticetime;
	}

	/** full constructor */
	public Notice(String noticeid, Integer noticetype, String noticetitle, String noticecontent, Timestamp noticetime) {
		this.noticeid = noticeid;
		this.noticetype = noticetype;
		this.noticetitle = noticetitle;
		this.noticecontent = noticecontent;
		this.noticetime = noticetime;
	}

	// Property accessors

	public String getNoticeid() {
		return this.noticeid;
	}

	public void setNoticeid(String noticeid) {
		this.noticeid = noticeid;
	}

	public Integer getNoticetype() {
		return this.noticetype;
	}

	public void setNoticetype(Integer noticetype) {
		this.noticetype = noticetype;
	}

	public String getNoticetitle() {
		return this.noticetitle;
	}

	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}

	public String getNoticecontent() {
		return this.noticecontent;
	}

	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}

	public Timestamp getNoticetime() {
		return this.noticetime;
	}

	public void setNoticetime(Timestamp noticetime) {
		this.noticetime = noticetime;
	}

}
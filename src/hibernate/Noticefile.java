package hibernate;

import javax.persistence.Entity;

/**
 * Noticefile entity. @author MyEclipse Persistence Tools
 */

@Entity
public class Noticefile implements java.io.Serializable {

	// Fields

	private String noticefileid;
	private String noticeid;
	private String noticetitle;
	private String noticeurl;

	// Constructors

	/** default constructor */
	public Noticefile() {
	}

	/** full constructor */
	public Noticefile(String noticefileid, String noticeid, String noticetitle, String noticeurl) {
		this.noticefileid = noticefileid;
		this.noticeid = noticeid;
		this.noticetitle = noticetitle;
		this.noticeurl = noticeurl;
	}

	// Property accessors

	public String getNoticefileid() {
		return this.noticefileid;
	}

	public void setNoticefileid(String noticefileid) {
		this.noticefileid = noticefileid;
	}

	public String getNoticeid() {
		return this.noticeid;
	}

	public void setNoticeid(String noticeid) {
		this.noticeid = noticeid;
	}

	public String getNoticetitle() {
		return this.noticetitle;
	}

	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}

	public String getNoticeurl() {
		return this.noticeurl;
	}

	public void setNoticeurl(String noticeurl) {
		this.noticeurl = noticeurl;
	}

}
package hibernate;

import java.sql.Timestamp;
import javax.persistence.Entity;

/**
 * News entity. @author MyEclipse Persistence Tools
 */

@Entity
public class News implements java.io.Serializable {

	// Fields

	private String newsid;
	private String newstitle;
	private String newscontent;
	private Timestamp newstime;
	private String newsfiletitle;
	private String newsfileurl;

	// Constructors

	/** default constructor */
	public News() {
	}

	/** minimal constructor */
	public News(String newsid, String newstitle, Timestamp newstime) {
		this.newsid = newsid;
		this.newstitle = newstitle;
		this.newstime = newstime;
	}

	/** full constructor */
	public News(String newsid, String newstitle, String newscontent, Timestamp newstime, String newsfiletitle, String newsfileurl) {
		this.newsid = newsid;
		this.newstitle = newstitle;
		this.newscontent = newscontent;
		this.newstime = newstime;
		this.newsfiletitle = newsfiletitle;
		this.newsfileurl = newsfileurl;
	}

	// Property accessors

	public String getNewsid() {
		return this.newsid;
	}

	public void setNewsid(String newsid) {
		this.newsid = newsid;
	}

	public String getNewstitle() {
		return this.newstitle;
	}

	public void setNewstitle(String newstitle) {
		this.newstitle = newstitle;
	}

	public String getNewscontent() {
		return this.newscontent;
	}

	public void setNewscontent(String newscontent) {
		this.newscontent = newscontent;
	}

	public Timestamp getNewstime() {
		return this.newstime;
	}

	public void setNewstime(Timestamp newstime) {
		this.newstime = newstime;
	}

	public String getNewsfiletitle() {
		return this.newsfiletitle;
	}

	public void setNewsfiletitle(String newsfiletitle) {
		this.newsfiletitle = newsfiletitle;
	}

	public String getNewsfileurl() {
		return this.newsfileurl;
	}

	public void setNewsfileurl(String newsfileurl) {
		this.newsfileurl = newsfileurl;
	}

}
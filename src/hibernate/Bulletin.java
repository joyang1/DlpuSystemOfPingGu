package hibernate;

import java.sql.Timestamp;
import javax.persistence.Entity;

/**
 * Bulletin entity. @author MyEclipse Persistence Tools
 */

@Entity
public class Bulletin implements java.io.Serializable {

	// Fields

	private String bulletinid;
	private String bulletintitle;
	private Timestamp bulletindate;
	private String bulletinurl;
	private String bulletinfilename;

	// Constructors

	/** default constructor */
	public Bulletin() {
	}

	/** minimal constructor */
	public Bulletin(String bulletinid, String bulletintitle, Timestamp bulletindate) {
		this.bulletinid = bulletinid;
		this.bulletintitle = bulletintitle;
		this.bulletindate = bulletindate;
	}

	/** full constructor */
	public Bulletin(String bulletinid, String bulletintitle, Timestamp bulletindate, String bulletinurl, String bulletinfilename) {
		this.bulletinid = bulletinid;
		this.bulletintitle = bulletintitle;
		this.bulletindate = bulletindate;
		this.bulletinurl = bulletinurl;
		this.bulletinfilename = bulletinfilename;
	}

	// Property accessors

	public String getBulletinid() {
		return this.bulletinid;
	}

	public void setBulletinid(String bulletinid) {
		this.bulletinid = bulletinid;
	}

	public String getBulletintitle() {
		return this.bulletintitle;
	}

	public void setBulletintitle(String bulletintitle) {
		this.bulletintitle = bulletintitle;
	}

	public Timestamp getBulletindate() {
		return this.bulletindate;
	}

	public void setBulletindate(Timestamp bulletindate) {
		this.bulletindate = bulletindate;
	}

	public String getBulletinurl() {
		return this.bulletinurl;
	}

	public void setBulletinurl(String bulletinurl) {
		this.bulletinurl = bulletinurl;
	}

	public String getBulletinfilename() {
		return this.bulletinfilename;
	}

	public void setBulletinfilename(String bulletinfilename) {
		this.bulletinfilename = bulletinfilename;
	}

}